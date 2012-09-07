 /* ----------------------------------------------------------------------------------------------- */
 /* 																								*/
 /* 	This file is part of MAGE / pHTS( the performative HMM-based speech synthesis system )		*/
 /* 																								*/
 /* 	MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms		*/
 /* 	of the GNU General Public License as published by the Free Software Foundation, either		*/
 /* 	version 3 of the license, or any later version.												*/
 /* 																								*/
 /* 	MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;	*/	
 /* 	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	*/
 /* 	See the GNU General Public License for more details.										*/
 /* 																								*/	
 /* 	You should have received a copy of the GNU General Public License along with MAGE / pHTS.	*/ 
 /* 	If not, see http://www.gnu.org/licenses/													*/
 /* 																								*/
 /* 																								*/	
 /* 	Copyright 2011 University of Mons :															*/
 /* 																								*/	
 /* 			Numediart Institute for New Media Art( www.numediart.org )							*/
 /* 			Acapela Group ( www.acapela-group.com )												*/
 /* 																								*/
 /* 																								*/
 /* 	 Developed by :																				*/
 /* 																								*/
 /* 		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
 /* 																								*/
 /* ----------------------------------------------------------------------------------------------- */

/** 
 * 	 @file	Mage.cpp
 * 	 @author M. Astrinaki
 */

#include "mage.h"

// constructor
MAGE::Mage::Mage( void )
{
	init();
}

MAGE::Mage::Mage( std::string EngineName, std::string confFilename )
{		
	init();
	addEngine( EngineName, confFilename );
}

MAGE::Mage::Mage( std::string EngineName, int argc, char ** argv )
{	
	init();
	addEngine( EngineName, argc, argv );
}

// destructor
MAGE::Mage::~Mage( void )
{
	// --- Queues ---
	delete this->labelQueue;
	delete this->modelQueue;
	delete this->frameQueue;
		
	// --- SPTK Vocoder ---
	delete this->vocoder;

	//free memory for all Engine allocated by addEngine
	map< std::string, Engine * >::const_iterator it;

	for( it = this->engine.begin(); it != this->engine.end(); it++ )
	{
		delete (*it).second;
	}
}

// getters
double MAGE::Mage::getPitch ( void )
{
	return( this->vocoder->getPitch() );
}

double MAGE::Mage::getAlpha ( void )
{
	return( this->vocoder->getAlpha() );
}

double MAGE::Mage::getGamma ( void )
{
	return( this->vocoder->getGamma() );
}

double MAGE::Mage::getPOrder ( void )
{
	return( this->vocoder->getPadeOrder() );
}

double MAGE::Mage::getVolume( void )
{
	return( this->vocoder->getVolume() );
}

double MAGE::Mage::getDuration( void )
{
	return( this->model->getDuration() );
}

// setters
void MAGE::Mage::setPitch ( double pitch, int action )
{	
	this->vocoder->setPitch( pitch, action );
	return;
}

void MAGE::Mage::setSpeed ( double speed, int action )
{
	switch( action )
	{
		case MAGE::overwrite:
			this->hopLen = speed;
			break;
			
		case MAGE::shift:
			this->hopLen = ( this->hopLen ) + ( speed ); 
			break;
			
		case MAGE::scale:
			this->hopLen = ( this->hopLen ) * ( speed ); 
			break;
			
		case MAGE::synthetic:
		case MAGE::noaction:
		default:
			this->hopLen = defaultFrameRate;
	}
	
	if( hopLen < 1 )
		hopLen = 1;

	if( hopLen > defaultFrameRate * 20 )
		hopLen = defaultFrameRate * 20;
	
	return;
}

void MAGE::Mage::setAlpha ( double alpha )
{
	this->vocoder->setAlpha( alpha );
	return;
}

void MAGE::Mage::setGamma ( double gamma )
{
	this->vocoder->setGamma( gamma );
	return;
}

void MAGE::Mage::setPOrder ( double pOrder )
{
	this->vocoder->setPadeOrder( pOrder );
	return;
}

void MAGE::Mage::setVolume( double volume )
{
	this->vocoder->setVolume( volume );
	return;
}

void MAGE::Mage::setDuration( int * updateFunction, int action )
{
	this->action = action;
	this->updateFunction = updateFunction;
	return;
}

void MAGE::Mage::setDefaultEngine( std::string adefaultEngine )
{
	map< std::string, Engine * >::const_iterator it;
	
	it = this->engine.find( adefaultEngine );
	
	if( it != this->engine.end() )
		this->defaultEngine = adefaultEngine;
	return;
}

// methods
void MAGE::Mage::parseConfigFile( std::string confFilename )
{
	int k = 0;
	string line, s;
	ifstream confFile( confFilename.c_str() );
	
	if( !confFile.is_open() )
	{
		printf( "could not open file %s",confFilename.c_str() );
		return;
	}
	
	// configuration arguments
	this->argv	= ( char ** ) calloc( maxNumOfArguments,sizeof( char * ) );
	
	while( getline( confFile, line ) )
	{
		istringstream iss( line );
		while( getline( iss, s, ' ' ) )
		{
			if( s.c_str()[0] != '\0')
			{
				this->argv[k] = new char[maxStrLen];  // ATTENTION!!! FREE!!! DISALLOCATE!!!
				strcpy(this->argv[k], s.c_str() ); 
				k++;
			}
		}
	}
	confFile.close();

	this->argc = k;

	return;
}

void MAGE::Mage::init( void )
{	
	// --- Queues ---	
	this->labelQueue = new MAGE::LabelQueue( maxLabelQueueLen );
	this->modelQueue = new MAGE::ModelQueue( maxModelQueueLen );
	this->frameQueue = new MAGE::FrameQueue( maxFrameQueueLen );
	
	// --- SPTK Vocoder ---
	this->vocoder = new MAGE::Vocoder::Vocoder();
	
	// --- Label ---
	this->labelQueue->get( this->label );
	
	this->flag = true;
	this->labelSpeed = 1;
	this->sampleCount = 0;
	
	this->action = noaction;
	this->defaultEngine = "";
	this->updateFunction = NULL; // !!!
	this->hopLen = defaultFrameRate;
	return;
}

void MAGE::Mage::run( void )
{
	if( this->popLabel() )
	{
		this->prepareModel();
		this->computeDuration();
		this->updateDuration ();
		this->computeParameters ();
		this->optimizeParameters();
	}
		
	return;
}

void MAGE::Mage::pushLabel( Label label )
{
	if( !this->labelQueue->isFull() )
		this->labelQueue->push( label );
	else 
		printf( "label queue is full !\n%s", label.getQuery().c_str() );
	
	return;
}

bool MAGE::Mage::popLabel( void )
{
	if( !this->labelQueue->isEmpty() )
	{
		this->labelQueue->pop( this->label );
		this->label.setSpeed ( this->labelSpeed );
		return( true );
	}
	else
		usleep( 100 );
	
	return( false );
}

void MAGE::Mage::prepareModel( void )
{
	this->model = this->modelQueue->next();
	this->model->checkInterpolationWeights( this->engine[this->defaultEngine] );
	return;
}

void MAGE::Mage::checkInterpolationWeights( bool forced )
{
	this->model->checkInterpolationWeights( this->engine[this->defaultEngine], forced );
	return;
}

void MAGE::Mage::computeDuration( void )
{
	printf("%s\n", this->defaultEngine.c_str());
	this->model->computeDuration( this->engine[this->defaultEngine], &(this->label) );
	return;
}

void MAGE::Mage::updateDuration( void )
{
	this->model->updateDuration( this->updateFunction, this->action ); 
	this->action = noaction;
	this->updateFunction = NULL;
	return;
}

void MAGE::Mage::computeParameters( void )
{
	this->model->computeParameters( this->engine[this->defaultEngine], &(this->label) );
	this->model->computeGlobalVariances( this->engine[this->defaultEngine], &(this->label) );

	this->modelQueue->push( );

	return;
}

void MAGE::Mage::optimizeParameters( void )
{
	if( this->modelQueue->getNumOfItems() > nOfLookup + nOfBackup )
	{
		this->flag = false;
		this->modelQueue->optimizeParameters( this->engine[this->defaultEngine], nOfBackup, nOfLookup );
		this->modelQueue->generate( this->frameQueue, nOfBackup );				
		this->modelQueue->pop();
	} 
	else if( this->modelQueue->getNumOfItems() > nOfLookup && this->flag )
	{
		this->modelQueue->optimizeParameters( this->engine[this->defaultEngine], this->modelQueue->getNumOfItems() - nOfLookup - 1, nOfLookup );
		this->modelQueue->generate( this->frameQueue, this->modelQueue->getNumOfItems() - nOfLookup - 1 );	
	}	
	return; 
}

void MAGE::Mage::resetVocoder( void )
{
	this->vocoder->reset();
	return;
}

void MAGE::Mage::reset( void )
{	
	this->flag = true;
	this->labelSpeed = 1;
	this->sampleCount = 0;
	this->action = noaction;
	this->updateFunction = NULL;
	this->hopLen = defaultFrameRate;

	this->resetVocoder();	
	return;
}

void MAGE::Mage::updateSamples( void )
{
	if( this->sampleCount >= this->hopLen-1 ) // if we hit the hop length
	{	
		if( !this->frameQueue->isEmpty() )
		{			
			this->vocoder->push( this->frameQueue->get() );
			this->frameQueue->pop();
		}
		this->sampleCount = 0; // and reset the sample count for next time
	} 
	else 
		this->sampleCount++; // otherwise increment sample count
	
 	return;
}

void MAGE::Mage::addEngine( std::string EngineName )
{
	// check that the Engine doesn't exist already
	map< std::string, Engine * >::const_iterator it;

	it = this->engine.find( EngineName );

	// then we need to decide what to do:
	//  - nothing, directly return
	//  - overwrite the existing Engine with a new one
	// we could try to modify "load()" so that it can be called a second time
	// on existing Engine instead of doing a 'delete' and then a 'new'
	// (or write a "reload()" function ?)
	if( it != this->engine.end() )
	{
		printf("ATTENTION: Engine %s already exists, overwriting it\n",EngineName.c_str());
		//free existing engine
		delete this->engine[EngineName];
	}

	this->engine[EngineName] = new MAGE::Engine();
	this->engine[EngineName]->load( this->argc, this->argv);

	if( this->defaultEngine.empty() )
	{
		this->defaultEngine = EngineName;
		printf("default Engine is %s\n",this->defaultEngine.c_str());
	}

 	return;
}

void MAGE::Mage::addEngine( std::string EngineName, int argc, char ** argv )
{
	this->argc = argc;
	this->argv = argv;

	addEngine( EngineName );
	
	return;
}

void MAGE::Mage::addEngine( std::string EngineName, std::string confFilename )
{
	parseConfigFile( confFilename );

	addEngine( EngineName );

 	return;
}

void MAGE::Mage::removeEngine( std::string EngineName )
{
	map< std::string, Engine * >::iterator it;

	it = this->engine.find( EngineName );

	if( it != this->engine.end() )
	{
		printf("removing Engine %s\n",( * it ).first.c_str());
		delete ( * it ).second;//free memory by calling ~Engine
		this->engine.erase( it );//remove from std::map

		// TODO add checks for this->engine.empty() in other part of code ?
		if( this->engine.empty() )
		{
			printf("ATTENTION: Mage::removeEngine(): no Engine remaining, defaultEngine is now undefined (was %s)\n",EngineName.c_str());
			this->defaultEngine = "";
		}
		else
		{
			if( !this->defaultEngine.compare(EngineName) )
			{//we removed the default Engine, better switch to another one
				it = this->engine.begin();
				this->defaultEngine = ( * it ).first;
			}
		}
	}

	return;
}

double MAGE::Mage::popSamples ( void )
{
	double sample; 
	
	if( this->vocoder->ready() )
	{
		sample = 0.5 * this->vocoder->pop() / 32768;
		
		if( sample > 1.0 )
			return( 1.0 );
	
		if( sample < -1.0 )
			return( -1.0 );
		
		return( sample );			
	} 
	return( 0 );
}


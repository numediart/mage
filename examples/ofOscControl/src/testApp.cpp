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
 /* 		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit	*/
 /* 																								*/
 /* ----------------------------------------------------------------------------------------------- */

/** 
 *	@file		testApp.cpp
 *
 *	@author		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
 * 			
 */

#include "testApp.h"

void testApp::setup( void )
{
	// --- OSC ---
	receiver.setup( PORT );
	
	// --- Mage ---
	
	// create mage
	this->mage = new MAGE::Mage();
	
	// add clb & awb voice models
	this->labelFile = "../../../data/labels/cmu-artic/alice01.lab";
	this->mage->addEngine( "slt", "../../../data/configFiles/cmu-artic/slt.conf" );
	
	// --- Parameter Generation Thread ---
	generate = new genThread( this->mage );
	generate->startThread();
	
	// -- OLA AND AUDIO ---
	drawSampleFrame = true; // we don't draw the sample frame at runtime

	// Question :: shouldn't we put that into mage and be independent from oF?
	sampleFrame = new float[ maxFrameLen ]();		  // allocate memory for the speech frame

	ofSoundStreamSetup( 2, 0, this, defaultSamplingRate, dacBufferLen, 4 ); // audio setup
		
	this->loop = true;
	this->fill = true;
}

void testApp::exit( void )
{
	generate->waitForThread( true );
	
	delete mage;
	delete generate;
	delete sampleFrame;
}

void testApp::update( void )
{	
	int oscGamma;
	int oscPorder;
	int oscAction;
	
	float oscSpeed;
	float oscAlpha;
	float oscPitch;
	float oscVolume;
	
	string oscEngineName;	
	string oscConfigFile;
	
	ofxOscMessage m; 
	
	double oscUpdateDuration[nOfStates];
	double oscInterpolationWeights[nOfStreams + 1];
	map < string, double * > oscInterpolationFunctions;   

	// TODO :: this has to be replaced by a function producing 
	// weights and not to use a static array of weights
	int   oscUpdateFunction[MAGE::nOfStates];

	// parsing the received OSC messages
	if( receiver.hasWaitingMessages() )
	{
		// --- Get new OSC message ---
		m.clear();
		receiver.getNextMessage( &m );
		
		// --- List of messages ---
		
		// --- Change pitch ---
		if( m.getAddress() == "/Mage/pitch" )
		{
			oscPitch = m.getArgAsFloat( 0 ); 
			oscAction = m.getArgAsInt32( 1 );
			
			this->pitch = oscPitch; 
			this->pitchAction = oscAction;
			this->mage->setPitch( this->pitch, this->pitchAction );
			// 65.406395 * ( ( oscPitch/12 ) * ( oscPitch/12 ) );
		}
		
		// --- Change alpha ---
		if( m.getAddress() == "/Mage/alpha" ) 
		{
			oscAlpha = m.getArgAsFloat( 0 );
			
			this->alpha = ofMap( oscAlpha, 0.1, 0.9, 0.1, 0.9, true );
			this->mage->setAlpha( this->alpha );
		}
		
		// --- Change gamma ---
		if( m.getAddress() == "/Mage/gamma" ) 
		{
			oscGamma = m.getArgAsFloat( 0 );
			
			this->gamma = ofMap( oscGamma, 0, 5, 0, 5, true );
			this->mage->setGamma( this->gamma );
		}		
		
		// --- Change porder ---
		if( m.getAddress() == "/Mage/porder" ) 
		{
			oscPorder = m.getArgAsFloat( 0 );
			
			this->porder = ofMap( oscPorder, 0, 5, 0, 5, true );
			this->mage->setPOrder( this->porder );
		}
		
		// --- Change speed	---
		if( m.getAddress() == "/Mage/speed" )
		{
			oscSpeed = m.getArgAsFloat( 0 );
			oscAction = m.getArgAsInt32( 1 );
			
			this->speed = oscSpeed;
			this->speedAction = oscAction;
			this->mage->setSpeed( this->speed, this->speedAction );
		}
		
		// --- Change labelSpeed ---
		if( m.getAddress() == "/Mage/lSpeed" )
		{
			oscSpeed = m.getArgAsFloat( 0 );
			
			this->speed = ofMap( oscSpeed, 0, 10, 0.1, 10, true );
			this->mage->setLabelSpeed( this->speed );
		}
		
		// --- Change volume ---
		if( m.getAddress() == "/Mage/volume" )
		{
			oscVolume = m.getArgAsFloat( 0 );
			
			this->volume = ofMap( oscVolume, 0, 5, 0, 5, true );
			this->mage->setVolume( this->volume );
		}
		
		// --- Change duration ---
		if( m.getAddress() == "/Mage/duration" ) 
		{	
			for( int i = 0; i < nOfStates; i++ )
				oscUpdateDuration[i] = m.getArgAsFloat( i );
			
			oscAction = m.getArgAsFloat( nOfStates );
		
			this->durationAction = oscAction;
			this->mage->setDuration( oscUpdateDuration, this->durationAction );
		}
		
		// --- Reset Mage ---
		if( m.getAddress() == "/Mage/resetMage" )
			this->mage->reset();
		
		// --- Reset ONLY the Vocoder ---
		if( m.getAddress() == "/Mage/resetVocoder" )
			this->mage->resetVocoder();
		
		// --- Add an Engine ---
		// (here a new voice model)
		if( m.getAddress() == "/Mage/addEngine" )
		{
			oscEngineName = m.getArgAsString( 0 );
			oscConfigFile = m.getArgAsString( 1 );
			
			this->mage->addEngine( oscEngineName, oscConfigFile );
		}
		
		// --- Change the default Engine used for the synthesis ---
		// (here change the default voice model used)
		if( m.getAddress() == "/Mage/setDefaultEngine" )
		{
			oscEngineName = m.getArgAsString( 0 );

			this->mage->setDefaultEngine( oscEngineName );
		}
		
		// --- Remove an Engine existing in the used list od engines ---
		// (here a voice model)
		if( m.getAddress() == "/Mage/removeEngine" )
		{
			oscEngineName = m.getArgAsString( 0 );
			this->mage->removeEngine( oscEngineName );
		}
		
		if( m.getAddress() == "/Mage/enableInterpolation" )
		{
			oscEngineName = m.getArgAsString( 0 );
			
			if( oscEngineName.compare("off") == 0 )
				this->mage->enableInterpolation( false );   			
			else			
			{
				for( int i = 0; i < nOfStreams + 1; i++ )
					oscInterpolationWeights[i] = m.getArgAsFloat( i + 1 );
				
				oscInterpolationFunctions[oscEngineName] = oscInterpolationWeights;				
				
				this->mage->enableInterpolation( true );  
				this->mage->setInterpolationFunctions( oscInterpolationFunctions );	
				this->mage->printInterpolationWeights();
			}
		}
		
		// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
		if( m.getAddress() == "/Mage/loop" )
		{
			this->loop = !this->loop;
			if( this->loop )
				printf( "Loop \n" );
			else 
				printf( "No Loop\n" );
		}
	}
 
	
	// TODO :: check that this is thread-safe( probably not )
	if( this->fill && this->mage->getLabelQueue()->isEmpty() && this->loop )
		fillLabelQueue();
}

void testApp::draw( void )
{	
	if( drawSampleFrame )
	{
		float xOffset = 30;
		float yOffset = 30;
		float yWidth = 300;
		
		ofNoFill();
		ofBackground( 30, 30, 30 );
		ofSetColor( 200, 200, 200 );
		
		// middle line to show the zero
		ofLine( xOffset, yOffset+( yWidth/2 ),
			   xOffset+this->mage->getSpeed(), yOffset+( yWidth/2 ) );
		
		for( int k = 1; k < this->mage->getSpeed(); k++ )
		{
			// linearly interpolated waveform to look nice on screen
			ofLine( ( k-1 ) + xOffset, ofMap( sampleFrame[k-1], -1, 1, yOffset + yWidth, yOffset ), 
							k + xOffset, ofMap( sampleFrame[k], -1, 1, yOffset + yWidth, yOffset ) );
		}
		
		// rectangle box to show where is the max
		ofRect( xOffset, yOffset, this->mage->getSpeed(), yWidth );
	}
}

void testApp::audioOut( float * outBuffer, int bufSize, int nChan )
{
	static int c, indchan;

	for( int k = 0; k < bufSize; k++ )
	{
		// generate the samples from the computed parameters taking into account the user contol
		this->mage->updateSamples();
		
		indchan = k * nChan;
		
		// get the generated samples
		outBuffer[indchan] = this->mage->popSamples();
		
		// mono --> stereo / multi-channel
		for( c = 1; c < nChan; c++ )
			outBuffer[indchan+c] = outBuffer[indchan]; 
		
		// draw samples
		if (drawSampleFrame) 
			sampleFrame[this->mage->getSampleCounter()] = outBuffer[k];
	}
}

testApp::testApp( int argc, char ** argv )
{
	this->Argc = argc; // we use this trick to pass the HTS command line flags
	this->Argv = argv; // to the openFrameworks app and use them at launch
}

void testApp::keyPressed( int key )
{

}

void testApp::keyReleased( int key )
{
}

void testApp::pushLabel()
{
	MAGE::Label label;
	
	if( !labellist.empty() )
	{
		string q = labellist.front();
		label.setQuery( q );
		
		labellist.pop();

		this->mage->pushLabel( label );
	}
}

void testApp::fillLabelQueue()
{	
	MAGE::Label label;
	
	string s( this->labelFile );
	parsefile( s );
	
	this->fill = false;
	
	while( !labellist.empty() )
	{
		string q = labellist.front();
		label.setQuery( q );
				
		labellist.pop();
		
		this->mage->pushLabel( label );
	}
	
	this->fill = true;
}
void testApp::parsefile( std::string filename )
{
	string line;
	ifstream myfile( filename.c_str() );
	
	if( !myfile.is_open() )
	{
		printf( "could not open file %s",filename.c_str() );
		return;
	}
	
	for( int k = 0; getline( myfile, line ); k++ )
		this->labellist.push( line );
	
	myfile.close();
	
	return;
}

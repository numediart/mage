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

#include "testApp.h"

void testApp::setup( void )
{
	// --- OSC ---
	receiver.setup( PORT );
	
	// --- Mage ---
	this->mage = new MAGE::Mage();
	this->mage->addEngine( "clb", "./inouts/clb.conf" );
	//this->mage->addEngine( "slt", "./inouts/slt.conf" );
	this->mage->addEngine( "awb", "./inouts/awb.conf" );

	// --- Parameter Generation Thread ---
	generate = new genThread( this->mage );
	generate->startThread();
	
	// -- OLA AND AUDIO ---
	drawSampleFrame = true; // we don't draw the sample frame at runtime

	olaBuffer   = new obOlaBuffer( 8 * maxFrameLen ); // allocate memory for the OLA buffer
	sampleFrame = new float[ maxFrameLen ](); // allocate memory for the speech frame

	ofSoundStreamSetup( 2, 0, this, defaultSamplingRate, dacBufferLen, 4 ); // audio setup
		
	loop = true;
	fill = true;
}

void testApp::exit( void )
{
	generate->waitForThread( true );
	
	delete mage;
	delete generate;
	delete olaBuffer;
	delete sampleFrame;
}

void testApp::update( void )
{	
	float oscSpeed;
	float oscAlpha;
	float oscPitch;
	float oscVolume;
	int   oscGamma;
	int   oscPorder;
	int   oscAction;
	int   oscUpdateFunction[MAGE::nOfStates];

	string oscEngine;	
	string oscConfigFile;

	ofxOscMessage m; 
	
	if( receiver.hasWaitingMessages() )
	{
		// --- get new OSC message ---
		m.clear();
		receiver.getNextMessage( &m );
		
		// --- THE LIST OF MESSAGES ---
		if( m.getAddress() == "/Mage/pitch" )
		{
			// --- change pitch ---
			oscPitch = m.getArgAsFloat( 0 ); 
			oscAction = m.getArgAsInt32( 1 );
			
			this->pitchAction = oscAction;
			this->pitch = oscPitch; 
			this->mage->setPitch( this->pitch, this->pitchAction );
			//65.406395 * ( ( oscPitch/12 ) * ( oscPitch/12 ) );
		}
		
		if( m.getAddress() == "/Mage/alpha" ) 
		{
			// --- change alpha ---
			oscAlpha = m.getArgAsFloat( 0 );
			this->alpha = ofMap( oscAlpha, 0.1, 0.9, 0.1, 0.9, true );
			this->mage->setAlpha( this->alpha );
		}
		
		if( m.getAddress() == "/Mage/gamma" ) 
		{
			// --- change gamma ---
			oscGamma = m.getArgAsFloat( 0 );
			this->gamma = ofMap( oscGamma, 0, 5, 0, 5, true );
			this->mage->setGamma( this->gamma );
		}		
		
		if( m.getAddress() == "/Mage/porder" ) 
		{
			// --- change porder ---
			oscPorder = m.getArgAsFloat( 0 );
			this->porder = ofMap( oscPorder, 0, 5, 0, 5, true );
			this->mage->setPOrder( this->porder );
		}
		
		if( m.getAddress() == "/Mage/speed" )
		{
			// --- change speed	---
			oscSpeed = m.getArgAsFloat( 0 );
			oscAction = m.getArgAsInt32( 1 );
			
			this->speed = oscSpeed;
			this->speedAction = oscAction;
			this->mage->setSpeed( this->speed, this->speedAction );
			printf("%f\n", this->speed);
		}
		
		if( m.getAddress() == "/Mage/lSpeed" )
		{
			// --- change labelSpeed ---
			oscSpeed = m.getArgAsFloat( 0 );
			this->speed = ofMap( oscSpeed, 0, 10, 0.1, 10, true );
			this->mage->setLabelSpeed( this->speed );
		}
		
		if( m.getAddress() == "/Mage/volume" )
		{
			// --- change volume ---
			oscVolume = m.getArgAsFloat( 0 );
			this->volume = ofMap( oscVolume, 0, 5, 0, 5, true );
			this->mage->setVolume( this->volume );
		}
		
		if( m.getAddress() == "/Mage/duration" )
		{
			// --- change duration ---
			oscAction = m.getArgAsInt32( 0 );
			
			this->durationAction = oscAction;
			int updateFunction[nOfStates] = { 1, 1, 30, 1, 1 };
			this->mage->setDuration( updateFunction, this->durationAction );
		}
		
		if( m.getAddress() == "/Mage/resetMage" )
		{
			// --- change resetMage ---
			this->mage->reset();
		}
		
		if( m.getAddress() == "/Mage/resetVocoder" )
		{
			// --- change resetVocoder ---
			this->mage->resetVocoder();
		}
		
		if( m.getAddress() == "/Mage/addEngine" )
		{
			// --- change addEngine ---
			oscEngine = m.getArgAsString( 0 );
			oscConfigFile = m.getArgAsString( 1 );
			this->engine = oscEngine;
			this->mage->addEngine( this->engine, oscConfigFile );
		}
		
		if( m.getAddress() == "/Mage/setDefaultEngine" )
		{
			// --- change setDefaultEngine ---
			oscEngine = m.getArgAsString( 0 );
			this->engine = oscEngine;
			this->mage->setDefaultEngine( this->engine );
		}
		
		if( m.getAddress() == "/Mage/removeEngine" )
		{
			// --- change removeEngine ---
			oscEngine = m.getArgAsString( 0 );
			this->engine = oscEngine;
			this->mage->removeEngine( this->engine );
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
	
	//TODO check that this is thread-safe( probably not )
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
		// ATTENTION!!! should we generate the samples from the parameters in the audio thread or befor?!  
		this->mage->updateSamples();
		
		indchan = k * nChan;
		outBuffer[indchan] = this->mage->popSamples();
		
		for( c = 1; c < nChan; c++ )
			outBuffer[indchan+c] = outBuffer[indchan]; //mono --> stereo / multi-channel
		
		if (drawSampleFrame) 
			sampleFrame[this->mage->getSampleCounter()] = outBuffer[k];
	}
}

//---

testApp::testApp( int argc, char ** argv )
{
	Argc = argc; // we use this trick to pass the HTS command line flags
	Argv = argv; // to the openFrameworks app and use them at launch
}

void testApp::keyPressed( int key )
{
	if( key == 'l' )
	{
		MAGE::Label label;
		while( !labellist.empty() )
		{
			string q = labellist.front();
			label.setQuery( q );
			
			labellist.pop();
			
			this->mage->pushLabel( label );
		}
		
		string s( this->Argv[this->Argc - 1] );
		parsefile( s );
	}
	
	if( key == 'o' )
	{
		this->loop = !this->loop;
		printf( "loop %d\n",this->loop );
	}
		
	if ( key == 'p' ) 
		pushLabel();

	if( key == 'q' )
		this->mage->enableInterpolation( true );
	if( key == 'w' )
		this->mage->enableInterpolation( false );
	
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
	
	string s( this->Argv[this->Argc - 1] );
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

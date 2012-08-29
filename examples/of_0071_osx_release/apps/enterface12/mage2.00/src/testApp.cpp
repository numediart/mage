/* --------------------------------------------------------------------------------------------	*/
/*																								*/
/*	This file is part of MAGE / pHTS( the performative HMM-based speech synthesis system )		*/
/*																								*/
/*	MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms		*/
/*	of the GNU General Public License as published by the Free Software Foundation, either		*/
/*	version 3 of the license, or any later version.												*/
/*																								*/
/*	MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;	*/	
/*	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	*/
/*	See the GNU General Public License for more details.										*/
/*																								*/	
/*	You should have received a copy of the GNU General Public License along with MAGE / pHTS.	*/ 
/*	If not, see http://www.gnu.org/licenses/													*/
/*																								*/
/*																								*/	
/*	Copyright 2011 University of Mons :															*/
/*																								*/	
/*			Numediart Institute for New Media Art( www.numediart.org )							*/
/*			Acapela Group ( www.acapela-group.com )												*/
/*																								*/
/*																								*/
/*	 Developed by :																				*/
/*																								*/
/*		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
/*																								*/
/* --------------------------------------------------------------------------------------------	*/

#include "testApp.h"

void testApp::setup( void )
{
	// --- OSC ---
	receiver.setup( PORT );
	
	// --- Mage ---
	//this->mage = new MAGE::Mage( this->Argc, this->Argv );		
	this->mage = new MAGE::Mage( "/Users/Maipn/Documents/myLibs/MAGE/examples/of_0071_osx_release/apps/enterface12/mage2.00/inouts/configSLT.conf" );		
	
	//this->mage->parseConfigFile("/Users/Maipn/Documents/myLibs/MAGE/examples/of_0071_osx_release/apps/enterface12/mage2.00/inouts/configSLT.conf");
	// --- Parameter Generation Thread ---
	generate = new genThread( this->mage );
	generate->startThread();
	
	// -- OLA AND AUDIO ---
	drawSampleFrame = true; // we don't draw the sample frame at runtime
	frameLen = defaultFrameRate * 2;
	hopLen = defaultFrameRate;
	sampleCount = 0; // initialize OLA variables
	olaBuffer = new obOlaBuffer( 8 * maxFrameLen ); // allocate memory for the OLA buffer
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
	static int oscAction;
	static float oscSpeed;
	static float oscAlpha;
	static float oscPitch;
	static float oscVolume;

	static ofxOscMessage m; 
	
	if( receiver.hasWaitingMessages() )
	{
		// --- get new OSC message ---
		m.clear();
		receiver.getNextMessage( &m );
		
		// --- THE LIST OF MESSAGES ---
		
		if( m.getAddress() == "/speed" )
		{
			// --- change speed	---
			oscSpeed = m.getArgAsFloat( 0 );
			//speed = ofMap( oscSpeed, 0, 3, 0.1, 3, true );
			//setSpeed( speed );
			
			hopLen = ( oscSpeed > 1 ) ? oscSpeed : 1;
			//printf( "speed : %d\n", hopLen );
			
			hopLen = ( int )defaultFrameRate/oscSpeed;
			
			if( hopLen < 1 )
				hopLen = 1;
		
 			if( hopLen > defaultFrameRate * 20 )
				hopLen = defaultFrameRate * 20;
		}
		
		if( m.getAddress() == "/alpha" )
		{
			// --- change alpha ---
			oscAlpha = m.getArgAsFloat( 0 );
			alpha = ofMap( oscAlpha, 0.1, 0.9, 0.1, 0.9, true );
			//printf( "alpha : %f\n", alpha );
			this->mage->setAlpha( alpha );
		}
		
		if( m.getAddress() == "/volume" )
		{
			// --- change volume ---
			oscVolume = m.getArgAsFloat( 0 );
			volume = ofMap( oscVolume, 0, 5, 0, 5, true );
			//printf( "volume : %f\n", volume );
			this->mage->setVolume( volume );
		}
		
		if( m.getAddress() == "/pitch" )
		{
			// --- change pitch ---
			oscPitch = m.getArgAsFloat( 0 ); 
			oscAction = m.getArgAsFloat( 1 );
			
			if( oscAction == overwrite )
			{
				pitch = 65.406395 *( ( oscPitch/12 )*( oscPitch/12 ) );
				printf( "pitch_overwrite : %f\n", pitch );
				this->mage->setPitch( pitch, overwrite );
			}
			
			if( oscAction == shift )
			{
				//pitch = ofMap( oscPitch, -3, 3, -3, 3, true );
				pitch = 65.406395 *( ( oscPitch/12 )*( oscPitch/12 ) );
				printf( "pitch_shift : %f\n", pitch );
				this->mage->setPitch( pitch, shift );				
			}
			
			if( oscAction == scale )
			{
				pitch = ofMap( oscPitch, -3, 3, -3, 3, true );
				//printf( "pitch_scale : %f\n", pitch );
				this->mage->setPitch( pitch, scale );				
			}
		}
		
		if( m.getAddress() == "/reset" )
		{
			this->mage->resetVocoder();
			hopLen = defaultFrameRate;
			printf( "Reset \n" );
		}
		
		if( m.getAddress() == "/loop" )
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
			   xOffset+hopLen, yOffset+( yWidth/2 ) );
		
		for( int k = 1; k < hopLen; k++ )
		{
			// linearly interpolated waveform to look nice on screen
			ofLine( ( k-1 ) + xOffset, ofMap( sampleFrame[k-1], -1, 1, yOffset + yWidth, yOffset ), 
							k + xOffset, ofMap( sampleFrame[k], -1, 1, yOffset + yWidth, yOffset ) );
		}
		
		// rectangle box to show where is the max
		ofRect( xOffset, yOffset, hopLen, yWidth );
	}
}

void testApp::audioOut( float *outBuffer, int bufSize, int nChan )
{
	static int c, indchan;

	for( int k = 0; k < bufSize; k++ )
	{
		// ATTENTION!!! should we generate the samples from the parameters in the audio thread or befor?!  
		if( sampleCount >= hopLen-1 ) // if we hit the hop length
		{	
			this->mage->updateSamples();
			sampleCount = 0; // and reset the sample count for next time
		} 
		else 
		{
			sampleCount++; // otherwise increment sample count
		}
		
		indchan = k * nChan;
		outBuffer[indchan] = this->mage->popSamples();
		
		for( c = 1; c < nChan; c++ )
			outBuffer[indchan+c] = outBuffer[indchan]; //mono --> stereo / multi-channel
		
		if (drawSampleFrame) 
			sampleFrame[sampleCount] = outBuffer[k];
	}
}

//---

testApp::testApp( int argc, char **argv )
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
			
			//label.setSpeed( 0.5 );
			
			labellist.pop();
			
			this->mage->pushLabel( label );
		}
		
		string s( this->Argv[this->Argc - 1] );
		parsefile( s );
	}
	
	if( key == 'a' )
		this->mage->setPitch( 440, MAGE::overwrite );
	
	if( key == 'd' )
		this->mage->setPitch( 2, MAGE::scale );
	
	if( key == 'g' )
		this->mage->setPitch( 0.5, MAGE::scale );
	
	if( key == 'h' )
		this->mage->setPitch( 1000, MAGE::shift );

	if( key == 'b' )
		this->mage->setPitch( 50, MAGE::shift );
	
	if( key == 'r' )
	{
		this->mage->resetVocoder( );
		hopLen = defaultFrameRate;
	}
	
	if( key == 'f' )
	{
		hopLen -= 10;
		if( hopLen < 1 )
			hopLen = 1;
	}
	
	if( key == 's' )
	{
		hopLen += 10;
		
		if( hopLen > defaultFrameRate * 20 )
			hopLen = defaultFrameRate * 20;
	}
	
	if( key == 'o' )
	{
		this->loop = !this->loop;
		printf( "loop %d\n",this->loop );
	}

	if ( key == 'p' ) 
	{
		pushLabel();
	}
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

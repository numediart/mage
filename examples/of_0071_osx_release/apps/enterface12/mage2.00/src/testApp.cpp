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
	// --- Mage ---
	this->mage = new MAGE::Mage( this->Argc, this->Argv );	
	
	// --- OSC ---
	receiver.setup( PORT );
		
	// --- PARAMETER GENERATION THREAD ---
	generate = new genThread( this->mage->getLabelQueue(), this->mage->getModelQueue(), this->mage->getFrameQueue(), this->mage->getEngine(), this->mage->getModel() );
	generate->startThread();
	
	// -- OLA AND AUDIO ---
	drawSampleFrame = true; // we don't draw the sample frame at runtime
	frameLen = 480; 
	hopLen = 240; 
	sampleCount = 0; // initialize OLA variables
	olaBuffer = new obOlaBuffer( 8*maxFrameLen ); // allocate memory for the OLA buffer
	sampleFrame = new float[ maxFrameLen ](); // allocate memory for the speech frame
	ofSoundStreamSetup( 2, 0, this, defaultSamplingRate, dacBufferLen, 4 ); // audio setup
		
	paused = true;
	loop = true;
	fill = true;
}

void testApp::exit( void )
{
	generate->waitForThread( true );
	delete generate;
	
	delete sampleFrame;
	delete olaBuffer;
}

void testApp::update( void )
{	
	static float oscSpeed;
	static float oscAlpha;
	static float oscVolume;
	static float oscPitch;
	static int oscAction;
	
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
			
			hopLen = ( oscSpeed > 1 )? oscSpeed : 1;
			//printf( "speed : %d\n", hopLen );
			
			hopLen = ( int )240/oscSpeed;
			
			if( hopLen < 1 )
				hopLen = 1;
		
 			if( hopLen > 240*20 )
				hopLen = 240*20;
		}
		
		if( m.getAddress() == "/alpha" )
		{
			// --- change alpha ---
			oscAlpha = m.getArgAsFloat( 0 );
			alpha = ofMap( oscAlpha, 0.1, 0.9, 0.1, 0.9, true );
			//printf( "alpha : %f\n", alpha );
			this->mage->getVocoder()->setAlpha( alpha );
		}
		
		if( m.getAddress() == "/volume" )
		{
			// --- change volume ---
			oscVolume = m.getArgAsFloat( 0 );
			volume = ofMap( oscVolume, 0, 5, 0, 5, true );
			//printf( "volume : %f\n", volume );
			this->mage->getVocoder()->setVolume( volume );
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
				this->mage->getVocoder()->setPitch( pitch, overwrite );
			}
			
			if( oscAction == shift )
			{
				//pitch = ofMap( oscPitch, -3, 3, -3, 3, true );
				pitch = 65.406395 *( ( oscPitch/12 )*( oscPitch/12 ) );
				printf( "pitch_shift : %f\n", pitch );
				this->mage->getVocoder()->setPitch( pitch, shift );				
			}
			
			if( oscAction == scale )
			{
				pitch = ofMap( oscPitch, -3, 3, -3, 3, true );
				//printf( "pitch_scale : %f\n", pitch );
				this->mage->getVocoder()->setPitch( pitch, scale );				
			}
		}
		
		if( m.getAddress() == "/reset" )
		{
			this->mage->getVocoder()->reset();
			hopLen = 240;
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
	for( int k = 0; k < bufSize; k++ )
	{
		if( sampleCount >= hopLen-1 )
		{ // if we hit the hop length			
			if( !this->mage->getFrameQueue()->isEmpty() )
			{				 
				this->mage->getFrameQueue()->pop( &frame, 1 ); // we pop a speech parameter frame
				
				//any modification to f0 can go here
				//frame.f0 = frame.f0*f0scale + f0shift;
				this->mage->getVocoder()->push( frame );
				
				//use the two lines below instead to generate unvoiced speech
				//vocoder->push( frame,true );
				//vocoder->setVoiced( false );
				
				//vocoder->setPitch( 0.1, scale, false );
				//vocoder->setAlpha( -1 );
				//vocoder->setVolume( 9 );
				
				paused = false;
			} 
			else 
			{
				paused = true;
			}
			
			//olaBuffer->ola( sampleFrame, frameLen, k ); // OLA the frame
			sampleCount = 0; // and reset the sample count for next time
		} 
		else 
		{
			sampleCount++; // otherwise increment sample count
		}
		
		int indchan = k * nChan;
		
		if( this->mage->getVocoder()->ready() )
		{
			outBuffer[indchan] = 0.5 * this->mage->getVocoder()->pop() / 32768;
			
			if( outBuffer[indchan] > 1.0 )
			{
				outBuffer[indchan] = 1.0;
			} 
			else if( outBuffer[indchan] < -1.0 )
			{
				outBuffer[indchan] = -1.0;
			}
			
			outBuffer[indchan + 1] = outBuffer[indchan];
		}
		sampleFrame[sampleCount] = outBuffer[k];
	}
	
	if( !paused )
	{
		//	FILE *file;
		//
		//	file = fopen( "out.raw", "ab" );
		//	fwrite( outBuffer, sizeof( float ), bufSize, file );
		//
		//	fclose( file );
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
		
		//	MAGE::Label label( "x^x-pau+ae=l@x_x/A:0_0_0/B:x-x-x@x-x&x-x#x-x$x-x!x-x;x-x|x/C:1+1+2/D:0_0/E:x+x@x+x&x+x#x+x/F:content_2/G:0_0/H:x=x^1=10|0/I:19=12/J:79+57-10" );
		//	MAGE::Label label;
		//	label.setQuery( "x^x-pau+ae=l@x_x/A:0_0_0/B:x-x-x@x-x&x-x#x-x$x-x!x-x;x-x|x/C:1+1+2/D:0_0/E:x+x@x+x&x+x#x+x/F:content_2/G:0_0/H:x=x^1=10|0/I:19=12/J:79+57-10" );
		//	label.setQuery( "x^pau-ae+l=ax@1_2/A:0_0_0/B:1-1-2@1-2&1-19#1-10$1-5!0-2;0-8|ae/C:0+0+2/D:0_0/E:content+2@1+12&1+6#0+2/F:aux_1/G:0_0/H:19=12^1=10|L-H%/I:3=3/J:79+57-10" );
		//	if( !labelQueue->isFull() )labelQueue->push( label );
		//	else printf( "label queue is full !\n" );
		
		MAGE::Label label;
		while( !labellist.empty() )
		{
			string q = labellist.front();
			label.setQuery( q );
			
			//label.setSpeed( 0.5 );
			
			labellist.pop();
			
			if( !this->mage->getLabelQueue()->isFull() )
				this->mage->getLabelQueue()->push( label );
			else 
				printf( "label queue is full !\n%s",q.c_str() );
		}
		
		string s( this->Argv[this->Argc - 1] );
		parsefile( s );
	}
	
	if( key == 'a' )
	{
		this->mage->getVocoder()->setPitch( 440, MAGE::overwrite );
	}
	
	if( key == 'd' )
	{
		this->mage->getVocoder()->setPitch( 2, MAGE::scale );
	}
	
	if( key == 'g' )
	{
		this->mage->getVocoder()->setPitch( 0.5, MAGE::scale );
	}
	
	if( key == 'h' )
	{
		this->mage->getVocoder()->setPitch( 1000, MAGE::shift );
	}
	if( key == 'b' )
	{
		this->mage->getVocoder()->setPitch( 50, MAGE::shift );
	}
	
	if( key == 'r' )
	{
		this->mage->getVocoder()->reset();
		hopLen = 240;
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
		
		if( hopLen > 240 * 20 )
			hopLen = 240 * 20;
	}
	
	if( key == 'o' )
	{
		this->loop = !this->loop;
		printf( "loop %d\n",this->loop );
	}
}

void testApp::keyReleased( int key )
{
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
		
		//label.setSpeed( 0.5 );
		
		labellist.pop();
		
		if( !this->mage->getLabelQueue()->isFull() )
			this->mage->getLabelQueue()->push( label );
		else 
			printf( "label queue is full !\n%s",q.c_str() );
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

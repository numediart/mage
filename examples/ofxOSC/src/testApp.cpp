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
#if mode == HTS
	this->labelFile = "../../data/labels/alice01.lab";
	this->mage->addEngine( "slt", "../../data/configFiles/slt.conf" );
	//this->mage->addEngine( "bdl", "../data/voiceConfig/bdl.conf" );
	//this->mage->addEngine( "awb", "./data/voiceConfig/awb.conf" );
	//this->mage->enableInterpolation(true);
#endif

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
	string oscEngineName;	
	//string oscConfigFile = "../../data/voiceConfig/";
	string oscConfigFile = "../../data/voiceConfig/VBconfigs/";
	
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
		// --- Remove an Engine existing in the used list od engines ---
		// (here a voice model)
		if( m.getAddress() == "/Mage/reset" )
		{
			this->mage->reset();
		}
		
		if( m.getAddress() == "/Mage/enableInterpolation" )
		{
			int nofArgs = m.getNumArgs();
						
			if( nofArgs >= 1 )		
			{
				oscEngineName = m.getArgAsString( 0 );
				if( oscEngineName.compare("off") == 0 )
				{
					this->mage->enableInterpolation( false ); 
				}
				else
				{
					//if( nofArgs > maxNumOfInterpolationEngines)
					//	nofArgs = maxNumOfInterpolationEngines;
					
					this->mage->resetInterpolationWeights();

					for( int i = 0; i < nOfStreams + 1; i++ )
						oscInterpolationWeights[i] = (double)1/nofArgs;
					
					for( int i = 0; i < nofArgs; i++ )
					{
						oscEngineName = m.getArgAsString( i );
						printf("inerp engine : %s\n", oscEngineName.c_str() );
						
						this->mage->addEngine( oscEngineName, oscConfigFile + "p" + oscEngineName.c_str() + ".conf" );
											
						oscInterpolationFunctions[oscEngineName] = oscInterpolationWeights;	
					}
					
					oscEngineName = m.getArgAsString( 0 );
					this->mage->setDefaultEngine( oscEngineName );
					
					this->mage->setInterpolationFunctions( oscInterpolationFunctions );	
					this->mage->enableInterpolation( true );

					//this->mage->printInterpolationWeights();
					
				}
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
		
		string s( this->labelFile );
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
	
/*	if( key == 'e' )
	{
		map < string, double * > interpolationFunctions;   
		
		double a[nOfStreams + 1] = { 1.5, 0.25, 0.5, 0 }; //{ 0.25, 0.75, 0.25, 0.75 };
		interpolationFunctions["clb"] = a;
		
		double b[nOfStreams + 1] = { 1, 1.5, 1, 1 }; //{ 0.75, 0.25, 0.75, 0.25 };
		interpolationFunctions["awb"] = b;
		
		this->mage->setInterpolationFunctions( interpolationFunctions );	
		
	}
*/	
	if( key == '1' )
		this->mage->printInterpolationWeights();

	if( key == 'r' )
		this->mage->reset();
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

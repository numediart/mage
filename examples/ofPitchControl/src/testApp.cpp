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
	
	// gui 
	slider_pitch_overwrite.setSize(WIDTH/RATIO, HIGHT);
	slider_pitch_overwrite.setPos(X_POS, Y_POS);
	
	slider_pitch_shift.setSize(WIDTH/RATIO, HIGHT);
	slider_pitch_shift.setPos(X_POS, 2*Y_POS);
	
	slider_pitch_scale.setSize(WIDTH/RATIO, HIGHT);
	slider_pitch_scale.setPos(X_POS, 3*Y_POS);
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
	// --- Change pitch ---
	if( slider_pitch_overwrite.isMouseDown() )
	{
		this->pitchAction = MAGE::overwrite;
		this->pitch = ofMap( slider_pitch_overwrite.getPosX(), X_POS, X_POS+WIDTH-WIDTH/RATIO, MINPITCH, MAXPITCH );

		this->mage->setPitch( this->pitch, this->pitchAction );
	}
	
	if( slider_pitch_shift.isMouseDown() )
	{
		this->pitchAction = MAGE::shift;
		this->pitch = ofMap( slider_pitch_shift.getPosX(), X_POS, X_POS+WIDTH-WIDTH/RATIO, MINPITCH/5, MAXPITCH/5 );
		
		this->mage->setPitch( this->pitch, this->pitchAction );
	}
	
	if( slider_pitch_scale.isMouseDown() )
	{
		this->pitchAction = MAGE::scale;
		this->pitch = ofMap( slider_pitch_scale.getPosX(), X_POS, X_POS+WIDTH-WIDTH/RATIO, MINPITCH/100+1, MAXPITCH/100 );
		
		this->mage->setPitch( this->pitch, this->pitchAction );
	}
			
	// TODO :: check that this is thread-safe( probably not )
	if( this->fill && this->mage->getLabelQueue()->isEmpty() && this->loop )
		fillLabelQueue();
}

void testApp::draw( void )
{
	// mage
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
	
	// gui
	ofFill();
	ofSetColor( 200, 200, 200 );
	ofRect(X_POS-1, Y_POS-1, WIDTH+2, HIGHT+2);	
	ofRect(X_POS-1, 2*Y_POS-1, WIDTH+2, HIGHT+2);	
	ofRect(X_POS-1, 3*Y_POS-1, WIDTH+2, HIGHT+2);	

	ofSetColor( 50, 50, 50 );
	ofRect(X_POS, Y_POS, WIDTH, HIGHT);
	ofRect(X_POS, 2*Y_POS, WIDTH, HIGHT);
	ofRect(X_POS, 3*Y_POS, WIDTH, HIGHT);

	slider_pitch_shift.setPosY(2*Y_POS);
	slider_pitch_scale.setPosY(3*Y_POS);
	
	ofSetColor( 200, 200, 200 );
	ofDrawBitmapString( "overwrite pitch", X_POS, Y_POS+Y_POS/2 );
	ofDrawBitmapString( "shift pitch", X_POS, 2*Y_POS+Y_POS/2 );
	ofDrawBitmapString( "scale pitch", X_POS, 3*Y_POS+Y_POS/2 );
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

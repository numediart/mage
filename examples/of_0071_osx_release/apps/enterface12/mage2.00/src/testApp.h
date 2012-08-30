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

#pragma once

#include "ofMain.h"
#include "obOlaBuffer.h"
#include "mage.h"
#include "genThread.h"

#include <fstream>

// --- OSC
#include "ofxOsc.h"
#define PORT 5454 

// --- AUDIO THINGS ---
const int maxFrameLen =	4800;
const int dacBufferLen = 128;

class testApp : public ofBaseApp 
{
	public:
	
		// app callbacks
		void setup( void );
		void exit( void );
	
		// loop callbacks
		void update( void );
		void draw( void );
	
		// audio out callback
		void audioOut( float * outBuffer, int bufSize, int nChan );
		
		// app constructor
		testApp( int argc, char ** argv );
	
		// keyboard callbacks
		void keyPressed( int key );
		void keyReleased( int key );
	
		void pushLabel();
		//parse lab file line-by-line
		void fillLabelQueue();
		void parsefile( std::string filename );

	protected:
	
		int Argc;		// number of arguments passed to the main()
		char ** Argv;	// table of arguments passed to the main()
	
		// --- User controls
		float speed;
		float alpha;
		float volume;
		float pitch;
		int	  action;
	 
		// --- OSC
		ofxOscReceiver	receiver;
	
		//--- Mage
		MAGE::Mage * mage;
	
		genThread * generate;
	 
		//---
	
		float * sampleFrame;		// frame to be OLAed
		obOlaBuffer * olaBuffer; // overlap-add buffer
		int frameLen; // frame size
	//	int hopLen;	// hop size
		int sampleCount;		// sample count for triggering
		bool drawSampleFrame;	// do we show the frame
		bool loop;
		bool fill;
		
		std::queue<std::string> labellist;
};

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
 *	@file		testApp.h
 *
 *	@author		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
 * 			
 */

#pragma once

#include "ofMain.h"
#include "mage.h"
#include "genThread.h"

#include <fstream>
#include <string>

#include "MyTestObject.h"

#define MINPITCH 40
#define MAXPITCH 1000

// --- Audio ---
// ATTENTION :: should we move that in constants.h?
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
	
		// parse lab file line-by-line
		void fillLabelQueue();
		void parsefile( std::string filename );
	
		// gui
		MyTestObject slider_pitch_overwrite;
		MyTestObject slider_pitch_shift;
		MyTestObject slider_pitch_scale;
	
	protected:
	
		int Argc;		// number of arguments passed to the main()
		char ** Argv;	// table of arguments passed to the main()
	
		// --- User controls ---
		float pitch;			// pitch value set by the user
		int	  pitchAction;		// pitchAction ( noaction, overwrite, shift, scale, synthetic ) value set by the user
	
		//--- Mage ---
		MAGE::Mage * mage;
		
		genThread * generate;
	 
		//---
		float * sampleFrame;	 // frame to be OLAed
		bool drawSampleFrame;	 // do we show the frame
		bool loop;
		bool fill;
		
		string labelFile;
		// queue of read labels
		std::queue<std::string> labellist;
};

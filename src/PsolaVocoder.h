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

/* 
 	Most of these functions come from SPTK, which is distributed under 
 	a Modified BSD License. See http://sp-tk.sourceforge.net/ for details
 */

#pragma once

#include <cstdio>
#include <vector>
#include <queue>
#include <cstring>

#include "Constants.h"
#include "Frame.h"
#include "MathFunctions.h"
#include "Vocoder.h"

#define PSOLA_MAX_T0 512*4 // 512 = about 30Hz at 16kHz, increase as needed (512*4 ~ 20Hz at 48kHz)
#define PSOLA_MAX_OUT_BUFFER_LENGTH ( 16 * PSOLA_MAX_T0 )
#define PSOLA_FRAMEQUEUE_LENGTH 64 //if hopsize is 5ms, 10 frames should be enough, but we want to preserve the ability to speed up

namespace MAGE 
{
	/** 
	 *  \brief		Definition of the PsolaVocoder.
	 *  \details	This class is used to define the PsolaVocoder used to synthesize every Frame of the output.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version	2.00
	 *  \date		2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	class PsolaVocoder : public Vocoder 
	{
		public:
		
			/**
			 *	Constructor that allocates and initializes all the parameters needed for the PsolaVocoder.
			 */
			PsolaVocoder( int am = ( nOfMGCs-1 ),		double aalpha = defaultAlpha, 
					 int afprd = defaultFrameRate,	int aiprd = defaultInterpFrameRate, 
					 int astage = defaultGamma,		int apd = defaultPadeOrder, 
					 bool angain = false );
		
			/**
			 *	Constructor that allocates and initializes all the parameters needed for the PsolaVocoder.
			 */
			PsolaVocoder( const PsolaVocoder& orig );
		
			/**
			 *	Destructor that disallocates all the memory used from the PsolaVocoder.
			 */		
			virtual ~PsolaVocoder();
		
// methods
			/**
			 *  This function generates an excitation based on the current voiced/unvoiced status and F0 value
			 * 
			 *  @return a sample that can be fed into the MLSA filter
			 */
			double excite( void );

			/**
			 *  This function generates one window-centered pulse for a 2T0-sized window
			 *
			 *  \brief In the current implementation it generates a simple window-centered pulse,
			 *         but a class that inherit from PsolaVocoder can reimplement it with more complex
			 *         form of pitch-synchronous excitation
			 *
			 *  @param length of the window (2*T0)
			 */
			virtual void makepulse( unsigned int length );

			/**
			 *	This function receives a double ** and prepare all the parameters of the MLSA filter for the next sample generation by pop().
			 *
			 *	@param frame A pointer to the double ** stream array of an instance of class Frame.
			 *	@param bool Is the frame a voiced one or not ?
			 */
			void prepare( double frame[nOfStreams][maxStreamLen], bool voiced, bool ignoreVoicing = false );

			/** 
			 *	This function resets the PsolaVocoder to its default values.
			 *
			 *	\brief It sets the internal members of the PsolaVocoder class to the constructor (defaults) values.
			 *			To be used in case the PsolaVocoder becomes irremediably unstable or to reset all the changes.
			 */		
			void reset( void );

			/** 
			 *	This function returns a single sample from the PsolaVocoder.
			 * 
			 *	@return One sample from the PsolaVocoder given current spectral coefficients and fundamental frequency.
			 */
			double pop( void );

		protected:
		
			double x;
			std::vector< std::vector<double> > c;
			std::vector< std::vector<double> > inc;
			double * cc;
			double * d;
			int head_c;
			int tail_c;

			//PSOLA stuffs
			//buffer for the 2*T0 pulse generated when calling makepulse(int) and to be overlap-added in excite()
			std::vector<double> pulse;
			//buffer for filter excitation (we cannot do sample-by-sample with PSOLA, so a buffer is needed)
			std::vector<double> source;
			int tail_s;//index of first *valid* sample in the buffer (i.e. a sample for which PSOLA is done)
			int head_s;//index of first non-valid sample in the buffer (i.e. a sample for which OLA is ongoing) 
			int p_s;//index of first empty slot in output buffer (i.e. a sample for which OLA didn't start yet)
			int n_s;//total number of samples in the buffer (i.e all samples for which OLA is done or ongoing)
			std::queue<int> hopLen;
			int hopCount;
			int countInitPop;

			double errorT0;
	};	
} // namespace


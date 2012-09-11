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
 * 	 @file	Model.h
 * 	 @author	N. d'Alessandro, M. Astrinaki
 * 	 @brief	 HMM class: a bunch of states
 */

#pragma once

#include "Constants.h"
#include "State.h"
#include "Label.h"
#include "hts.h"

#include <vector>
#include <cstring>

namespace MAGE 
{
	class ModelMemory 
	{
		public :
		
			// constructor
			ModelMemory();
		
			// destructor
			~ModelMemory();
				
			// for every state
			double * duration_mean; 
			double * duration_vari;
			int    * duration_array;
		
			// # of MGC coefficients for the MLSA filter & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
			double * mgc_mean; // [nOfDers * nOfMGCs]
			double * mgc_vari; // [nOfDers * nOfMGCs]
		
			// fundamental frequency & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
			double * lf0_mean; // [nOfDers * nOfLF0s]
			double * lf0_vari; // [nOfDers * nOfLF0s]
		
			// # of low-pass filter coefficients & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
			double * lpf_mean; // [nOfDers * nOfLPFs]
			double * lpf_vari; // [nOfDers * nOfLPFs]
			
			char strQuery[maxStrLen];
	};

	class Model 
	{	
		public :
		
			// constructor
			Model();
		
			// destructor
			~Model();
		
			// getters
			State getState( int index );
			int getDuration( void );

			//setters
			void setState( State state, int index );
			void setDuration( int duration );
		
			// methods
			void initDuration  ( void );
			void initParameters( void );
			void updateDuration( int * updateFunction, int action ); // to put a speed profile on state duration( put it inside compute duration ? )
			void computeDuration  ( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight );
			void computeParameters( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight );
			void computeGlobalVariances( MAGE::Engine * engine, MAGE::Label * label );
			void checkInterpolationWeights( MAGE::Engine * engine, bool forced = false );

		protected :
		
			int duration;
			State state[nOfStates];
			ModelMemory modelMemory;
		
			char strQuery[maxStrLen];
			bool weightsChecked;
	};
} // namespace

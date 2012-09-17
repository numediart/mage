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
 *	@file		Model.h
 *
 *	@author		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
 *
 *	@brief		HMM class: a bunch of states
 *
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
	/** 
	 *  \brief     The memory used for every model.
	 *  \details   This class is used to define the memory structures that are needed for a single model.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version   2.00 beta
	 *  \date      2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	class ModelMemory 
	{
		public :
		
			/**
			 *	Constructor that allocates the required memory for a single model.
			 */
			ModelMemory();
		
			/**
			 *	Destructor that disallocates all the memory used from a single model.
			 */	
			~ModelMemory();
				
			/** 
			 *	\var double * duration_mean.
			 *	\brief It contains the mean value of the duration for every state of a given HMM.
			 */
			double * duration_mean; 

			/** 
			 *	\var double * duration_vari.
			 *	\brief It contains the variance value of the duration for every state of a given HMM.
			 */
			double * duration_vari;
		
			/** 
			 *	\var double * duration_array.
			 *	\brief It contains the duration for every state of a given HMM.
			 */
			int * duration_array;
		
// # of MGC coefficients for the MLSA filter & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
		
			/** 
			 *	\var double * mgc_mean.
			 *	\brief It contains the mean value of the spectral stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * mgc_mean; // [nOfDers * nOfMGCs]
		
			/** 
			 *	\var double * mgc_vari.
			 *	\brief It contains the variance value of the spectral stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * mgc_vari; // [nOfDers * nOfMGCs]
		
// fundamental frequency & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
		
			/** 
			 *	\var double * lf0_mean.
			 *	\brief It contains the mean value of the spectral stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * lf0_mean; // [nOfDers * nOfLF0s]
		
			/** 
			 *	\var double * lf0_vari.
			 *	\brief It contains the variance value of the fundamental frequency stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * lf0_vari; // [nOfDers * nOfLF0s]
		
// # of low-pass filter coefficients & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
		
			/** 
			 *	\var double * lpf_mean.
			 *	\brief It contains the mean value of the low-pass filter stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * lpf_mean; // [nOfDers * nOfLPFs]
			
			/** 
			 *	\var double * lpf_vari.
			 *	\brief It contains the variance value of the low-pass filter stream (including static and dynamic features) 
			 *			for every state of a given HMM.
			 */
			double * lpf_vari; // [nOfDers * nOfLPFs]
			
			/** 
			 *	\var char strQuery.
			 *	\brief It contains the string query to retrieve the stream data (mean & variance) that corresponds to a model.
			 */
			char strQuery[maxStrLen];
	};

	class Model 
	{	
		public :
		
			/**
			 *	Constructor that allocates the required memory for a model and initiallizes the parameters used.
			 */
			Model();
		
			/**
			 *	Destructor that disallocates all the memory used from a model.
			 */
			~Model();
		
// getters

			/**
			 *	Get a model state.
			 *
			 *	@param index Number / index of the state to be returned.
			 *	@return A model state given an index.
			 */
			State getState( int index );
		
			/**
			 *	Get the total duration of the model.
			 *
			 *	@return The total duration of the model.
			 */
			int getDuration( void );

//setters
		
			/**
			 *	Set a model state.
			 *
			 *	@param state The state to be set.
			 *	@param index Number / index of the state to be set.
			 */
			void setState( State state, int index );
		
			/**
			 *	Set the total duration of the model.
			 *
			 *	@param duration The total duration to be set for the model.
			 */
			void setDuration( int duration );
		
// methods
		
			/**
			 *	Initialize the duration of every state of the model to zero.
			 *
			 */
			void initDuration  ( void );
			
			/**
			 *	Initialize the the mean and variance of evey stream to zero.
			 *
			 */
			void initParameters( void );
		
			void updateDuration( double * updateFunction, int action ); // to put a speed profile on state duration( put it inside compute duration ? )
			void computeDuration  ( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight );
			void computeParameters( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight );
			void computeGlobalVariances( MAGE::Engine * engine, MAGE::Label * label );
			void checkInterpolationWeights( MAGE::Engine * engine, bool forced = false );

		protected :
		
			int duration;
			State state[nOfStates];
			ModelMemory modelMemory;
		
		private :
		
			char strQuery[maxStrLen];
			bool weightsChecked;
	};
} // namespace

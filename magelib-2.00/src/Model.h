/* ------------------------------------------------------------------------------------------- */
/*																							   */
/*  This file is part of MAGE / pHTS (the performative HMM-based speech synthesis system)      */
/*																							   */
/*  MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms     */
/*  of the GNU General Public License as published by the Free Software Foundation, either     */
/*  version 3 of the license, or any later version.											   */
/*																							   */
/*  MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;   */	
/*  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  */
/*  See the GNU General Public License for more details.									   */
/*																							   */	
/*  You should have received a copy of the GNU General Public License along with MAGE / pHTS.  */ 
/*  If not, see http://www.gnu.org/licenses/												   */
/*																							   */
/*																							   */	
/*  Copyright 2011 University of Mons :													       */
/*																							   */	
/*			Numediart Institute for New Media Art (www.numediart.org)						   */
/*         Acapela Group (www.acapela-group.com)											   */
/*																							   */
/*																							   */
/*   Developed by :																			   */
/*																							   */
/*		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit */
/*																							   */
/* ------------------------------------------------------------------------------------------- */

/**
 *   @file    Model.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   HMM class: a bunch of states
 */

#pragma once

#include "Constants.h"
#include "Engine.h"
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
		
			ModelMemory();
			~ModelMemory();
		
	//	protected :
		
			// for every stream, for every frame, every mean
			double ***mean;			// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, for every frame, every ivar
			double ***ivar;			// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_mean
			double ** gv_mean;		// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_var
			double ** gv_vari;		// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_switch
			int ** gv_switch;	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
		
			double **g;		// [nOfStreams][maxNumOfFrames];
			double ***wuw;	// [nOfStreams][maxNumOfFrames][maxWindowWidth]
			double **wum;	// [nOfStreams][maxNumOfFrames];
			// output parameter vector for otimized mgc, lf0 and lpf for every stream, for every frame
			double ***par;	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
            		
			int *voiced_unvoiced; // [maxNumOfFrames]
		
	};

	
	class Model 
	{	
		public :
		
		//default constructor
		Model();
	    ~Model();
		
		// getters
		State getState( int index );
		int getDuration( void );
		void updateDuration( int *updateFunction, int action  ); // to put a speed profile on state duration (put it inside compute duration ?)

//        std::vector<double> getMgc();
//        std::vector<double> getLf0();
//        std::vector<double> getLpf();
		
		//setters
		void setState( State state, int index );
		void setDuration( int duration );
		
		// methods
		void checkInterpolationWeights( MAGE::Engine *engine );
		void computeDuration( MAGE::Engine *engine, MAGE::Label *label );
		void computeParameters( MAGE::Engine *engine, MAGE::Label *label );
		void computeGlobalVariances( MAGE::Engine *engine, MAGE::Label *label );
//		void optimizeParameters( MAGE::Engine *engine );
		
		
		protected :
		
		int duration;
        
		State state[nOfStates];
	};
	
} // namespace

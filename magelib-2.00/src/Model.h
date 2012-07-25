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

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
    
class Model 
{
	public :
	
		//default constructor
		Model();
			
		// getters
		State getState( int index );
		int getDuration( void );
	
		//setters
		void setState( State state, int index );
		void setDuration( int duration );
	
		// methods
		void checkInterpolationWeights( MAGE::Engine *engine );
		void computeDuration( MAGE::Engine *engine, MAGE::Label *label );
		void computeParameters( MAGE::Engine *engine, MAGE::Label *label );
		void computeGlobalVariances( MAGE::Engine *engine, MAGE::Label *label );

	protected :
		
		int duration;
		State state[nOfStates];
	
		std::vector<double> mgc_pdf; 	// mgc parameters generated generated using GV weight
		std::vector<double> lf0_pdf; 	// lf0 parameters generated generated using GV weight
		std::vector<double> lpf_pdf; 	// lpf parameters generated generated using GV weight

};
    
} // namespace

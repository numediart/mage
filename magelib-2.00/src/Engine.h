/*
 *  Engine.h
 *  mageOsc
 *
 *  Created by Maria Astrinaki on 11/07/12.
 *  Copyright 2012. All rights reserved.
 *
 */

#pragma once

#include <string>
#include <cstdlib>
#include "hts.h"

using namespace std;

namespace MAGE 
{		
	class Engine
	{
		public:
			//default constructor
			Engine();
		
			// getters
			HTS_Global getGlobal( void );
			HTS_ModelSet getModelSet( void );

			//setters
			void setGlobal( HTS_Global global );
			void setModelSet( HTS_ModelSet ms );
			
			// methods
			void load( int argc, char **argv );
		
	
		protected:
		
			//int nOfLabels;
			HTS_Global global;	// global settings 
			HTS_ModelSet ms;    // set of duration models, HMMs and GV models 
			HTS_PStream pss;	// set of PDF streams
	};
}


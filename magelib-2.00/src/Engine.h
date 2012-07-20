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
            ~Engine();
		
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
            
        private:
            HTS_Engine engine;
            /* delta window handler for mel-cepstrum */
            char **fn_ws_mgc;
            /* delta window handler for log f0 */
            char **fn_ws_lf0;
            /* delta window handler for low-pass filter */
            char **fn_ws_lpf;

            /* prepare for interpolation */
            double *rate_interp;

            char **fn_ms_dur;
            char **fn_ms_mgc;
            char **fn_ms_lf0;
            char **fn_ms_lpf;
            char **fn_ts_dur;
            char **fn_ts_mgc;
            char **fn_ts_lf0;
            char **fn_ts_lpf;
            char **fn_ms_gvm;
            char **fn_ms_gvl;
            char **fn_ms_gvf;
            char **fn_ts_gvm;
            char **fn_ts_gvl;
            char **fn_ts_gvf;
           
            char *fn_gv_switch;
        
	};
}


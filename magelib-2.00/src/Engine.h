/* --------------------------------------------------------------------------------------------	*/
/*																								*/
/*	This file is part of MAGE / pHTS( the performative HMM-based speech synthesis system )		*/
/*																								*/
/*	MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms		*/
/*	of the GNU General Public License as published by the Free Software Foundation, either		*/
/*	version 3 of the license, or any later version.												*/
/*																								*/
/*	MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;	*/	
/*	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	*/
/*	See the GNU General Public License for more details.										*/
/*																								*/	
/*	You should have received a copy of the GNU General Public License along with MAGE / pHTS.	*/ 
/*	If not, see http://www.gnu.org/licenses/													*/
/*																								*/
/*																								*/	
/*	Copyright 2011 University of Mons :															*/
/*																								*/	
/*			Numediart Institute for New Media Art( www.numediart.org )							*/
/*			Acapela Group ( www.acapela-group.com )												*/
/*																								*/
/*																								*/
/*	 Developed by :																				*/
/*																								*/
/*		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
/*																								*/
/* --------------------------------------------------------------------------------------------	*/

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
			HTS_PStream getPStream( void );

			//setters
			void setGlobal( HTS_Global global );
			void setModelSet( HTS_ModelSet ms );
			void setPStream( HTS_PStream pss );

			// methods
			void load( int argc, char **argv );
		
		protected:
		
			//int nOfLabels;
			HTS_Global global;	// global settings 
			HTS_ModelSet ms;	// set of duration models, HMMs and GV models 
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
}// namespace



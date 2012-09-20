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

#pragma once

#include "MathFunctions.h"
#include "HTS_engine.h"
#include "HTS_hidden.h"

#include <string>
#include <stdarg.h>
#include <cstdlib>

using namespace std;

namespace MAGE 
{
	/** 
	 *  \brief		The the default HTS Engine used for HMM-based Speech Synthesis as provided by http://hts.sp.nitech.ac.jp/.
	 *  \details	This class is used to define the default HTS Engine instance to be used in Mage.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version	2.00 beta
	 *  \date		2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	
	class Engine
	{
		public:
		
			/**
			 *	Constructor that allocates the required memory for an HTS Engine instance and initializes 
			 *	all the parameters in default values.
			 */	
			Engine();
		
			/**
			 *	Destructor that disallocates all the memory used from an HTS Engine instance.
			 */	
			~Engine();
		
// getters
		
			/**
			 *	This function gets the global settings used by an HTS Engine instance.
			 *
			 *	@return The global settings used by an HTS Engine instance.
			 */
			inline HTS_Global getGlobal( void ){ return( this->global ); };
		
			/**
			 *	This function gets an individual PDF stream used by an HTS Engine instance.
			 *
			 *	@return The individual PDF stream used by an HTS Engine instance.
			 */
			inline HTS_PStream getPStream( void ){ return( this->pss ); };
		
			/**
			 *	This function gets the set of duration models, HMMs and global variance models used by an HTS Engine instance.
			 *
			 *	@return The set of duration models, HMMs and global variance models used by an HTS Engine instance.
			 */
			inline HTS_ModelSet getModelSet( void ){ return( this->ms ); };

//setters
			/**
			 *	This function sets new global settings to the HTS Engine instance.
			 *
			 *	@param global The new global settings to the HTS Engine instance.
			 */	
			inline void setGlobal( HTS_Global global ){ this->global = global; };
			inline void setPStream( HTS_PStream pss ){ this->pss = pss; };
			inline void setModelSet( HTS_ModelSet ms ){ this->ms = ms; };

// methods
			void load( int argc, char ** argv );
		
	protected:
		
			HTS_Global global;	// global settings 
			HTS_PStream pss;	// set of PDF streams
			HTS_ModelSet ms;	// set of duration models, HMMs and GV models 

		
	private:
		
		HTS_Engine engine;
		
		 /* delta window handler for mel-cepstrum*/
		char ** fn_ws_mgc;
		
		 /* delta window handler for log f0*/
		char ** fn_ws_lf0;
		
		 /* delta window handler for low-pass filter*/
		char ** fn_ws_lpf;
		
		 /* prepare for interpolation*/
		double * rate_interp;
		
		char ** fn_ms_dur;
		char ** fn_ms_mgc;
		char ** fn_ms_lf0;
		char ** fn_ms_lpf;
		char ** fn_ts_dur;
		char ** fn_ts_mgc;
		char ** fn_ts_lf0;
		char ** fn_ts_lpf;
		char ** fn_ms_gvm;
		char ** fn_ms_gvl;
		char ** fn_ms_gvf;
		char ** fn_ts_gvm;
		char ** fn_ts_gvl;
		char ** fn_ts_gvf;
		char * fn_gv_switch;
		
	};
}// namespace

// --- HTS Engine

/* Usage: output usage*/
void Usage( void );

/* Error: output error message*/
void Error( const int error, char * message, ... );

/* GetNumInterp: get number of speakers for interpolation from argv*/
int GetNumInterp( int argc, char ** argv_search );

// -- HTS Labels

bool isdigit_string( char * str );

/* HTS_set_duration: set duration from state duration probability distribution*/
double mHTS_set_duration( int * duration, double * mean, double * vari, int size, double frame_length );

// --- HTS PStream

/* HTS_finv: calculate 1.0/variance function*/
double HTS_finv( const double x );

/* HTS_PStream_mlpg: generate sequence of speech parameter vector maximizing its output probability for given pdf sequence*/
void HTS_PStream_mlpg( HTS_PStream * pst );

/* HTS_PStream_calc_wuw_and_wum: calcurate W'U^{-1}W and W'U^{-1}M*/
void HTS_PStream_calc_wuw_and_wum( HTS_PStream * pst, const int m );

/* HTS_PStream_ldl_factorization: Factorize W' * U^{-1} * W to L * D * L'( L: lower triangular, D: diagonal )*/
void HTS_PStream_ldl_factorization( HTS_PStream * pst );

/* HTS_PStream_forward_substitution: forward subtitution for mlpg*/
void HTS_PStream_forward_substitution( HTS_PStream * pst );

/* HTS_PStream_backward_substitution: backward subtitution for mlpg*/
void HTS_PStream_backward_substitution( HTS_PStream * pst, const int m );

/* HTS_PStream_gv_parmgen: function for mlpg using GV*/
void HTS_PStream_gv_parmgen( HTS_PStream * pst, const int m );

/* HTS_PStream_conv_gv: subfunction for mlpg using GV*/
void HTS_PStream_conv_gv( HTS_PStream * pst, const int m );

/* HTS_PStream_calc_derivative: subfunction for mlpg using GV*/
double HTS_PStream_calc_derivative( HTS_PStream * pst, const int m );

/* HTS_PStream_calc_gv: subfunction for mlpg using GV*/
void HTS_PStream_calc_gv( HTS_PStream * pst, const int m, double * mean, double * vari );



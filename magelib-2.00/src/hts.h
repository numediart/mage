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

#pragma once

#include "MathFunctions.h"
#include "HTS_engine.h"
#include "HTS_hidden.h"

#include <cstdlib>
#include <stdarg.h>

/* synthesis */
//HTS_Engine_load_label_from_fn(&engine, labfn);       /* load label file */
//if (phoneme_alignment)       /* modify label */
//	HTS_Label_set_frame_specified_flag(&engine.label, TRUE);

//if (speech_speed != 1.0)     /* modify label */
//	HTS_Label_set_speech_speed(&engine.label, speech_speed);

//HTS_Engine_create_sstream(&engine);  /* parse label and determine state duration */

//if (half_tone != 0.0) {      /* modify f0 */
//	for (i = 0; i < HTS_SStreamSet_get_total_state(&engine.sss); i++) {
//		f = HTS_SStreamSet_get_mean(&engine.sss, 1, i, 0);
//		f += half_tone * log(2.0) / 12;
//		if (f < log(10.0))
//            f = log(10.0);
//		HTS_SStreamSet_set_mean(&engine.sss, 1, i, 0, f);
//	}
//}
//HTS_Engine_create_pstream(&engine);  /* generate speech parameter vector sequence */
//HTS_Engine_create_gstream(&engine);  /* synthesize speech */



// -- Engine

/* Usage: output usage */
void Usage(void) ;

/* Error: output error message */
void Error(const int error, char *message, ...);

/* GetNumInterp: get number of speakers for interpolation from argv */
int GetNumInterp(int argc, char **argv_search);

// -- Labels

bool isdigit_string(char *str);

/* HTS_set_duration: set duration from state duration probability distribution */
double mHTS_set_duration(int *duration, double *mean, double *vari, int size, double frame_length);

/* HTS_finv: calculate 1.0/variance function */
double HTS_finv(const double x);

/* HTS_PStream_mlpg: generate sequence of speech parameter vector maximizing its output probability for given pdf sequence */
void HTS_PStream_mlpg(HTS_PStream * pst);

/* HTS_PStream_calc_wuw_and_wum: calcurate W'U^{-1}W and W'U^{-1}M */
void HTS_PStream_calc_wuw_and_wum(HTS_PStream * pst, const int m);

/* HTS_PStream_ldl_factorization: Factorize W'*U^{-1}*W to L*D*L' (L: lower triangular, D: diagonal) */
void HTS_PStream_ldl_factorization(HTS_PStream * pst);

/* HTS_PStream_forward_substitution: forward subtitution for mlpg */
void HTS_PStream_forward_substitution(HTS_PStream * pst);

/* HTS_PStream_backward_substitution: backward subtitution for mlpg */
void HTS_PStream_backward_substitution(HTS_PStream * pst, const int m);

/* HTS_PStream_gv_parmgen: function for mlpg using GV */
void HTS_PStream_gv_parmgen(HTS_PStream * pst, const int m);

/* HTS_PStream_conv_gv: subfunction for mlpg using GV */
void HTS_PStream_conv_gv(HTS_PStream * pst, const int m);

/* HTS_PStream_calc_derivative: subfunction for mlpg using GV */
double HTS_PStream_calc_derivative(HTS_PStream * pst, const int m);

/* HTS_PStream_calc_gv: subfunction for mlpg using GV */
void HTS_PStream_calc_gv(HTS_PStream * pst, const int m, double *mean, double *vari);


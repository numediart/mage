/**
 *   @file    hts.h
 *   @author  M. Astrinaki 
 *   @brief   
 */

#pragma once

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

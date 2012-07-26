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

#include "hts.h"

// -- Engine

/* Usage: output usage */
void Usage(void)
{
	HTS_show_copyright(stderr);
	fprintf(stderr, "\n");
	fprintf(stderr, "hts_engine - The HMM-based speech synthesis engine \"hts_engine API\"\n");
	fprintf(stderr, "\n");
	fprintf(stderr, "  usage:\n");
	fprintf(stderr, "       hts_engine [ options ] [ infile ] \n");
	fprintf(stderr, "  options:                                                                   [  def][ min--max]\n");
	fprintf(stderr, "    -td tree       : decision tree files for state duration                  [  N/A]\n");
	fprintf(stderr, "    -tm tree       : decision tree files for spectrum                        [  N/A]\n");
	fprintf(stderr, "    -tf tree       : decision tree files for Log F0                          [  N/A]\n");
	fprintf(stderr, "    -tl tree       : decision tree files for low-pass filter                 [  N/A]\n");
	fprintf(stderr, "    -md pdf        : model files for state duration                          [  N/A]\n");
	fprintf(stderr, "    -mm pdf        : model files for spectrum                                [  N/A]\n");
	fprintf(stderr, "    -mf pdf        : model files for Log F0                                  [  N/A]\n");
	fprintf(stderr, "    -ml pdf        : model files for low-pass filter                         [  N/A]\n");
	fprintf(stderr, "    -dm win        : window files for calculation delta of spectrum          [  N/A]\n");
	fprintf(stderr, "    -df win        : window files for calculation delta of Log F0            [  N/A]\n");
	fprintf(stderr, "    -dl win        : window files for calculation delta of low-pass filter   [  N/A]\n");
	fprintf(stderr, "    -od s          : filename of output label with duration                  [  N/A]\n");
	fprintf(stderr, "    -om s          : filename of output spectrum                             [  N/A]\n");
	fprintf(stderr, "    -of s          : filename of output Log F0                               [  N/A]\n");
	fprintf(stderr, "    -ol s          : filename of output low-pass filter                      [  N/A]\n");
	fprintf(stderr, "    -or s          : filename of output raw audio (generated speech)         [  N/A]\n");
	fprintf(stderr, "    -ow s          : filename of output wav audio (generated speech)         [  N/A]\n");
	fprintf(stderr, "    -ot s          : filename of output trace information                    [  N/A]\n");
	fprintf(stderr, "    -vp            : use phoneme alignment for duration                      [  N/A]\n");
	fprintf(stderr, "    -i  i f1 .. fi : enable interpolation & specify number(i),coefficient(f) [    1][   1-- ]\n");
	fprintf(stderr, "    -s  i          : sampling frequency                                      [16000][   1--48000]\n");
	fprintf(stderr, "    -p  i          : frame period (point)                                    [   80][   1--]\n");
	fprintf(stderr, "    -a  f          : all-pass constant                                       [ 0.42][ 0.0--1.0]\n");
	fprintf(stderr, "    -g  i          : gamma = -1 / i (if i=0 then gamma=0)                    [    0][   0-- ]\n");
	fprintf(stderr, "    -b  f          : postfiltering coefficient                               [  0.0][-0.8--0.8]\n");
	fprintf(stderr, "    -l             : regard input as log gain and output linear one (LSP)    [  N/A]\n");
	fprintf(stderr, "    -r  f          : speech speed rate                                       [  1.0][ 0.0--10.0]\n");
	fprintf(stderr, "    -fm f          : add half-tone                                           [  0.0][-24.0--24.0]\n");
	fprintf(stderr, "    -u  f          : voiced/unvoiced threshold                               [  0.5][ 0.0--1.0]\n");
	fprintf(stderr, "    -em tree       : decision tree files for GV of spectrum                  [  N/A]\n");
	fprintf(stderr, "    -ef tree       : decision tree files for GV of Log F0                    [  N/A]\n");
	fprintf(stderr, "    -el tree       : decision tree files for GV of low-pass filter           [  N/A]\n");
	fprintf(stderr, "    -cm pdf        : filenames of GV for spectrum                            [  N/A]\n");
	fprintf(stderr, "    -cf pdf        : filenames of GV for Log F0                              [  N/A]\n");
	fprintf(stderr, "    -cl pdf        : filenames of GV for low-pass filter                     [  N/A]\n");
	fprintf(stderr, "    -jm f          : weight of GV for spectrum                               [  1.0][ 0.0--2.0]\n");
	fprintf(stderr, "    -jf f          : weight of GV for Log F0                                 [  1.0][ 0.0--2.0]\n");
	fprintf(stderr, "    -jl f          : weight of GV for low-pass filter                        [  1.0][ 0.0--2.0]\n");
	fprintf(stderr, "    -k  tree       : GV switch                                               [  N/A]\n");
	fprintf(stderr, "    -z  i          : audio buffer size                                       [ 1600][   0--48000]\n");
	fprintf(stderr, "  infile:\n");
	fprintf(stderr, "    label file\n");
	fprintf(stderr, "  note:\n");
	fprintf(stderr, "    option '-d' may be repeated to use multiple delta parameters.\n");
	fprintf(stderr, "    generated spectrum, log F0, and low-pass filter coefficient\n");
	fprintf(stderr, "    sequences are saved in natural endian, binary (float) format.\n");
	fprintf(stderr, "\n");
	
	exit(0);
}

/* Error: output error message */
void Error(const int error, char *message, ...)
{
	va_list arg;
	
	fflush(stdout);
	fflush(stderr);
	
	if (error > 0)
		fprintf(stderr, "\nError: ");
	else
		fprintf(stderr, "\nWarning: ");
	
	va_start(arg, message);
	vfprintf(stderr, message, arg);
	va_end(arg);
	
	fflush(stderr);
	
	if (error > 0)
		exit(error);
}

/* GetNumInterp: get number of speakers for interpolation from argv */
int GetNumInterp(int argc, char **argv_search)
{
	int num_interp = 1;
	while (--argc) {
		if (**++argv_search == '-') {
			if (*(*argv_search + 1) == 'i') {
				num_interp = atoi(*++argv_search);
				if (num_interp < 1) {
					num_interp = 1;
				}
				--argc;
			}
		}
	}
	return (num_interp);
}

// -- Labels

bool isdigit_string(char *str)
{
	int i;
	
	if (sscanf(str, "%d", &i) == 1)
		return true;
	else
		return false;
}


/* HTS_set_duration: set duration from state duration probability distribution */
double mHTS_set_duration(int *duration, double *mean, double *vari, int size, double frame_length)
{
	int i, j;
	double temp1, temp2;
	double rho = 0.0;
	int sum = 0;
	int target_length;
	
	/* if the frame length is not specified, only the mean vector is used */
	if (frame_length == 0.0) {
		for (i = 0; i < size; i++) {
			duration[i] = (int) (mean[i] + 0.5);
			if (duration[i] < 1)
				duration[i] = 1;
			sum += duration[i];
		}
		return (double) sum;
	}
	
	/* get the target frame length */
	target_length = (int) (frame_length + 0.5);
	
	/* check the specified duration */
	if (target_length <= size) {
		if (target_length < size)
			HTS_error(-1, (char*) "HTS_set_duration: Specified frame length is too short.\n");
		for (i = 0; i < size; i++)
			duration[i] = 1;
		return (double) size;
	}
	
	/* RHO calculation */
	temp1 = 0.0;
	temp2 = 0.0;
	for (i = 0; i < size; i++) {
		temp1 += mean[i];
		temp2 += vari[i];
	}
	rho = ((double) target_length - temp1) / temp2;
	
	/* first estimation */
	for (i = 0; i < size; i++) {
		duration[i] = (int) (mean[i] + rho * vari[i] + 0.5);
		if (duration[i] < 1)
			duration[i] = 1;
		sum += duration[i];
	}
	
	/* loop estimation */
	while (target_length != sum) {
		/* sarch flexible state and modify its duration */
		if (target_length > sum) {
			j = -1;
			for (i = 1; i < size; i++) {
				temp2 = abs(rho - ((double) duration[i] + 1 - mean[i]) / vari[i]);
				if (j < 0 || temp1 < temp2) {
					j = i;
					temp1 = temp2;
				}
			}
			sum++;
			duration[j]++;
		} else {
			j = -1;
			for (i = 1; i < size; i++) {
				if (duration[i] > 1) {
					temp2 = abs(rho - ((double) duration[i] - 1 - mean[i]) / vari[i]);
					if (j < 0 || temp1 < temp2) {
						j = i;
						temp1 = temp2;
					}
				}
			}
			sum--;
			duration[j]--;
		}
	}
	
	return (double) target_length;
}

/* HTS_finv: calculate 1.0/variance function */
double HTS_finv(const double x)
{
	if (x >= INFTY2)
		return 0.0;
	if (x <= -INFTY2)
		return 0.0;
	if (x <= INVINF2 && x >= 0)
		return INFTY;
	if (x >= -INVINF2 && x < 0)
		return -INFTY;
	
	return (1.0 / x);
}

/* HTS_PStream_mlpg: generate sequence of speech parameter vector maximizing its output probability for given pdf sequence */
void HTS_PStream_mlpg(HTS_PStream * pst)
{
	int m;
	
	if (pst->length == 0)
		return;
	
	for (m = 0; m < pst->static_length; m++) {
		HTS_PStream_calc_wuw_and_wum(pst, m);
		HTS_PStream_ldl_factorization(pst);       /* LDL factorization */
		HTS_PStream_forward_substitution(pst);    /* forward substitution   */
		HTS_PStream_backward_substitution(pst, m);        /* backward substitution  */
		if (pst->gv_length > 0)
			HTS_PStream_gv_parmgen(pst, m);
	}
}

/* HTS_PStream_calc_wuw_and_wum: calcurate W'U^{-1}W and W'U^{-1}M */
void HTS_PStream_calc_wuw_and_wum(HTS_PStream * pst, const int m)
{
	int t, i, j, k;
	double wu;
	
	for (t = 0; t < pst->length; t++) {
		/* initialize */
		pst->sm.wum[t] = 0.0;
		for (i = 0; i < pst->width; i++)
			pst->sm.wuw[t][i] = 0.0;
		
		/* calc WUW & WUM */
		for (i = 0; i < pst->win_size; i++)
			for (j = pst->win_l_width[i]; j <= pst->win_r_width[i]; j++)
				if ((t + j >= 0) && (t + j < pst->length)
					&& (pst->win_coefficient[i][-j] != 0.0)) {
					wu = pst->win_coefficient[i][-j] * pst->sm.ivar[t + j][i * pst->static_length + m];
					pst->sm.wum[t] += wu * pst->sm.mean[t + j][i * pst->static_length + m];
					for (k = 0; (k < pst->width) && (t + k < pst->length); k++)
						if ((k - j <= pst->win_r_width[i])
							&& (pst->win_coefficient[i][k - j] != 0.0)) {
							pst->sm.wuw[t][k] += wu * pst->win_coefficient[i][k - j];
						}
				}
	}
}


/* HTS_PStream_ldl_factorization: Factorize W'*U^{-1}*W to L*D*L' (L: lower triangular, D: diagonal) */
 void HTS_PStream_ldl_factorization(HTS_PStream * pst)
{
	int t, i, j;
	
	for (t = 0; t < pst->length; t++) {
		for (i = 1; (i < pst->width) && (t >= i); i++)
			pst->sm.wuw[t][0] -= pst->sm.wuw[t - i][i] * pst->sm.wuw[t - i][i] * pst->sm.wuw[t - i][0];
		
		for (i = 1; i < pst->width; i++) {
			for (j = 1; (i + j < pst->width) && (t >= j); j++)
				pst->sm.wuw[t][i] -= pst->sm.wuw[t - j][j] * pst->sm.wuw[t - j][i + j] * pst->sm.wuw[t - j][0];
			pst->sm.wuw[t][i] /= pst->sm.wuw[t][0];
		}
	}
}

/* HTS_PStream_forward_substitution: forward subtitution for mlpg */
 void HTS_PStream_forward_substitution(HTS_PStream * pst)
{
	int t, i;
	
	for (t = 0; t < pst->length; t++) {
		pst->sm.g[t] = pst->sm.wum[t];
		for (i = 1; (i < pst->width) && (t >= i); i++)
			pst->sm.g[t] -= pst->sm.wuw[t - i][i] * pst->sm.g[t - i];
	}
}

/* HTS_PStream_backward_substitution: backward subtitution for mlpg */
 void HTS_PStream_backward_substitution(HTS_PStream * pst, const int m)
{
	int t, i;
	
	for (t = pst->length - 1; t >= 0; t--) {
		pst->par[t][m] = pst->sm.g[t] / pst->sm.wuw[t][0];
		for (i = 1; (i < pst->width) && (t + i < pst->length); i++)
			pst->par[t][m] -= pst->sm.wuw[t][i] * pst->par[t + i][m];
	}		
}



/* HTS_PStream_gv_parmgen: function for mlpg using GV */
void HTS_PStream_gv_parmgen(HTS_PStream * pst, const int m)
{
	int t, i;
	double step = STEPINIT;
	double prev = -LZERO;
	double obj;
	
	if (pst->gv_length == 0)
		return;
	
	HTS_PStream_conv_gv(pst, m);
	
	if (GV_MAX_ITERATION > 0) {
		HTS_PStream_calc_wuw_and_wum(pst, m);
		for (i = 1; i <= GV_MAX_ITERATION; i++) {
			obj = HTS_PStream_calc_derivative(pst, m);
			if (obj > prev)
				step *= STEPDEC;
			if (obj < prev)
				step *= STEPINC;
			for (t = 0; t < pst->length; t++)
				pst->par[t][m] += step * pst->sm.g[t];
			prev = obj;
		}
	}
}

/* HTS_PStream_conv_gv: subfunction for mlpg using GV */
void HTS_PStream_conv_gv(HTS_PStream * pst, const int m)
{
	int t;
	double ratio;
	double mean;
	double vari;
	
	HTS_PStream_calc_gv(pst, m, &mean, &vari);

	ratio = sqrt(pst->gv_mean[m] / vari);

	for (t = 0; t < pst->length; t++)
		if (pst->gv_switch[t])
			pst->par[t][m] = ratio * (pst->par[t][m] - mean) + mean;
}

/* HTS_PStream_calc_derivative: subfunction for mlpg using GV */
double HTS_PStream_calc_derivative(HTS_PStream * pst, const int m)
{
	int t, i;
	double mean;
	double vari;
	double dv;
	double h;
	double gvobj;
	double hmmobj;
	const double w = 1.0 / (pst->win_size * pst->length);
	
	HTS_PStream_calc_gv(pst, m, &mean, &vari);
	gvobj = -0.5 * W2 * vari * pst->gv_vari[m] * (vari - 2.0 * pst->gv_mean[m]);
	dv = -2.0 * pst->gv_vari[m] * (vari - pst->gv_mean[m]) / pst->length;
	
	for (t = 0; t < pst->length; t++) {
		pst->sm.g[t] = pst->sm.wuw[t][0] * pst->par[t][m];
		for (i = 1; i < pst->width; i++) {
			if (t + i < pst->length)
				pst->sm.g[t] += pst->sm.wuw[t][i] * pst->par[t + i][m];
			if (t + 1 > i)
				pst->sm.g[t] += pst->sm.wuw[t - i][i] * pst->par[t - i][m];
		}
	}
	
	for (t = 0, hmmobj = 0.0; t < pst->length; t++) {
		hmmobj += W1 * w * pst->par[t][m] * (pst->sm.wum[t] - 0.5 * pst->sm.g[t]);
		h = -W1 * w * pst->sm.wuw[t][1 - 1] - W2 * 2.0 / (pst->length * pst->length) * ((pst->length - 1) * pst->gv_vari[m] * (vari - pst->gv_mean[m]) + 2.0 * pst->gv_vari[m] * (pst->par[t][m] - mean) * (pst->par[t][m] - mean));
		if (pst->gv_switch[t])
			pst->sm.g[t] = 1.0 / h * (W1 * w * (-pst->sm.g[t] + pst->sm.wum[t]) + W2 * dv * (pst->par[t][m] - mean));
		else
			pst->sm.g[t] = 1.0 / h * (W1 * w * (-pst->sm.g[t] + pst->sm.wum[t]));
	}
	
	return (-(hmmobj + gvobj));
}

/* HTS_PStream_calc_gv: subfunction for mlpg using GV */
void HTS_PStream_calc_gv(HTS_PStream * pst, const int m, double *mean, double *vari)
{
	int t;
	
	*mean = 0.0;
	for (t = 0; t < pst->length; t++)
	{
		if (pst->gv_switch[t])
			*mean += pst->par[t][m];
	}	
	*mean /= pst->gv_length;
		
	*vari = 0.0;
	for (t = 0; t < pst->length; t++)
		if (pst->gv_switch[t])
			*vari += (pst->par[t][m] - *mean) * (pst->par[t][m] - *mean);
			
	*vari /= pst->gv_length;
}


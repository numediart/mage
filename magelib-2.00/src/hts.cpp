/**
 *   @file    hts.h
 *   @author  M. Astrinaki 
 *   @brief   
 */

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

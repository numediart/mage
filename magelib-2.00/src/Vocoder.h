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


/* 
 * File:   Vocoder.h
 * Author: alexis
 *
 * Created on 24 juillet 2012, 16:54
 * 
 * Most of these functions come from SPTK, which is distributed under 
 * a Modified BSD License. See http://sp-tk.sourceforge.net/ for details
 * 
 */

#pragma once

#include <cstdio>
#include "Constants.h"
#include "Frame.h"

namespace MAGE {

    class Vocoder {
    public:
        Vocoder(int am=(nOfMGCs-1), double aalpha=defaultAlpha, int afprd=defaultFrameRate, int aiprd=defaultInterpFrameRate, int astage=0, int apd=defaultPadeOrder, bool angain=false);
        Vocoder(const Vocoder& orig);
        virtual ~Vocoder();

        void push(Frame &frame, bool ignoreVoicing=false);
        double pop();
        
        bool ready();
        void reset();
        
        inline void setAlpha(double aalpha) { this->alpha = aalpha; };  	// ATTENTION no need for correct limit control???
        inline void setVolume(double vvolume) { this->volume = vvolume; };  // ATTENTION no need for correct limit control???
		
        void setPitch(double pitch, int action, bool forceVoiced=false);
		void setVoiced(bool forceVoiced);

        //functions imported from SPTK
        void movem(void *a, void *b, const size_t size, const int nitem);
        void mc2b(double *mc, double *b, int m, const double a);
        void gnorm(double *c1, double *c2, int m, const double g);
        double mglsadff(double x, double *b, const int m, const double a, double *d);
        double mglsadf(double x, double *b, const int m, const double a, const int n, double *d);
        double mglsadfft(double x, double *b, const int m, const double a, double *d);
        double mglsadft(double x, double *b, const int m, const double a, const int n, double *d);

        double mlsafir(double x, double *b, const int m, const double a,
                double *d);
        double mlsadf1(double x, double *b, const int m, const double a,
                const int pd, double *d);
        double mlsadf2(double x, double *b, const int m, const double a,
                const int pd, double *d);
        double mlsadf(double x, double *b, const int m, const double a, const int pd,
                double *d);

    private:
        int m;
        int fprd;
        int iprd;
        int stage;
        int pd;
        int csize;

        bool ngain;
        bool flagFirstPush;

        double alpha; // [0. 1]
        double gamma;
        double x;
        double *c;
        double *inc;
        double *cc;
        double *d;

        double lf0;
        
        double padesptk[21];
        double *ppadesptk;
        
        //excitation
        double f0;
        double t0;
        bool voiced;
        int count;
		int action;
		double actionValue;
        
        double volume; // >= 0

        int nOfPopSinceLastPush;
    };

}



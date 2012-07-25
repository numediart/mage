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
        Vocoder();
        Vocoder(const Vocoder& orig);
        virtual ~Vocoder();

        void push(Frame frame);
        double pop();
        
		bool ready();

        double *ppadesptk;

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
        int i;
        int j;

        bool ngain;
        bool flagInit;

        double alpha;
        double gamma;
        double x;
        double *c;
        double *inc;
        double *cc;
        double *d;

        double lf0;
        
        double padesptk[21];
    };

}



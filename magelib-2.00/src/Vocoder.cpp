/* 
 * File:   Vocoder.cpp
 * Author: alexis
 * 
 * Created on 24 juillet 2012, 16:54
 * 
 * Most of these functions come from SPTK, which is distributed under 
 * a Modified BSD License. See http://sp-tk.sourceforge.net/ for details
 * 
 */

#include "Vocoder.h"
#include "Frame.h"
#include "MathFunctions.h"

MAGE::Vocoder::Vocoder() {
    m = nOfMGCs-1;
    fprd = 240;
    iprd = 1;
    stage = 0;
    pd = 4;
    ngain = true;
    alpha = 0.55;
    
    if (stage != 0) {            /* MGLSA */
        gamma = -1 / (double) stage;
    }
    
    if (stage != 0) {
        c = new double[m + m + m + 3 + (m + 1) * stage];  /* MGLSA */
    } else {
        c = new double[3 * (m + 1) + 3 * (pd + 1) + pd * (m + 2)];    /* MLSA  */
    }
    cc = c + m + 1;
    inc = cc + m + 1;
    d = inc + m + 1;
    
    flagInit = false;
    
    double lpadesptk[] = { 1.0,
    1.0, 0.0,
    1.0, 0.0, 0.0,
    1.0, 0.0, 0.0, 0.0,
    1.0, 0.4999273, 0.1067005, 0.01170221, 0.0005656279,
    1.0, 0.4999391, 0.1107098, 0.01369984, 0.0009564853, 0.00003041721
    };

    for (int k=0;k<21;k++) {
        padesptk[k] = lpadesptk[k];
    }   
}

MAGE::Vocoder::Vocoder(const Vocoder& orig) {
}

MAGE::Vocoder::~Vocoder() {
    delete[] c;
}

bool MAGE::Vocoder::ready()
{ 
	return this->flagInit; 
}

void MAGE::Vocoder::push(Frame frame) {
    if (flagInit) {
        movem(cc, c, sizeof(*cc), m + 1);
        
        mc2b(frame.mgc, cc, m, alpha);
        if (stage != 0) {
            gnorm(cc, cc, m, gamma);
            cc[0] = log(cc[0]);
            for (i = 1; i <= m; i++)
                cc[i] *= gamma;
        }
    } else {
        flagInit = true;

        mc2b(frame.mgc, c, m, alpha);
        if (stage != 0) { /* MGLSA */
            gnorm(c, c, m, gamma);
            c[0] = log(c[0]);
            for (i = 1; i <= m; i++)
                c[i] *= gamma;
        }

        for (i = 0; i <= m; i++)
            cc[i] = c[i];
    }    
}

double MAGE::Vocoder::pop() {       
    //TODO frame.lf0-dependent excitation
    double x = MAGE::Random(-0.5,0.5);
    
    if (stage != 0) { /* MGLSA */
        if (!ngain)
            x *= exp(c[0]);
        else
            x = mglsadf(x, c, m, alpha, stage, d);
    } else { /* MLSA */
        if (!ngain)
            x *= exp(c[0]);
        x = mlsadf(x, c, m, alpha, pd, d);
    }
    
    return x;
}

void MAGE::Vocoder::movem(void *a, void *b, const size_t size, const int nitem)
{
   long i;
   char *c = (char *) a;
   char *d = (char *) b;

   i = size * nitem;
   if (c > d)
      while (i--)
         *d++ = *c++;
   else {
      c += i;
      d += i;
      while (i--)
         *--d = *--c;
   }
}

void MAGE::Vocoder::mc2b(double *mc, double *b, int m, const double a)
{
   b[m] = mc[m];

   for (m--; m >= 0; m--)
      b[m] = mc[m] - a * b[m + 1];

   return;
}

void MAGE::Vocoder::gnorm(double *c1, double *c2, int m, const double g)
{
   double k;

   if (g != 0.0) {
      k = 1.0 + g * c1[0];
      for (; m >= 1; m--)
         c2[m] = c1[m] / k;
      c2[0] = pow(k, 1.0 / g);
   } else {
      movem(&c1[1], &c2[1], sizeof(*c1), m);
      c2[0] = exp(c1[0]);
   }

   return;
}

double MAGE::Vocoder::mglsadff(double x, double *b, const int m, const double a,
                       double *d)
{
   int i;
   double y, aa;

   aa = 1 - a * a;

   y = d[0] * b[1];
   for (i = 1; i < m; i++) {
      d[i] += a * (d[i + 1] - d[i - 1]);
      y += d[i] * b[i + 1];
   }
   x -= y;

   for (i = m; i > 0; i--)
      d[i] = d[i - 1];
   d[0] = a * d[0] + aa * x;

   return (x);
}

double MAGE::Vocoder::mglsadf(double x, double *b, const int m, const double a, const int n,
               double *d)
{
   int i;

   for (i = 0; i < n; i++)
      x = mglsadff(x, b, m, a, &d[i * (m + 1)]);

   return (x);
}

double MAGE::Vocoder::mlsafir(double x, double *b, const int m, const double a,
                      double *d)
{
   double y = 0.0, aa;
   int i;

   aa = 1 - a * a;

   d[0] = x;
   d[1] = aa * d[0] + a * d[1];

   for (i = 2; i <= m; i++) {
      d[i] = d[i] + a * (d[i + 1] - d[i - 1]);
      y += d[i] * b[i];
   }

   for (i = m + 1; i > 1; i--)
      d[i] = d[i - 1];

   return (y);
}

double MAGE::Vocoder::mlsadf1(double x, double *b, const int m, const double a,
                      const int pd, double *d)
{
   double v, out = 0.0, *pt, aa;
   int i;

   aa = 1 - a * a;
   pt = &d[pd + 1];

   for (i = pd; i >= 1; i--) {
      d[i] = aa * pt[i - 1] + a * d[i];
      pt[i] = d[i] * b[1];
      v = pt[i] * ppadesptk[i];

      x += (1 & i) ? v : -v;
      out += v;
   }

   pt[0] = x;
   out += x;

   return (out);
}

double MAGE::Vocoder::mlsadf2(double x, double *b, const int m, const double a,
                      const int pd, double *d)
{
   double v, out = 0.0, *pt, aa;
   int i;

   aa = 1 - a * a;
   pt = &d[pd * (m + 2)];

   for (i = pd; i >= 1; i--) {
      pt[i] = mlsafir(pt[i - 1], b, m, a, &d[(i - 1) * (m + 2)]);
      v = pt[i] * ppadesptk[i];

      x += (1 & i) ? v : -v;
      out += v;
   }

   pt[0] = x;
   out += x;

   return (out);
}

double MAGE::Vocoder::mlsadf(double x, double *b, const int m, const double a, const int pd,
              double *d)
{
   ppadesptk = &padesptk[pd * (pd + 1) / 2];

   x = mlsadf1(x, b, m, a, pd, d);
   x = mlsadf2(x, b, m, a, pd, &d[2 * (pd + 1)]);

   return (x);
}
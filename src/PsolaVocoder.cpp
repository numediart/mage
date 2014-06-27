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

/* 
 	Most of these functions come from SPTK, which is distributed under 
 	a Modified BSD License. See http://sp-tk.sourceforge.net/ for details

 	SPTK's Modified BSD license is also included in this file, just above
 	the set of functions that we copy/pasted and adapted from SPTK.
*/

#include "PsolaVocoder.h"

//	Constructor that allocates and initializes all the parameters needed for the PsolaVocoder.
MAGE::PsolaVocoder::PsolaVocoder( int am, double aalpha, int afprd, int aiprd, int astage, int apd, bool angain )
	: Vocoder(am,aalpha,afprd,aiprd,astage,apd,angain)
{
	//c = new double[this->csize];
	c.resize( PSOLA_FRAMEQUEUE_LENGTH );
	inc.resize( PSOLA_FRAMEQUEUE_LENGTH );
	
	for ( int f = 0; f < c.size(); f++ ) {
		c[f].resize( m + 1 );
		inc[f].resize( m + 1 );
	}

	head_c = 0;
	tail_c = 0;
	
	//cc = c.data() + m + 1;
	cc = new double[m+1];	
	//inc = cc + m + 1;
	//d = inc + m + 1;
	d = new double[this->csize];//that's too much, should be (if MLSA): 3 * ( pd + 1 ) + pd * ( m + 2)
	memset( d, 0, sizeof( double ) * this->csize );
	
	//PSOLA
	this->pulse.resize( 2 * PSOLA_MAX_T0, 0 );
	this->source.resize( PSOLA_MAX_OUT_BUFFER_LENGTH, 0 );
	this->p_s = PSOLA_MAX_T0;
	this->n_s = 0;
	this->tail_s = 0;
	this->head_s = PSOLA_MAX_T0;
	this->countInitPop = PSOLA_MAX_T0;
	this->errorT0 = 0;
}

//	Constructor that allocates and initializes all the parameters needed for the PsolaVocoder.
MAGE::PsolaVocoder::PsolaVocoder( const PsolaVocoder& orig )
{
}

//	Destructor that disallocates all the memory used from the PsolaVocoder.
MAGE::PsolaVocoder::~PsolaVocoder()
{
	//delete[] c;
	delete[] cc;
	delete[] d;
}

// methods
double MAGE::PsolaVocoder::excite()
{
	double sample = 0;
	int k, ct0 = (int) (this->t0 + 0.5);

	if ( ct0 > PSOLA_MAX_T0 )
		ct0 = PSOLA_MAX_T0;

	if( voiced )
	{
		if( count <= 0 )
		{
			this->errorT0 += ( ct0 - this->t0 );

			//sample = sqrt( this->t0 );
			//get PSOLA waveform instead
			makepulse(2*ct0);

			//now put it in source[p_s-ct0 : p_s+ct0-1] (with wrap)
			int ind = p_s - ct0;

			if ( ind < 0 )
				ind += source.size();

			for ( k = 0; k < ct0; k++ ) {
				source[ind++] += pulse[k];

				if ( ind >= source.size() )
					ind = 0;
			}

			for ( k = ct0; k < 2*ct0; k++ ) {
				source[ind++] = pulse[k];

				if ( ind >= source.size() )
					ind = 0;
			}

			p_s = ind+1;
			if ( p_s >= source.size() )
				p_s = 0;
			count = ct0;
		}
		else
		{
			count--;
		}
	}
	else
	{
		p_s -= count;

		int ind = p_s;
		for (k = 0; k < count+1; k++) {
			source[ind] = 0.0;
			
			ind++;
			if ( ind >= source.size() )
				ind = 0;
		}

		if ( p_s < 0 )
			p_s += source.size();

		source[p_s++] = MAGE::Random( -1,1 );

		if ( p_s >= source.size() )
			p_s = 0;

		count = 0;
	}

	sample = source[tail_s];
	source[tail_s] = 0;
	tail_s++;

	if ( tail_s >= source.size() )
		tail_s = 0;

	return sample;
}

void MAGE::PsolaVocoder::makepulse( unsigned int length )
{
	this->pulse.resize(length);
	for ( int k = 0; k < this->pulse.size(); k++ )
		pulse[k] = 0.0;

	int mid = length / 2;
	this->pulse[mid] = sqrt(mid);//0.5;
	
	return;
}

void MAGE::PsolaVocoder::prepare( double frame[nOfStreams][maxStreamLen], bool voiced, bool ignoreVoicing )
{
	int i;

	//filter part
	if( !flagFirstPush )
	{
		movem( cc, c[head_c].data(), sizeof( * cc ), m + 1 );
		
		mc2b( frame[0], cc, m, alpha );
		
		if( stage != 0 ) /* MGLSA*/
		{
			gnorm( cc, cc, m, gamma );
			cc[0] = log( cc[0] );
			
			for( i = 1; i <= m; i++ )
				cc[i] *= gamma;
		}
		
		for( i = 0; i <= m; i++ )
			inc[head_c][i] = ( cc[i] - c[head_c][i] ) * iprd / fprd;

		head_c++;
		if ( head_c >= c.size() )
			head_c = 0;

		if (hopLen.empty()){
			hopLen.push(0);
		} else {
			hopLen.push( nOfPopSinceLastPush );
		}
	} 
	else 
	{
		mc2b( frame[0], c[head_c].data(), m, alpha );
		
		if( stage != 0 ) // MGLSA
		{ 
			gnorm( c[head_c].data(), c[head_c].data(), m, gamma );
			c[head_c][0] = log( c[head_c][0] );
			
			for( i = 1; i <= m; i++ )
				c[head_c][i] *= gamma;
		}
		
		for( i = 0; i <= m; i++ )
			cc[i] = c[head_c][i];
		
		for( i = 0; i <= m; i++ )
			inc[head_c][i] = 0;

		head_c++;
		if (head_c >= c.size() )
		   head_c = 0;	

		flagFirstPush = false;
	}	

	// pitch part
	switch( action )
	{
		case MAGE::overwrite:
			this->f0 = this->actionValue;	// Hz
			break;
			
		case MAGE::shift:
			this->f0 = ( frame[1][0]  ) + ( this->actionValue ); // Hz
			break;
			
		case MAGE::scale:
			this->f0 = ( frame[1][0]  ) * ( this->actionValue );  // Hz
			break;
			
		case MAGE::synthetic:
		case MAGE::noaction:
		default:
			this->f0 = frame[1][0] ;
	}
	
	if( this->f0 < 0 )
		this->f0 = MAGE::defaultPitch; 
	
	this->t0 = MAGE::defaultSamplingRate / this->f0; // defaultSamplingRate = 48000

	if( !ignoreVoicing )
		this->voiced = voiced;
	
	this->nOfPopSinceLastPush = 0;

	return;
}
//	This function returns a single sample from the PsolaVocoder.
double MAGE::PsolaVocoder::pop()
{
	int i;

	x = this->excite();

	if( stage != 0 )  // MGLSA
	{ 
		if( !ngain )
			x *= exp( c[tail_c][0] );
		else
			x *= c[tail_c][0];
		
		x = mglsadf( x, c[tail_c].data(), m, alpha, stage, d );
	} 
	else  // MLSA
	{ 
		if( !ngain )
			x *= exp( c[tail_c][0] );
		else
			x *= c[tail_c][0];
		
		x = mlsadf( x, c[tail_c].data(), m, alpha, pd, d );
	}

	//filter interpolation has not reached next filter yet
	//when next filter is reached, stop interpolation, otherwise
	//you'll eventually get an unstable filter
	if( this->nOfPopSinceLastPush < ( fprd/iprd ) )
	{
		for( i = 0; i <= m; i++ )
			c[tail_c][i] += inc[tail_c][i];
	}
	
	this->nOfPopSinceLastPush++;

	if (this->countInitPop > 0) 
	{
		this->countInitPop--;
	}
	else
	{
		//if there is another frame ready to be used
		if ( !this->hopLen.empty() ) {
			this->hopLen.front()--;
			// if the hopsize for that frame has been reached
			if ( this->hopLen.front() <= 0) {
				this->hopLen.pop();
				//go to next frame
				tail_c++;
				if ( tail_c >= c.size() )
					tail_c = 0;

				if (hopLen.empty()) {
					//minor reset
					this->countInitPop = PSOLA_MAX_T0;
					flagFirstPush = true;
				}
			}
		}
	}

	// ATTENTION volume??? correct place???
	if( this->volume >= 0 )
		return( this->volume * x );

	return( x );
}

//	This function resets the PsolaVocoder to its default values.
void MAGE::PsolaVocoder::reset()
{
	for( int f = 0; f < c.size(); f++ ) {
		for( int i = 0; i < m; i++ ) {
			c[f][i] = 0;
			inc[f][i] = 0;
		}
	}

	for( int i = 0; i < this->csize; i++ ) {
		d[i] = 0;
	}

	
	this->f0 = MAGE::defaultPitch;
	this->t0 = MAGE::defaultSamplingRate / ( this->f0 );
	this->action = MAGE::noaction;
	this->alpha  = MAGE::defaultAlpha;
	this->gamma  = MAGE::defaultGamma;
	this->stage  = MAGE::defaultGamma;
	this->pd	 = MAGE::defaultPadeOrder; 
	this->volume = MAGE::defaultVolume;
	this->flagFirstPush = true;
	this->countInitPop = PSOLA_MAX_T0;
	
	return;
}


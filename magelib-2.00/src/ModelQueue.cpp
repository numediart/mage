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

/**
 *	 @file	ModelQueue.cpp
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Model ringbuffer: used to store statistical
 *			models + special generate()function that takes
 *			a lookup window and generates oldest-label frames
 */

#include "ModelQueue.h"

MAGE::ModelQueue::ModelQueue( unsigned int queueLen, MAGE::ModelMemory *memory ):
MAGE::MemQueue<Model>( queueLen )
{
	this->mem = memory;
	// this is just to pass the
	// queueLen to the parent class
}

void MAGE::ModelQueue::generate( FrameQueue *frameQueue, unsigned int backup )
{
	//TODO actual frame generation with vocoder
	unsigned int k, s, q, qmgc, qlf0, qlpf, w, ind;
	
	head = ( read + backup ) % length; // then we land on the correct model( backup models have already been used, let's forget about them )
	
	qmgc = qlf0 = qlpf = 0;
	
	for( w = 0; w < backup; w++ )
	{
		ind = ( read + w ) % length;
		
		for( s = 0; s < nOfStates; s++ )
		{
			qmgc += rawData[ind].getState( s ).duration;
			qlpf += rawData[ind].getState( s ).duration;
			//this is totally idiotic because it has already been computed in optimizeparameters
			//thus it should be saved there and re-used here
			//besides 0.5 should be a parameter( see global in optimizeparameters )
			
			if( rawData[ind].getState( s ).lf0[0].msdFlag > 0.5 )
				qlf0 += rawData[ind].getState( s ).duration;
		}
	}
	
	for( s = 0; s < nOfStates; s++ )
	{
		// from each state of the model, we get the computed
		// duration and we iterate to generate the parameters
		//printf( "duration of state %d = %d, v/uv: %g\n",s,rawData[head].getState( s ).duration,rawData[head].getState( s ).lf0[0].msdFlag );
		for( q = 0; q < rawData[head].getState( s ).duration; q++ )
		{
			for( k = 0; k < nOfMGCs; k++ )
			{
				//frame.mgc[k] = rawData[head].getMem()->par[mgcStreamIndex][qmgc][k];
				frame.mgc[k] = getMem()->par[mgcStreamIndex][qmgc][k];
			}
			qmgc++;
			
			for( k = 0; k < nOfLPFs; k++ )
			{
				//frame.lpf[k] = rawData[head].getMem()->par[lpfStreamIndex][qlpf][k];
				frame.lpf[k] = getMem()->par[lpfStreamIndex][qlpf][k];
			}
			qlpf++;
			
			//frame.f0 = exp( rawData[head].getState( s ).lf0[0].mean );
			
			if( rawData[head].getState( s ).lf0[0].msdFlag > 0.5 )
			{
				frame.voiced = true;
				//frame.f0 = exp( rawData[head].getMem()->par[lf0StreamIndex][qlf0][nOfLF0s-1] );
				frame.f0 = exp( getMem()->par[lf0StreamIndex][qlf0][0] );
				qlf0++;
			} 
			else
			{
				frame.voiced = false;
				frame.f0 = 0;
			}
			
			while( frameQueue->isFull() )
				usleep( 10 );
			
			frameQueue->push( &frame, 1 );
		}
	}
	return;
}

void MAGE::ModelQueue::printQueue( void )
{
	unsigned int k, s;
	
	for( k = 0; k < getNumOfItems(); k++ )
	{
		int head = ( read + k ) % length;
		
		printf( "model %i:", head );
		
		for( s = 0; s < nOfStates; s++ )
			printf( " %i", rawData[head].getState( s ).duration );
		
		printf( "\n" );
	}
	return;
}

void MAGE::ModelQueue::optimizeParameters( MAGE::Engine *engine, unsigned int backup, unsigned int lookup )
{	
	int window = backup + lookup + 1;//how many model do we use
	head = read; // hopefuly we land on the oldest model wich is 'backup' earlier than current model
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	static HTS_PStream pss = engine->getPStream();
	
	int i, j, k, l, m, w;
	int state, frame, msd_frame, static_length;
	int total_duration = 0;
	
	bool not_bound;
	
	frame = 0;
	
	//TODO optimize this: some computation will be done exactly the same in next call to this function( only shifted in mem )
	
	for( w = 0; w < window; w++ )// for every model 
	{ 
		for( state = 0; state < ms.nstate; state++ )// for every state
		{
			for( j = 0; j < rawData[head].getState( state ).duration; j++, frame++ )// for every frame
			{
				if( rawData[head].getState( state ).lf0[0].msdFlag > global.msd_threshold[1] )	// if voiced
					mem->voiced_unvoiced[frame] = true;
				else
					mem->voiced_unvoiced[frame] = false;
			}
		}
		
		total_duration += rawData[head].getDuration();
		
		head = ( head + 1 ) % length;
	}
	
	for( i = 0; i < ms.nstream; i++ ) // for every stream : mgc, lf0, lpf
	{
		head = read;
		
		if( ms.stream[i].msd_flag )	// for MSD
		{
			frame = 0, msd_frame = 0;
			for( w = 0; w < window; w++ )
			{
				for( state = 0; state < ms.nstate; state++ ) // for every state
				{
					for( j = 0; j < rawData[head].getState( state ).duration; j++ ) // for every frame
					{
						if( mem->voiced_unvoiced[frame] )
						{
							// check current frame is MSD boundary or not 
							for( k = 0; k < ms.stream[i].window.size; k++ )
							{
								not_bound = true;
								
								for( l = ms.stream[i].window.l_width[k]; l <= ms.stream[i].window.r_width[k]; l++ )
								{
									if( frame + l < 0 || total_duration <= frame + l || !mem->voiced_unvoiced[frame+l] ) // voiced unvoided
									{
										not_bound = false;
										break;
									}
								}
								
								static_length = ( ms.stream[i].vector_length / ms.stream[i].window.size );
								
								for( l = 0; l < static_length; l++ )
								{
									// ATTENTION !!! This is not the good way
									m = static_length * k + l;
									
									if( i == 1 )	// lf0
									{
										mem->mean[i][msd_frame][m] = rawData[head].getState( state ).lf0[m].mean;
										
										if( not_bound || k == 0 )
											mem->ivar[i][msd_frame][m] = HTS_finv( rawData[head].getState( state ).lf0[m].vari );
										else
											mem->ivar[i][msd_frame][m] = 0.0;
										
										// ATTENTION !!! Loop assignment
										mem->gv_mean[i][m] = rawData[head].getState( 0 ).gv_lf0[m].mean;
										mem->gv_vari[i][m] = rawData[head].getState( 0 ).gv_lf0[m].vari;
									}
								}
							}
							mem->gv_switch[i][msd_frame] = rawData[head].getState( state ).lf0_gv_switch;
							msd_frame++;
						}
						frame++;
					}
				}
				head = ( head + 1 ) % length;
			}
		} 
		else // for non MSD 
		{			
			frame = 0;
			
			for( w = 0; w < window; w++ )
			{
				for( state = 0; state < ms.nstate; state++ ) // for every state
				{
					for( j = 0; j < rawData[head].getState( state ).duration; j++ ) // for every frame
					{
						for( k = 0; k < ms.stream[i].window.size; k++ )
						{
							not_bound = true;
							for( l = ms.stream[i].window.l_width[k]; l <= ms.stream[i].window.r_width[k]; l++ )
							{
								if( frame + l < 0 || total_duration <= frame + l )
								{
									not_bound = false;
									break;
								}
							}
							
							static_length = ( ms.stream[i].vector_length / ms.stream[i].window.size );
							
							for( l = 0; l < static_length; l++ )
							{
								// ATTENTION !!! This is not the good way
								m = static_length * k + l;
								
								if( i == 0 ) // mgcs
								{
									mem->mean[i][frame][m] = rawData[head].getState( state ).mgc[m].mean;
									
									if( not_bound || k == 0 )
										mem->ivar[i][frame][m] = HTS_finv( rawData[head].getState( state ).mgc[m].vari );
									else
										mem->ivar[i][frame][m] = 0.0;
									
									// ATTENTION !!! Loop assignment
									mem->gv_mean[i][m] = rawData[head].getState( 0 ).gv_mgc[m].mean;
									mem->gv_vari[i][m] = rawData[head].getState( 0 ).gv_mgc[m].vari;
									mem->gv_switch[i][m] = rawData[head].getState( 0 ).mgc_gv_switch;
								}
								
								if( i == 2 ) // lpf
								{
									mem->mean[i][frame][m] = rawData[head].getState( state ).lpf[m].mean;
									
									if( not_bound || k == 0 )
										mem->ivar[i][frame][m] = HTS_finv( rawData[head].getState( state ).lpf[m].vari );
									else
										mem->ivar[i][frame][m] = 0.0;
									
									// ATTENTION !!! Loop assignment
									mem->gv_mean[i][m] = rawData[head].getState( 0 ).gv_lpf[m].mean;
									mem->gv_vari[i][m] = rawData[head].getState( 0 ).gv_lpf[m].vari;
									mem->gv_switch[i][m] = rawData[head].getState( 0 ).lpf_gv_switch;
								}
							}
						}
						frame++;
					}
				}
				head = ( head+1 )%length;
			}
		}
		
		// just vector assigments in order to create a HTS_PStream object and use the default HTS_PStream_mlpg function
		pss.vector_length = ms.stream[i].vector_length;			// vector length( include static and dynamic features )
		pss.width = ms.stream[i].window.max_width * 2 + 1;		// width of dynamic window 
		pss.win_size = ms.stream[i].window.size;				// # of windows( static + deltas )
		pss.win_l_width = ms.stream[i].window.l_width;			// left width of windows 
		pss.win_r_width = ms.stream[i].window.r_width;			// right width of windows 
		pss.win_coefficient = ms.stream[i].window.coefficient;	// window coefficients 
		pss.gv_mean = mem->gv_mean[i];							// mean vector of GV 
		pss.gv_vari = mem->gv_vari[i];							// variance vector of GV 
		pss.gv_switch = mem->gv_switch[i];						// GV flag sequence 
		pss.static_length = ms.stream[i].vector_length / ms.stream[i].window.size;		// static features length 
		
		
		if( ms.stream[i].msd_flag )	// for MSD :: lf0
			pss.length = msd_frame;	// stream length :: total number of frames
		else						// for non MSD :: mgcs & lpf
			pss.length = frame;		// stream length :: total number of frames
		
		if( HTS_ModelSet_use_gv( &ms, i ) )	// if GV is used 
			pss.gv_length = pss.length;		//frame length for GV calculation
		else 
			pss.gv_length = 0;				//frame length for GV calculation
		
		// matrices for parameter generation 		
		pss.sm.mean = mem->mean[i];		// mean vector sequence 
		pss.sm.ivar = mem->ivar[i];		// inverse diag variance sequence
		pss.sm.g	= mem->g[i];		// vector used in the forward substitution 
		pss.sm.wum	= mem->wum[i];		// W' U^-1 mu 
		pss.sm.wuw	= mem->wuw[i];		// W' U^-1 W	
		
		// output parameter vector in a pre-allocated memory
		pss.par = mem->par[i];		 
		
		HTS_PStream_mlpg( &pss );			// parameter generation 
	}
	return;
}

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

/*
 *	Model.cpp
 *	mageOsc
 *
 *	Created by Maria Astrinaki on 11/07/12.
 *	Copyright 2012. All rights reserved.
 *
 */

#include "Model.h"
/*
// constructor
MAGE::ModelMemory::ModelMemory()
{
	int k;
	
	// for every stream, for every frame, every mean / ivar / optimized parameters / gv_mean / gv_vari / gv_switch
	this->mean	= ( double *** ) calloc( nOfStreams,sizeof( double ** ) );	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	this->ivar	= ( double *** ) calloc( nOfStreams,sizeof( double ** ) );	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	this->par	= ( double *** ) calloc( nOfStreams,sizeof( double ** ) );	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	
	this->gv_mean	= ( double ** ) calloc( nOfStreams,sizeof( double * ) );// [nOfStreams][nOfDers*nOfMGCs]
	this->gv_vari	= ( double ** ) calloc( nOfStreams,sizeof( double * ) );// [nOfStreams][nOfDers*nOfMGCs]
	
	this->gv_switch = ( int **  ) calloc( nOfStreams,sizeof( int * ) );		// [nOfStreams][nOfDers*nOfMGCs]
	
	this->voiced_unvoiced = ( int * ) calloc( maxNumOfFrames,sizeof( int ) );	// [maxNumOfFrames]
	
	// HTS_SMatrixies needed
	this->g		= ( double **  ) calloc( nOfStreams,sizeof( double *  ) );	// [nOfStreams][maxNumOfFrames]
	this->wum	= ( double **  ) calloc( nOfStreams,sizeof( double *  ) );	// [nOfStreams][maxNumOfFrames]
	this->wuw	= ( double *** ) calloc( nOfStreams,sizeof( double ** ) );	// [nOfStreams][maxNumOfFrames][maxWindowWidth]

	for( k = 0; k < nOfStreams; k++ )
	{
		this->mean[k] = ( double ** ) calloc( maxNumOfFrames,sizeof( double * ) );
		this->ivar[k] = ( double ** ) calloc( maxNumOfFrames,sizeof( double * ) );
		this->par [k] = ( double ** ) calloc( maxNumOfFrames,sizeof( double * ) );
		this->g	  [k] = ( double *  ) calloc( maxNumOfFrames,sizeof( double   ) );
		this->wum [k] = ( double *  ) calloc( maxNumOfFrames,sizeof( double   ) );
		this->wuw [k] = ( double ** ) calloc( maxNumOfFrames,sizeof( double * ) );	
		
		this->gv_mean[k]	= ( double * ) calloc( nOfStreams * nOfDers * nOfMGCs,sizeof( double ) );	
		this->gv_vari[k]	= ( double * ) calloc( nOfStreams * nOfDers * nOfMGCs,sizeof( double ) );	
		
		this->gv_switch[k]	= ( int * ) calloc( nOfStreams * nOfDers * nOfMGCs,sizeof( int ) );	
		
		for( int j = 0; j < maxNumOfFrames; j++ )
		{
			this->mean[k][j] = ( double * ) calloc( nOfDers * nOfMGCs,sizeof( double ) );
			this->ivar[k][j] = ( double * ) calloc( nOfDers * nOfMGCs,sizeof( double ) );
			this->par [k][j] = ( double * ) calloc( nOfDers * nOfMGCs,sizeof( double ) );
			this->wuw [k][j] = ( double * ) calloc( maxWindowWidth ,sizeof( double ) );
		}
	}	
	
	// configuration arguments
	this->argv	= ( char ** ) calloc( maxNumOfArguments,sizeof( char * ) );
	
	for( k = 0; k < maxNumOfArguments; k++ )
		this->argv[k] = ( char * ) calloc( maxStrLen,sizeof( char ) );
}

MAGE::ModelMemory::~ModelMemory( void )
{
	int k;
		
	for( k = 0; k < nOfStreams; k++ )
	{
		for( int j = 0; j < maxNumOfFrames; j++ )
		{
			free( this->mean[k][j] );
			free( this->ivar[k][j] );
			free( this->par [k][j] );
			free( this->wuw [k][j] );
		}
		
		free( this->mean[k] );
		free( this->ivar[k] );
		free( this->par [k] );
		free( this->g	[k] );
		free( this->wum [k] );
		free( this->wuw [k] );
		free( this->gv_mean	 [k] );
		free( this->gv_vari	 [k] );
		free( this->gv_switch[k] );
	}
	
	free( this->mean );
	free( this->ivar );
	free( this->par  );
	free( this->g	 );
	free( this->wum  );
	free( this->wuw  );
	free( this->gv_mean );
	free( this->gv_vari );
	free( this->gv_switch );
	free( this->voiced_unvoiced );
	
	for( k = 0; k < maxNumOfArguments; k++ )
		free( this->argv[k] );
	free( this->argv );
}
*/
MAGE::Model::Model()
{
	this->duration = 0;
	this->weightsChecked = false;
}

MAGE::Model::~Model( void )
{
}

// getters
MAGE::State MAGE::Model::getState( int index )
{
	return( this->state[index] );
}

int MAGE::Model::getDuration( void )
{ 
	return( this->duration );
}

//setters
void MAGE::Model::setState( MAGE::State state, int index )
{
	this->state[index] = state;
	return;
}

void MAGE::Model::setDuration( int duration )
{
	this->duration = duration;
	return;
}

// methods
void MAGE::Model::checkInterpolationWeights( MAGE::Engine *engine, bool forced )// ATTENTION !!! it must be run at least once
{
	int i, j;
	double temp;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	
	//do it only once
	if( !this->weightsChecked || forced)
	{

		// check interpolation weights 
		for( i = 0, temp = 0.0; i < HTS_ModelSet_get_duration_interpolation_size( &ms ); i++ )
			temp += global.duration_iw[i];

		if( temp != 0.0 )
			for( i = 0; i < HTS_ModelSet_get_duration_interpolation_size( &ms ); i++ )
				if( global.duration_iw[i] != 0.0 )
					global.duration_iw[i] /= temp; // ATTENTION !!! should not change in the model !!!

		for( i = 0; i < nOfStreams; i++ )
		{
			for( j = 0, temp = 0.0; j < HTS_ModelSet_get_parameter_interpolation_size( &ms, i ); j++ )
				temp += global.parameter_iw[i][j];

			if( temp != 0.0 )
				for( j = 0; j < HTS_ModelSet_get_parameter_interpolation_size( &ms, i ); j++ )
					if( global.parameter_iw[i][j] != 0.0 )
						global.parameter_iw[i][j] /= temp; // ATTENTION !!! should not change in the model !!!

			if( HTS_ModelSet_use_gv( &ms, i ) )
			{
				for( j = 0, temp = 0.0; j < HTS_ModelSet_get_gv_interpolation_size( &ms, i ); j++ )
					temp += global.gv_iw[i][j];

				if( temp != 0.0 )
					for( j = 0; j < HTS_ModelSet_get_gv_interpolation_size( &ms, i ); j++ )
						if( global.gv_iw[i][j] != 0.0 )
							global.gv_iw[i][j] /= temp; // ATTENTION !!! should not change in the model !!!
			}
		}
		
		this->weightsChecked = true;
	}
	return;
}

void MAGE::Model::computeDuration( MAGE::Engine *engine, MAGE::Label *label )
{
	int	i;
	double temp;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	
	// determine state duration 
	const double rate = global.sampling_rate / ( global.fperiod * 1e+7 );
	
	static double duration_mean[nOfStates];
	static double duration_vari[nOfStates];
	static int duration_array[nOfStates];
	
	double frame_length;
	
	// convert string query to char* 
	string query = label->getQuery();
	strcpy( this->strQuery, query.c_str() );
	
	
	// HTS_ModelSet_get_duration: get duration using interpolation weight 
	HTS_ModelSet_get_duration( &ms, strQuery, duration_mean, duration_vari, global.duration_iw );
	
	if( label->getIsForced() ) // use duration set by user : -vp
	{
		frame_length = ( label->getEnd()- label->getBegin() )* rate;
		
		if( label->getEnd() > 0 )
			this->duration = mHTS_set_duration( duration_array, duration_mean, duration_vari, nOfStates, frame_length );
		else
			HTS_error( -1,( char * )"HTS_SStreamSet_create: The time of final label is not specified.\n" );
	}
	else // determine frame length
	{
		if( label->getSpeed()!= 1 )
		{
			temp = 0.0;
			for( i = 0; i < nOfStates; i++ )
				temp += duration_mean[i];
			
			frame_length = temp / label->getSpeed();
		}
		else
			frame_length = 0;
		
		// set state duration 
		this->duration = mHTS_set_duration( duration_array, duration_mean, duration_vari, nOfStates, frame_length );
	}
	
	for( i = 0; i < nOfStates; i++ )
		this->state[i].duration = duration_array[i];
		
	return;
}

void MAGE::Model::updateDuration( int *updateFunction, int action )
{
	int i;
	int duration = 0;
	
	for( i = 0; i < nOfStates; i++ )
	{
		if( action == MAGE::overwrite )
			this->state[i].duration = updateFunction[i];
		
		if( action == MAGE::shift )
			this->state[i].duration += updateFunction[i];
		
		if( action == MAGE::scale )
			this->state[i].duration *= updateFunction[i];
		
		duration += this->state[i].duration;
	}
	
	this->duration = duration;
	return;
}


void MAGE::Model::computeParameters( MAGE::Engine *engine, MAGE::Label *label )
{
	int i, j;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
		
	// convert string query to char* 
	string query = label->getQuery();
	strcpy( this->strQuery, query.c_str() );
	
	// get parameter 
	int mcg_stream_index = 0;
	int mgc_length = nOfDers * nOfMGCs;
	static double mgc_mean[nOfDers * nOfMGCs];
	static double mgc_vari[nOfDers * nOfMGCs];
	
	int lf0_stream_index = 1;
	int lf0_length = nOfDers * nOfLF0s;
	static double lf0_mean[nOfDers * nOfLF0s];
	static double lf0_vari[nOfDers * nOfLF0s];
	static double lf0_msd;//[nOfDers*nOfLF0s];
	
	int lpf_stream_index = 2;
	int lpf_length = nOfDers * nOfLPFs;
	static double lpf_mean[nOfDers * nOfLPFs];
	static double lpf_vari[nOfDers * nOfLPFs];
	
	for( i = 0; i < nOfStates; i++ )
	{
		HTS_ModelSet_get_parameter( &ms, strQuery, mgc_mean, mgc_vari, NULL, mcg_stream_index, i+2, global.parameter_iw[mcg_stream_index] ); 
		
		for( j = 0; j < mgc_length; j++ )
		{
			this->state[i].mgc[j].mean = mgc_mean[j];
			this->state[i].mgc[j].vari = mgc_vari[j];
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lf0_mean, lf0_vari, &lf0_msd, lf0_stream_index, i+2, global.parameter_iw[lf0_stream_index] ); 
		
		for( j = 0; j < lf0_length; j++ )
		{
			this->state[i].lf0[j].mean = lf0_mean[j];
			this->state[i].lf0[j].vari = lf0_vari[j];
			this->state[i].lf0[j].msdFlag = lf0_msd;
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lpf_mean, lpf_vari, NULL, lpf_stream_index, i+2, global.parameter_iw[lpf_stream_index] );
		
		for( j = 0; j < lpf_length; j++ )
		{
			this->state[i].lpf[j].mean = lpf_mean[j];
			this->state[i].lpf[j].vari = lpf_vari[j];
		}
	}
	
	return;
}

void MAGE::Model::computeGlobalVariances( MAGE::Engine *engine, MAGE::Label *label )
{
	int i, j;
	
	bool gv_switch;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	
	// convert string query to char* 
	static string query = label->getQuery();
	strcpy( this->strQuery, query.c_str() );
	
	// determine GV 
	static int mcg_stream_index = 0;
	static int gv_mgc_length = nOfDers * nOfMGCs;
	static double gv_mgc_mean[nOfDers * nOfMGCs];
	static double gv_mgc_vari[nOfDers * nOfMGCs];
	
	static int lf0_stream_index = 1;
	static int gv_lf0_length = nOfDers * nOfLF0s;
	static double gv_lf0_mean[nOfDers * nOfLF0s];
	static double gv_lf0_vari[nOfDers * nOfLF0s];
	
	static int lpf_stream_index = 2;
	static int gv_lpf_length = nOfDers * nOfLPFs;
	static double gv_lpf_mean[nOfDers * nOfLPFs];
	static double gv_lpf_vari[nOfDers * nOfLPFs];
	
	if( HTS_ModelSet_use_gv( &ms, mcg_stream_index ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_mgc_mean, gv_mgc_vari, mcg_stream_index, global.gv_iw[mcg_stream_index] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < gv_mgc_length; j++ )
			{
				this->state[i].gv_mgc[j].mean = gv_mgc_mean[j];
				this->state[i].gv_mgc[j].vari = gv_mgc_vari[j];
			}
	}
	
	if( HTS_ModelSet_use_gv( &ms, lf0_stream_index ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_lf0_mean, gv_lf0_vari, lf0_stream_index, global.gv_iw[lf0_stream_index] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < gv_lf0_length; j++ )
			{
				this->state[i].gv_lf0[j].mean = gv_lf0_mean[j];
				this->state[i].gv_lf0[j].vari = gv_lf0_vari[j];
			}
	}
	
	if( HTS_ModelSet_use_gv( &ms, lpf_stream_index ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_lpf_mean, gv_lpf_vari, lpf_stream_index, global.gv_iw[lpf_stream_index] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < gv_lpf_length; j++ )
			{
				this->state[i].gv_lpf[j].mean = gv_lpf_mean[j];
				this->state[i].gv_lpf[j].vari = gv_lpf_vari[j];
			}
	}
	
	//TODO fix this
	// 1. one gv_switch per stream
	// 2. one gv_switch for nstates, not nstates gv_switch
	if( HTS_ModelSet_have_gv_switch( &ms ) == true )
	{
		if( HTS_ModelSet_get_gv_switch( &ms, strQuery ) == false )
			gv_switch = false;
		else 
			gv_switch = true;
	}
	
	for( i = 0; i < nOfStates; i++ )
	{
		//set manually for now
		this->state[i].mgc_gv_switch = true;
		this->state[i].lf0_gv_switch = true;
		this->state[i].lpf_gv_switch = false;
	}
		
	return;
}

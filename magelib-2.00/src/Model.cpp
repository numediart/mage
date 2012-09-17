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
 * 	Model.cpp
 * 	mageOsc
 * 
 * 	Created by Maria Astrinaki on 11/07/12.
 * 	Copyright 2012. All rights reserved.
 * 
 */

#include "Model.h"

// constructor
MAGE::ModelMemory::ModelMemory()
{
	int k;
	
	// for every state
	this->duration_mean  = ( double * ) calloc( nOfStates, sizeof( double ) );
	this->duration_vari  = ( double * ) calloc( nOfStates, sizeof( double ) );
	this->duration_array = ( int    * ) calloc( nOfStates, sizeof( int    ) );;
	
	// # of MGC coefficients for the MLSA filter & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
	this->mgc_mean = ( double * ) calloc( nOfDers * nOfMGCs, sizeof( double ) );	// [nOfDers * nOfMGCs]
	this->mgc_vari = ( double * ) calloc( nOfDers * nOfMGCs, sizeof( double ) );	// [nOfDers * nOfMGCs]
	
	// fundamental frequency & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
	this->lf0_mean = ( double * ) calloc( nOfDers * nOfLF0s, sizeof( double ) );	// [nOfDers * nOfLF0s]
	this->lf0_vari = ( double * ) calloc( nOfDers * nOfLF0s, sizeof( double ) );	// [nOfDers * nOfLF0s]
	
	// # of low-pass filter coefficients & # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
	this->lpf_mean = ( double * ) calloc( nOfDers * nOfLPFs, sizeof( double ) );	// [nOfDers * nOfLPFs]
	this->lpf_vari = ( double * ) calloc( nOfDers * nOfLPFs, sizeof( double ) );	// [nOfDers * nOfLPFs]
}

// destructor
MAGE::ModelMemory::~ModelMemory( void )
{
	free( this->duration_mean  ); 
	free( this->duration_vari  ); 
	free( this->duration_array ); 
	free( this->mgc_mean ); 
	free( this->mgc_vari ); 
	free( this->lf0_mean ); 
	free( this->lf0_vari ); 
	free( this->lpf_mean ); 
	free( this->lpf_vari );
}

// constructor
MAGE::Model::Model()
{
	this->duration = 0;
	this->weightsChecked = false;
}

// destructor
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
void MAGE::Model::checkInterpolationWeights( MAGE::Engine * engine, bool forced )// ATTENTION :: it must be run at least once
{
	int i, j;
	double temp;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	//do it only once
	if( !this->weightsChecked || forced)
	{

		// check interpolation weights 
		for( i = 0, temp = 0.0; i < HTS_ModelSet_get_duration_interpolation_size( &ms ); i++ )
			temp += global.duration_iw[i];

		if( temp != 0.0 )
			for( i = 0; i < HTS_ModelSet_get_duration_interpolation_size( &ms ); i++ )
				if( global.duration_iw[i] != 0.0 )
					global.duration_iw[i] /= temp; // ATTENTION :: should not change in the model !!!

		for( i = 0; i < nOfStreams; i++ )
		{
			for( j = 0, temp = 0.0; j < HTS_ModelSet_get_parameter_interpolation_size( &ms, i ); j++ )
				temp += global.parameter_iw[i][j];

			if( temp != 0.0 )
				for( j = 0; j < HTS_ModelSet_get_parameter_interpolation_size( &ms, i ); j++ )
					if( global.parameter_iw[i][j] != 0.0 )
						global.parameter_iw[i][j] /= temp; // ATTENTION :: should not change in the model !!!

			if( HTS_ModelSet_use_gv( &ms, i ) )
			{
				for( j = 0, temp = 0.0; j < HTS_ModelSet_get_gv_interpolation_size( &ms, i ); j++ )
					temp += global.gv_iw[i][j];

				if( temp != 0.0 )
					for( j = 0; j < HTS_ModelSet_get_gv_interpolation_size( &ms, i ); j++ )
						if( global.gv_iw[i][j] != 0.0 )
							global.gv_iw[i][j] /= temp; // ATTENTION :: should not change in the model !!!
			}
		}
		this->weightsChecked = true;
	}
	return;
}

void MAGE::Model::computeDuration( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight )
{
	int	i;
	double iw;
	double temp;
	double frame_length;

	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	// determine state duration 
	const double rate = global.sampling_rate / ( global.fperiod * 1e+7 );
	
	// convert string query to char * 
	string query = label->getQuery();
	strcpy( this->modelMemory.strQuery, query.c_str() );
	
	if( interpolationWeight != NULL )
		iw = interpolationWeight[durStreamIndex];
	else 
		iw = 1;
	
	// HTS_ModelSet_get_duration: get duration using interpolation weight 
	HTS_ModelSet_get_duration( &ms, this->modelMemory.strQuery, this->modelMemory.duration_mean, 
									this->modelMemory.duration_vari, global.duration_iw );
	
	if( label->getIsForced() ) // use duration set by user : -vp
	{
		frame_length = ( label->getEnd()- label->getBegin() ) * rate;
		
		if( label->getEnd() > 0 )
			this->duration = mHTS_set_duration( this->modelMemory.duration_array, this->modelMemory.duration_mean,
												this->modelMemory.duration_vari , nOfStates, frame_length );
		else
			HTS_error( -1,( char * )"HTS_SStreamSet_create: The time of final label is not specified.\n" );
	}
	else // determine frame length
	{
		if( label->getSpeed()!= 1 )
		{
			temp = 0.0;
			for( i = 0; i < nOfStates; i++ )
				temp += this->modelMemory.duration_mean[i];
			
			frame_length = temp / label->getSpeed();
		}
		else
			frame_length = 0;
		
		// set state duration 
		this->duration = mHTS_set_duration( this->modelMemory.duration_array, this->modelMemory.duration_mean, 
											this->modelMemory.duration_vari, nOfStates, frame_length );
	}
	
	for( i = 0; i < nOfStates; i++ )
		this->state[i].duration += iw * this->modelMemory.duration_array[i];
		
	return;
}

void MAGE::Model::updateDuration( double * updateFunction, int action )
{
	int duration = 0;
	
	if( updateFunction == NULL )
		return;
	
	for( int i = 0; i < nOfStates; i++ )
	{
		switch( action )
		{
			case MAGE::overwrite:
				this->state[i].duration = updateFunction[i];
				break;
				
			case MAGE::shift:
				this->state[i].duration += updateFunction[i];
				break;
				
			case MAGE::scale:
				this->state[i].duration *= updateFunction[i];
				break;
				
			case MAGE::synthetic:
			case MAGE::noaction:
			default:
				break;
		}
		
		if( this->state[i].duration < 0)
			this->state[i].duration = 1;
		
		duration += this->state[i].duration;
	}
	
	this->duration = duration;
	return;
}

// TODO ::
// we have to reduce this function to control 
// streams one at a time, not using if() but 
// passing the stream id as an argument

void MAGE::Model::computeParameters( MAGE::Engine * engine, MAGE::Label * label, double * interpolationWeight )
{
	int i, j;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	// convert string query to char * 
	string query = label->getQuery();
	strcpy( this->strQuery, query.c_str() );
	
	double lf0_msd;
	double mgcIW, lf0IW, lpfIW;
	
	if( interpolationWeight != NULL)
	{
		mgcIW = interpolationWeight[mgcStreamIndex];
		lf0IW = interpolationWeight[lf0StreamIndex];
		lpfIW = interpolationWeight[lpfStreamIndex];
	}
	else
	{
		mgcIW = 1;
		lf0IW = 1;
		lpfIW = 1;
	}

	for( i = 0; i < nOfStates; i++ )
	{
		HTS_ModelSet_get_parameter( &ms, strQuery, this->modelMemory.mgc_mean, this->modelMemory.mgc_vari, 
								   NULL, mgcStreamIndex, i+2, global.parameter_iw[mgcStreamIndex] ); 
				
		for( j = 0; j < mgcLen; j++ )
		{
			this->state[i].mgc[j].mean += mgcIW * this->modelMemory.mgc_mean[j];
			this->state[i].mgc[j].vari += mgcIW * mgcIW * this->modelMemory.mgc_vari[j];
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, this->modelMemory.lf0_mean, this->modelMemory.lf0_vari, 
								   &lf0_msd, lf0StreamIndex, i+2, global.parameter_iw[lf0StreamIndex] ); 

		for( j = 0; j < lf0Len; j++ )
		{
			this->state[i].lf0[j].mean += lf0IW * this->modelMemory.lf0_mean[j];
			this->state[i].lf0[j].vari += lf0IW * lf0IW * this->modelMemory.lf0_vari[j];
			this->state[i].lf0[j].msdFlag = lf0_msd;
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, this->modelMemory.lpf_mean, this->modelMemory.lpf_vari, 
								   NULL, lpfStreamIndex, i+2, global.parameter_iw[lpfStreamIndex] );
		
		for( j = 0; j < lpfLen; j++ )
		{
			this->state[i].lpf[j].mean += lpfIW * this->modelMemory.lpf_mean[j];
			this->state[i].lpf[j].vari += lpfIW * lpfIW * this->modelMemory.lpf_vari[j];
		}
	}
	
	return;
}

// TODO ::
// we have to reduce this function to control 
// streams one at a time, not using if() but 
// passing the stream id as an argument 

void MAGE::Model::computeGlobalVariances( MAGE::Engine * engine, MAGE::Label * label )
{
	int i, j;
	
	bool gv_switch;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	// convert string query to char * 
	string query = label->getQuery();
	strcpy( this->strQuery, query.c_str() );
	
	if( HTS_ModelSet_use_gv( &ms, mgcStreamIndex ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, this->modelMemory.mgc_mean, this->modelMemory.mgc_vari, 
							 mgcStreamIndex, global.gv_iw[mgcStreamIndex] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < mgcLen; j++ )
			{
				this->state[i].gv_mgc[j].mean = this->modelMemory.mgc_mean[j];
				this->state[i].gv_mgc[j].vari = this->modelMemory.mgc_vari[j];
			}
	}
	
	if( HTS_ModelSet_use_gv( &ms, lf0StreamIndex ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, this->modelMemory.lf0_mean, this->modelMemory.lf0_vari, 
							 lf0StreamIndex, global.gv_iw[lf0StreamIndex] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < lf0Len; j++ )
			{
				this->state[i].gv_lf0[j].mean = this->modelMemory.lf0_mean[j];
				this->state[i].gv_lf0[j].vari = this->modelMemory.lf0_vari[j];
			}
	}
	
	if( HTS_ModelSet_use_gv( &ms, lpfStreamIndex ) )
	{
		HTS_ModelSet_get_gv( &ms, strQuery, this->modelMemory.lpf_mean, this->modelMemory.lpf_vari, 
							 lpfStreamIndex, global.gv_iw[lpfStreamIndex] );
		
		for( i = 0; i < nOfStates; i++ )
			for( j = 0; j < lpfLen; j++ )
			{
				this->state[i].gv_lpf[j].mean = this->modelMemory.lpf_mean[j];
				this->state[i].gv_lpf[j].vari = this->modelMemory.lpf_vari[j];
			}
	}
	
	//TODO :: fix this
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

void MAGE::Model::initDuration( void )
{
	for( int i = 0; i < nOfStates; i++ )
		this->state[i].duration = 0;
	
	return;
}

void MAGE::Model::initParameters( void )
{
	int i, j;
	
	for( i = 0; i < nOfStates; i++ )
	{
		for( j = 0; j < mgcLen; j++ )
		{
			this->state[i].mgc[j].mean = 0;
			this->state[i].mgc[j].vari = 0;
		}
		
		for( j = 0; j < lf0Len; j++ )
		{
			this->state[i].lf0[j].mean = 0;
			this->state[i].lf0[j].vari = 0;
		}
		
		for( j = 0; j < lpfLen; j++ )
		{
			this->state[i].lpf[j].mean = 0;
			this->state[i].lpf[j].vari = 0;
		}
	}
	
	return;
}


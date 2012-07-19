/*
 *  Model.cpp
 *  mageOsc
 *
 *  Created by Maria Astrinaki on 11/07/12.
 *  Copyright 2012. All rights reserved.
 *
 */

#include "Model.h"

MAGE::Model::Model( void ) 
{
	this->duration = 0;
	this->mgc_pdf.reserve(maxNumOfFrames); 
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
}

void MAGE::Model::setDuration( int duration )
{
	this->duration = duration;
}

// methods

void MAGE::Model::checkInterpolationWeights( MAGE::Engine *engine )// ATTENTION !!! it must be run at least once
{
	int i, j;
	double temp;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	// check interpolation weights 
	for ( i = 0, temp = 0.0; i < HTS_ModelSet_get_duration_interpolation_size(&ms); i++ )
		temp += global.duration_iw[i];
	 
	if ( temp != 0.0 )
		for ( i = 0; i < HTS_ModelSet_get_duration_interpolation_size(&ms); i++ )
			if ( global.duration_iw[i] != 0.0 )
				global.duration_iw[i] /= temp; // ATTENTION !!! should not change in the model !!!
	 
	 for ( i = 0; i < nOfStreams; i++ ) 
	 {
		 for ( j = 0, temp = 0.0; j < HTS_ModelSet_get_parameter_interpolation_size(&ms, i); j++ )
			 temp += global.parameter_iw[i][j];
		 
		 if ( temp != 0.0 )
			 for ( j = 0; j < HTS_ModelSet_get_parameter_interpolation_size(&ms, i); j++ )
				if ( global.parameter_iw[i][j] != 0.0 )
					global.parameter_iw[i][j] /= temp; // ATTENTION !!! should not change in the model !!!
	 
		 if ( HTS_ModelSet_use_gv(&ms, i) ) 
		 {
			 for ( j = 0, temp = 0.0; j < HTS_ModelSet_get_gv_interpolation_size(&ms, i); j++ )
				 temp += global.gv_iw[i][j];
	 
			 if ( temp != 0.0 )
				for ( j = 0; j < HTS_ModelSet_get_gv_interpolation_size(&ms, i); j++ )
					if ( global.gv_iw[i][j] != 0.0 )
						global.gv_iw[i][j] /= temp; // ATTENTION !!! should not change in the model !!!
		 }
	 }
	
	return;
}

void MAGE::Model::computeDuration( MAGE::Engine *engine, MAGE::Label *label )
{
	int	i;
	double temp;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();

	// determine state duration 
	const double rate = global.sampling_rate / ( global.fperiod * 1e+7 );
	
	double duration_mean[nOfStates];
	double duration_vari[nOfStates];
	int duration[nOfStates];

	double frame_length;
	
	// convert string query to char* 
	string query = label->getQuery();
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );

	
	// HTS_ModelSet_get_duration: get duration using interpolation weight 
	HTS_ModelSet_get_duration( &ms, strQuery, duration_mean, duration_vari, global.duration_iw );

	if ( label->getIsForced() ) // use duration set by user : -vp
	{
		frame_length = label->getEnd() * rate;
		 
		if ( label->getEnd() > 0 ) 
			this->duration = mHTS_set_duration( duration, duration_mean, duration_vari, nOfStates, frame_length );
			
		else
			HTS_error( -1, (char *) "HTS_SStreamSet_create: The time of final label is not specified.\n" );
	}
	else // determine frame length
	{
		if ( label->getSpeed() != 1 ) 
		{
			temp = 0.0;
			for ( i = 0; i < nOfStates; i++ ) 
				temp += duration_mean[i];
	
			frame_length = temp / label->getSpeed();
		}
		else
			frame_length = 0;
		
		// set state duration 
		this->duration = mHTS_set_duration( duration, duration_mean, duration_vari, nOfStates, frame_length );
	}
	
	for ( i = 0; i < nOfStates; i++ ) 
		this->state[i].duration = duration[i];
		
	return;
}

void MAGE::Model::computeParameters( MAGE::Engine *engine, MAGE::Label *label )
{
	int i, j;
	
	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();
	
	// convert string query to char* 
	string query = label->getQuery();
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );
	
	// get parameter 
	int mcg_stream_index = 0;
	int mgc_length = nOfDers*nOfMGCs;
	double mgc_mean[mgc_length];
	double mgc_vari[mgc_length];
	
	int lf0_stream_index = 1;
	int lf0_length = nOfDers*nOfLF0s;
	double lf0_mean[lf0_length];
    double lf0_vari[lf0_length];
    double lf0_msd[lf0_length];
	
	int lpf_stream_index = 2;
	int lpf_length = nOfDers*nOfLPFs;
    double lpf_mean[lpf_length];
    double lpf_vari[lpf_length];
	
	for ( i = 0; i < nOfStates; i++ ) 
	{
		HTS_ModelSet_get_parameter( &ms, strQuery, mgc_mean, mgc_vari, NULL, mcg_stream_index, i+2, global.parameter_iw[mcg_stream_index] ); 
		
		for ( j = 0; j < mgc_length; j++) 
		{
			this->state[i].mgc[j].mean = mgc_mean[j];
			this->state[i].mgc[j].vari = mgc_vari[j];
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lf0_mean, lf0_vari, lf0_msd, lf0_stream_index, i+2, global.parameter_iw[lf0_stream_index] ); 
		
		for ( j = 0; j < lf0_length; j++) 
		{
			this->state[i].lf0[j].mean = lf0_mean[j];
			this->state[i].lf0[j].vari = lf0_vari[j];
			this->state[i].lf0[j].msdFlag = lf0_msd[j];
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lpf_mean, lpf_vari, NULL, lpf_stream_index, i+2, global.parameter_iw[lpf_stream_index] );

		for ( j = 0; j < lpf_length; j++) 
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

	HTS_ModelSet ms = engine->getModelSet();
	HTS_Global global = engine->getGlobal();

	// convert string query to char* 
	string query = label->getQuery();
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );

	// determine GV 
	int mcg_stream_index = 0;
	int gv_mgc_length = nOfDers*nOfMGCs;
	double gv_mgc_mean[gv_mgc_length];
	double gv_mgc_vari[gv_mgc_length];
		
	int lf0_stream_index = 1;
	int gv_lf0_length = nOfDers*nOfLF0s;
    double gv_lf0_mean[gv_lf0_length];
    double gv_lf0_vari[gv_lf0_length];
	
	int lpf_stream_index = 2;
	int gv_lpf_length = nOfDers*nOfLPFs;
    double gv_lpf_mean[gv_lpf_length];
    double gv_lpf_vari[gv_lpf_length];
		
	if ( HTS_ModelSet_use_gv( &ms, mcg_stream_index) ) 
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_mgc_mean, gv_mgc_vari, mcg_stream_index, global.gv_iw[mcg_stream_index] );
		
		for ( i = 0; i < nOfStates; i++ ) 
			for ( j = 0; j < gv_mgc_length; j++ ) 
			{
				this->state[i].gv_mgc[j].mean = gv_mgc_mean[j];
				this->state[i].gv_mgc[j].vari = gv_mgc_vari[j];
			}
	}
	
	if ( HTS_ModelSet_use_gv( &ms, lf0_stream_index) ) 
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_lf0_mean, gv_lf0_vari, lf0_stream_index, global.gv_iw[lf0_stream_index] );
		
		for ( i = 0; i < nOfStates; i++ ) 
			for ( j = 0; j < gv_lf0_length; j++ ) 
			{
				this->state[i].gv_lf0[j].mean = gv_lf0_mean[j];
				this->state[i].gv_lf0[j].vari = gv_lf0_vari[j];
			}
	}
	
	if ( HTS_ModelSet_use_gv( &ms, lpf_stream_index) ) 
	{
		HTS_ModelSet_get_gv( &ms, strQuery, gv_lpf_mean, gv_lpf_vari, lpf_stream_index, global.gv_iw[lpf_stream_index] );
		
		for ( i = 0; i < nOfStates; i++ ) 
			
			for ( j = 0; j < gv_lpf_length; j++ ) 
			{
				this->state[i].gv_lpf[j].mean = gv_lpf_mean[j];
				this->state[i].gv_lpf[j].vari = gv_lpf_vari[j];
			}
	}
		
	if ( HTS_ModelSet_have_gv_switch(&ms) == true )
		if ( HTS_ModelSet_get_gv_switch( &ms, strQuery ) == false )
			for ( i = 0; i < nOfStates; i++ )
				this->state[i].gv_switch = false;
	
	return;
}

/*void optimizeParameters( MAGE::Engine *engine )
{
	static 
    int i, j, k, l, m;
	HTS_Boolean not_bound;

	for (i = 0; i < pss->nstream; i++) {
		pst->sm.mean = HTS_alloc_matrix(pst->length, pst->vector_length);
		pst->sm.ivar = HTS_alloc_matrix(pst->length, pst->vector_length);
		pst->sm.wum = (double *) HTS_calloc(pst->length, sizeof(double));
		pst->sm.wuw = HTS_alloc_matrix(pst->length, pst->width);
		pst->sm.g = (double *) HTS_calloc(pst->length, sizeof(double));
		pst->par = HTS_alloc_matrix(pst->length, pst->static_length);
	}

		// copy pdfs
		if (HTS_SStreamSet_is_msd(sss, i)) {      // for MSD
			for (state = 0, frame = 0, msd_frame = 0; state < HTS_SStreamSet_get_total_state(sss); state++)
				for (j = 0; j < HTS_SStreamSet_get_duration(sss, state); j++) {
					if (pst->msd_flag[frame]) {
						// check current frame is MSD boundary or not
						for (k = 0; k < pst->win_size; k++) {
							not_bound = TRUE;
							for (l = pst->win_l_width[k]; l <= pst->win_r_width[k]; l++)
								if (frame + l < 0 || pss->total_frame <= frame + l || !pst->msd_flag[frame + l]) {
									not_bound = FALSE;
									break;
								}
							for (l = 0; l < pst->static_length; l++) {
								m = pst->static_length * k + l;
								pst->sm.mean[msd_frame][m] = HTS_SStreamSet_get_mean(sss, i, state, m);
								if (not_bound || k == 0)
									pst->sm.ivar[msd_frame][m] = HTS_finv(HTS_SStreamSet_get_vari(sss, i, state, m));
								else
									pst->sm.ivar[msd_frame][m] = 0.0;
							}
						}
						msd_frame++;
					}
					frame++;
				}
		} else {                  // for non MSD
			for (state = 0, frame = 0; state < HTS_SStreamSet_get_total_state(sss); state++) {
				for (j = 0; j < HTS_SStreamSet_get_duration(sss, state); j++) {
					for (k = 0; k < pst->win_size; k++) {
						not_bound = TRUE;
						for (l = pst->win_l_width[k]; l <= pst->win_r_width[k]; l++)
							if (frame + l < 0 || pss->total_frame <= frame + l) {
								not_bound = FALSE;
								break;
							}
						for (l = 0; l < pst->static_length; l++) {
							m = pst->static_length * k + l;
							pst->sm.mean[frame][m] = HTS_SStreamSet_get_mean(sss, i, state, m);
							if (not_bound || k == 0)
								pst->sm.ivar[frame][m] = HTS_finv(HTS_SStreamSet_get_vari(sss, i, state, m));
							else
								pst->sm.ivar[frame][m] = 0.0;
						}
					}
					frame++;
				}
			}
		}
		// parameter generation
		HTS_PStream_mlpg(pst);
	}

	return;
}
*/


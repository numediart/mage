/*
 *  Model.cpp
 *  mageOsc
 *
 *  Created by Maria Astrinaki on 11/07/12.
 *  Copyright 2012. All rights reserved.
 *
 */

#include "Model.h"

MAGE::ModelMemory::ModelMemory() 
{
	// for every stream, for every frame, every mean / ivar / optimized parameters / gv_mean / gv_vari / gv_switch
	mean = (double ***) calloc(nOfStreams,sizeof(double**));	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	ivar = (double ***) calloc(nOfStreams,sizeof(double**));	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	par  = (double ***) calloc(nOfStreams,sizeof(double**));	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs]
	gv_mean   = (double **) calloc(nOfStreams,sizeof(double*));	// [nOfStreams][nOfDers*nOfMGCs]
	gv_vari   = (double **) calloc(nOfStreams,sizeof(double*));	// [nOfStreams][nOfDers*nOfMGCs]
	gv_switch = (int **) calloc(nOfStreams,sizeof(int*));		// [nOfStreams][nOfDers*nOfMGCs]
	voiced_unvoiced = (int *) calloc(maxNumOfFrames,sizeof(int));// [maxNumOfFrames]
	
	// HTS_SMatrixies needed
	g    = (double ** ) calloc(nOfStreams,sizeof(double* ));	// [nOfStreams][maxNumOfFrames]
	wum  = (double ** ) calloc(nOfStreams,sizeof(double* ));	// [nOfStreams][maxNumOfFrames]
	wuw	 = (double ***) calloc(nOfStreams,sizeof(double**));	// [nOfStreams][maxNumOfFrames][maxWindowWidth]
	
	for ( int k = 0; k < nOfStreams; k++ ) 
	{
		mean[k] = (double **) calloc(maxNumOfFrames,sizeof(double*));
		ivar[k] = (double **) calloc(maxNumOfFrames,sizeof(double*));
		par [k] = (double **) calloc(maxNumOfFrames,sizeof(double*));
		g   [k] = (double *)  calloc(maxNumOfFrames,sizeof(double ));
		wum [k] = (double *)  calloc(maxNumOfFrames,sizeof(double ));
		wuw	[k] = (double **) calloc(maxNumOfFrames,sizeof(double*));	
		gv_mean[k]    = (double *) calloc(nOfStreams*nOfDers*nOfMGCs,sizeof(double));	
		gv_vari[k]    = (double *) calloc(nOfStreams*nOfDers*nOfMGCs,sizeof(double));	
		gv_switch[k]  = (int *) calloc(nOfStreams*nOfDers*nOfMGCs,sizeof(int));	
		
		for ( int j = 0; j < maxNumOfFrames; j++ ) 
		{
			mean[k][j] = (double *) calloc(nOfDers*nOfMGCs,sizeof(double));
			ivar[k][j] = (double *) calloc(nOfDers*nOfMGCs,sizeof(double));
			par [k][j] = (double *) calloc(nOfDers*nOfMGCs,sizeof(double));
			wuw [k][j] = (double *) calloc(maxWindowWidth ,sizeof(double));
		}
	}	
}

MAGE::ModelMemory::~ModelMemory( void ) 
{
	for ( int k = 0; k < nOfStreams; k++ ) 
	{
		for ( int j = 0; j < maxNumOfFrames; j++ ) 
		{
			free(mean[k][j]);
			free(ivar[k][j]);
			free(par [k][j]);
		}
		
		free(mean[k]);
		free(ivar[k]);
		free(par [k]);
		free(g   [k]);
		free(wum [k]);
		free(wuw [k]);
		free(gv_mean  [k]);
		free(gv_vari  [k]);
		free(gv_switch[k]);

	}
	free(mean);
	free(ivar);
	free(par );
	free(g   );
	free(wum );
	free(wuw );
	free(gv_mean);
	free(gv_vari);
	free(gv_switch);
	free(voiced_unvoiced);
}

MAGE::Model::Model( ModelMemory *m ) 
{
	this->duration = 0;
	this->mgc_pdf.reserve(maxNumOfFrames); 
	this->lf0_pdf.reserve(maxNumOfFrames); 
	this->lpf_pdf.reserve(maxNumOfFrames); 

	this->mem = m;
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
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	
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
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();

	// determine state duration 
	const double rate = global.sampling_rate / ( global.fperiod * 1e+7 );
	
	double duration_mean[nOfStates];
	double duration_vari[nOfStates];
	int duration_array[nOfStates];

	double frame_length;
	
	// convert string query to char* 
	string query = label->getQuery();
    //TODO this allocation has to disappear
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );

	
	// HTS_ModelSet_get_duration: get duration using interpolation weight 
	HTS_ModelSet_get_duration( &ms, strQuery, duration_mean, duration_vari, global.duration_iw );

	if ( label->getIsForced() ) // use duration set by user : -vp
	{
		frame_length = label->getEnd() * rate;
		 
		if ( label->getEnd() > 0 ) 
			this->duration = mHTS_set_duration( duration_array, duration_mean, duration_vari, nOfStates, frame_length );
			
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
		this->duration = mHTS_set_duration( duration_array, duration_mean, duration_vari, nOfStates, frame_length );
	}
	   
	for ( i = 0; i < nOfStates; i++ ) {
		this->state[i].duration = duration_array[i];
    }
    
    delete[] strQuery;
		
	return;
}

void MAGE::Model::computeParameters( MAGE::Engine *engine, MAGE::Label *label )
{
	int i, j;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	
	// ATTENTION !!! dynamic mem aloc
	
	// convert string query to char* 
	string query = label->getQuery();
    //TODO this allocation has to disappear
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );
	
	// get parameter 
	int mcg_stream_index = 0;
	int mgc_length = nOfDers*nOfMGCs;
	static double mgc_mean[nOfDers*nOfMGCs];
	static double mgc_vari[nOfDers*nOfMGCs];
	
	int lf0_stream_index = 1;
	int lf0_length = nOfDers*nOfLF0s;
	static double lf0_mean[nOfDers*nOfLF0s];
    static double lf0_vari[nOfDers*nOfLF0s];
    static double lf0_msd;//[nOfDers*nOfLF0s];
	
	int lpf_stream_index = 2;
	int lpf_length = nOfDers*nOfLPFs;
    static double lpf_mean[nOfDers*nOfLPFs];
    static double lpf_vari[nOfDers*nOfLPFs];
	
	for ( i = 0; i < nOfStates; i++ ) 
	{
		HTS_ModelSet_get_parameter( &ms, strQuery, mgc_mean, mgc_vari, NULL, mcg_stream_index, i+2, global.parameter_iw[mcg_stream_index] ); 
        
		for ( j = 0; j < mgc_length; j++) 
		{
			this->state[i].mgc[j].mean = mgc_mean[j];
			this->state[i].mgc[j].vari = mgc_vari[j];
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lf0_mean, lf0_vari, &lf0_msd, lf0_stream_index, i+2, global.parameter_iw[lf0_stream_index] ); 
		
		for ( j = 0; j < lf0_length; j++) 
		{
			this->state[i].lf0[j].mean = lf0_mean[j];
			this->state[i].lf0[j].vari = lf0_vari[j];
			this->state[i].lf0[j].msdFlag = lf0_msd;
		}
		
		HTS_ModelSet_get_parameter( &ms, strQuery, lpf_mean, lpf_vari, NULL, lpf_stream_index, i+2, global.parameter_iw[lpf_stream_index] );

		for ( j = 0; j < lpf_length; j++) 
		{
			this->state[i].lpf[j].mean = lpf_mean[j];
			this->state[i].lpf[j].vari = lpf_vari[j];
		}
	}
    
    delete[] strQuery;
	
	return;
}

void MAGE::Model::computeGlobalVariances( MAGE::Engine *engine, MAGE::Label *label )
{
	int i, j;

	bool gv_switch;
	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();

	// convert string query to char* 
	string query = label->getQuery();
    //TODO this allocation has to disappear
	char *strQuery = new char [query.size()+1];
	strcpy( strQuery, query.c_str() );

	// determine GV 
	static int mcg_stream_index = 0;
	static int gv_mgc_length = nOfDers*nOfMGCs;
	static double gv_mgc_mean[nOfDers*nOfMGCs];
	static double gv_mgc_vari[nOfDers*nOfMGCs];
		
	static int lf0_stream_index = 1;
	static int gv_lf0_length = nOfDers*nOfLF0s;
    static double gv_lf0_mean[nOfDers*nOfLF0s];
    static double gv_lf0_vari[nOfDers*nOfLF0s];
	
	static int lpf_stream_index = 2;
	static int gv_lpf_length = nOfDers*nOfLPFs;
    static double gv_lpf_mean[nOfDers*nOfLPFs];
    static double gv_lpf_vari[nOfDers*nOfLPFs];
		
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
	{
		if ( HTS_ModelSet_get_gv_switch( &ms, strQuery ) == false )
			gv_switch = false;
		else 
			gv_switch = true;
	}
	
	for ( i = 0; i < nOfStates; i++ )
	{
		this->state[i].mgc_gv_switch = gv_switch;
		this->state[i].lf0_gv_switch = gv_switch;
		this->state[i].lpf_gv_switch = gv_switch;
	}
	
    delete[] strQuery;

	return;
}

void MAGE::Model::optimizeParameters( MAGE::Engine *engine )
{	
	static HTS_ModelSet ms = engine->getModelSet();
	static HTS_Global global = engine->getGlobal();
	static HTS_PStream pss = engine->getPStream();
	
	int i, j, k, l, m;
	int state, frame, msd_frame, static_length;
	
	bool not_bound;
		
	for (state = 0, frame = 0; state < ms.nstate; state++) // for every state
	{
		for (j = 0; j < this->state[state].duration; j++, frame++) // for every frame
		{
			if (this->state[state].lf0[0].msdFlag > global.msd_threshold[1])  // if voiced
				mem->voiced_unvoiced[frame] = true;
			else
				mem->voiced_unvoiced[frame] = false;
		}
	}

	for (i = 0; i < ms.nstream; i++)  // for every stream : mgc, lf0, lpf
	{
		if (ms.stream[i].msd_flag)  // for MSD
		{
			for (state = 0, frame = 0, msd_frame = 0; state < ms.nstate; state++) // for every state
			{
				for (j = 0; j < this->state[state].duration; j++) // for every frame
				{
					if ( mem->voiced_unvoiced[frame] )
					{
						// check current frame is MSD boundary or not 
						for (k = 0; k < ms.stream[i].window.size; k++) 
						{
							not_bound = true;
							for (l = ms.stream[i].window.l_width[k]; l <= ms.stream[i].window.r_width[k]; l++)
							{
								if (frame + l < 0 || this->duration <= frame + l || !mem->voiced_unvoiced[frame+l] )  // voiced unvoided
								{
									not_bound = false;
									break;
								}
							}
														
							static_length = (ms.stream[i].vector_length / ms.stream[i].window.size);
							
							for (l = 0; l < static_length; l++) 
							{
								// ATTENTION !!! This is not the good way
								m = static_length * k + l;
								
								if ( i == 1 )  // lf0
								{
									mem->mean[i][msd_frame][m] = this->state[state].lf0[m].mean;
									
									if (not_bound || k == 0)
										mem->ivar[i][msd_frame][m] = HTS_finv(this->state[state].lf0[m].vari);
									
									else
										mem->ivar[i][msd_frame][m] = 0.0;
									
									// ATTENTION !!! Loop assignment
									mem->gv_mean[i][m] = this->state[state].gv_lf0[m].mean;
									mem->gv_vari[i][m] = this->state[state].gv_lf0[m].vari;
								}
							}
						}
						mem->gv_switch[i][msd_frame] = this->state[state].lf0_gv_switch;
						msd_frame++;
					}
					frame++;
				}
			}
		} 
		else // for non MSD 
		{                  
			for (state = 0, frame = 0; state < ms.nstate; state++) // for every state
			{
				for (j = 0; j < this->state[state].duration; j++) // for every frame
				{
					for (k = 0; k < ms.stream[i].window.size; k++) 
					{
						not_bound = true;
						for (l = ms.stream[i].window.l_width[k]; l <= ms.stream[i].window.r_width[k]; l++)
						{
							if (frame + l < 0 || this->duration <= frame + l) 
							{
								not_bound = false;
								break;
							}
						}
						
						static_length = (ms.stream[i].vector_length / ms.stream[i].window.size);
						
						for (l = 0; l < static_length; l++) 
						{
							// ATTENTION !!! This is not the good way
							m = static_length * k + l;
							
							if ( i == 0 )  // mgcs
							{
								mem->mean[i][frame][m] = this->state[state].mgc[m].mean;
								
								if (not_bound || k == 0)
									mem->ivar[i][frame][m] = HTS_finv(this->state[state].mgc[m].vari);
								else
									mem->ivar[i][frame][m] = 0.0;
								
								// ATTENTION !!! Loop assignment
								mem->gv_mean[i][m] = this->state[state].gv_mgc[m].mean;
								mem->gv_vari[i][m] = this->state[state].gv_mgc[m].vari;
								mem->gv_switch[i][m] = this->state[state].mgc_gv_switch;
							}
							
							if ( i == 2 )  // lpf
							{
								mem->mean[i][frame][m] = this->state[state].lpf[m].mean;
								
								if (not_bound || k == 0)
									mem->ivar[i][frame][m] = HTS_finv(this->state[state].lpf[m].vari);
								else
									mem->ivar[i][frame][m] = 0.0;
								
								// ATTENTION !!! Loop assignment
								mem->gv_mean[i][m] = this->state[state].gv_lpf[m].mean;
								mem->gv_vari[i][m] = this->state[state].gv_lpf[m].vari;
								mem->gv_switch[i][m] = this->state[state].lpf_gv_switch;
							}
						}
					}
					frame++;
				}
			}
		}

		// just vector assigments in order to create a HTS_PStream object and use the default HTS_PStream_mlpg function
		pss.vector_length = ms.stream[i].vector_length;			// vector length (include static and dynamic features) 
		pss.width = ms.stream[i].window.max_width * 2 + 1;		// width of dynamic window 
		pss.win_size = ms.stream[i].window.size;				// # of windows (static + deltas) 
		pss.win_l_width = ms.stream[i].window.l_width;			// left width of windows 
		pss.win_r_width = ms.stream[i].window.r_width;			// right width of windows 
		pss.win_coefficient = ms.stream[i].window.coefficient;	// window coefficients 
		pss.gv_mean = mem->gv_mean[i];							// mean vector of GV 
		pss.gv_vari = mem->gv_vari[i];							// variance vector of GV 
		pss.gv_switch = mem->gv_switch[i];						// GV flag sequence 
		pss.static_length = ms.stream[i].vector_length / ms.stream[i].window.size;		// static features length 
		
		
		if ( ms.stream[i].msd_flag )	// for MSD :: lf0
			pss.length = msd_frame;					// stream length :: total number of frames
		else							// for non MSD :: mgcs & lpf
			pss.length = frame;						// stream length :: total number of frames
		
		if ( HTS_ModelSet_use_gv(&ms, i)) // if GV is used 
			pss.gv_length = frame;					//frame length for GV calculation
		else 
			pss.gv_length = 0;					//frame length for GV calculation
			
		// matrices for parameter generation 		
		pss.sm.mean = mem->mean[i];		// mean vector sequence 
		pss.sm.ivar = mem->ivar[i];		// inverse diag variance sequence
		pss.sm.g    = mem->g[i];			// vector used in the forward substitution 
		pss.sm.wum  = mem->wum[i];		// W' U^-1 mu 
		pss.sm.wuw  = mem->wuw[i];		// W' U^-1 W  

		// output parameter vector
		pss.par = mem->par[i];		 
		
		HTS_PStream_mlpg(&pss);				// parameter generation 
			
		// ATTENTION !!! MemAlloc?? MemLeak??
		if ( i == 0 )  // mgcs
			this->mgc_pdf.assign(*pss.par, ((*pss.par)+(pss.static_length)));
		
		if ( i == 1 )  // lf0
			this->lf0_pdf.assign(*pss.par, ((*pss.par)+(pss.static_length)));

		if ( i == 2 )  // lpf
			this->lpf_pdf.assign(*pss.par, ((*pss.par)+(pss.static_length)));
	}

	return;
}



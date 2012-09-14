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
/* 		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
/* 																								*/
/* ----------------------------------------------------------------------------------------------- */

/** 
 * 	 @file	mage~.cpp
 * 	 @author A. Moinet
 */

#include "m_pd.h"
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <pthread.h>
#include <mage.h>

extern "C" 
{	
	using namespace std;
	using namespace MAGE;
	
	static t_class *mage_tilde_class;
	
	typedef struct _mage_tilde
	{
		t_object x_obj;
		pthread_t thread;
		Mage *mage;
	} t_mage_tilde;
	
	//void *mage_tilde_new(t_symbol *s, t_floatarg f);
	void *mage_tilde_new( void );
	t_int *mage_tilde_perform( t_int * w );
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp );
	void mage_tilde_bang( t_mage_tilde * x);
	void mage_tilde_free( t_mage_tilde * x );
	void mage_tilde_setup( void );
	void * genThread( void * argv );
	
	//access to MAGE controls
	void mage_tilde_alpha( t_mage_tilde * x, t_floatarg alpha );
	void mage_tilde_reset( t_mage_tilde * x );
	void mage_tilde_speed( t_mage_tilde * x, t_floatarg speed );
	void mage_tilde_volume( t_mage_tilde * x, t_floatarg volume );
	
	void fillLabelQueue( t_mage_tilde * x )
	{	
		int k;
		Label label;
		
		string line;
		string filename = "./inouts/labels/alice01.lab";
		
		ifstream myfile( filename.c_str() );
		
		if( !myfile.is_open() )
		{
			post( "could not open file %s",filename.c_str() );
			return;
		}
		
		for( k = 0; getline( myfile, line ); k++ )
		{
			//post( "pushing %s",line.c_str() );
			label.setQuery( line );
			x->mage->pushLabel( label );
		}
		
		myfile.close();
	}
	
	void mage_tilde_bang( t_mage_tilde * x )
	{
		post( "blocksize: %d",sys_getblksize() );
	}
	
	void * mage_tilde_new( void )
	{
		t_mage_tilde *x = (t_mage_tilde *) pd_new(mage_tilde_class);
		
		post("_new: starting");
		
		x->mage = new Mage();
		
		post("_new: loading engine");
		x->mage->addEngine( "slt", "./inouts/slt.conf" );
		post("_new: done with engine");
		
		post("_new: starting genThread");
		pthread_create(&(x->thread), NULL, genThread, (void *) x);
		post("_new : done with genThread");
		
		outlet_new(&x->x_obj, &s_signal);
		
		post("_new: done\n");
		
		return (void *)x;
	}
	
	void mage_tilde_setup( void )
	{
		mage_tilde_class = class_new(gensym("mage~"),(t_newmethod)mage_tilde_new,(t_method)mage_tilde_free,sizeof(t_mage_tilde),CLASS_DEFAULT, (t_atomtype) 0);
		
		class_addbang(mage_tilde_class, mage_tilde_bang);
		post("_setup : blocksize = %d",sys_getblksize());
		
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_dsp, gensym("dsp"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_alpha, gensym("alpha"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_reset, gensym("reset"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed, gensym("speed"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_volume, gensym("volume"), A_FLOAT, 0);

	}
	
	void mage_tilde_free( t_mage_tilde * x )
	{
		pthread_cancel(x->thread);
		pthread_join(x->thread,NULL);
		post("free mage memory");
		delete x->mage;
	}
	
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp )
	{
		dsp_add( mage_tilde_perform, 3, x, sp[0]->s_vec, sp[0]->s_n );
	}
	
	t_int *mage_tilde_perform( t_int * w )
	{
		t_mage_tilde * x = ( t_mage_tilde * )( w[1] );
		t_float * out = ( t_float * )( w[2] );
		int n = ( int )( w[3] );
		
		while( n-- )
		{
			// generate the samples from the computed parameters taking into account the user contol
			x->mage->updateSamples();		
			
			// get the generated samples
			*out++ = x->mage->popSamples();
		}
		
		return ( w+4 );
	}
	
	void * genThread(void * argv)
	{
		printf( "running genThread\n" );
		
		t_mage_tilde * x = ( t_mage_tilde * ) argv;
		
		fillLabelQueue( x );
		
		while( 1 )
		{ 
			pthread_testcancel();
			
			if( x->mage->popLabel() ) 
			{
				// prepare the model
				x->mage->prepareModel(); 
				
				// compute the corresponding durations taking into account the model 
				// and if set, the interpolation and/or duration functions set by the user
				x->mage->computeDuration(); 
				
				// compute the corresponding parameters taking into account the model 
				// and if set, the interpolation and/or duration functions set by the user
				x->mage->computeParameters ();
				
				// optimize the generated parameters 
				x->mage->optimizeParameters();
				
				usleep( 100 );
			}
			else
			{
				fillLabelQueue( x );
			}			
		}
		
		return ( NULL );
	}

	void mage_tilde_alpha( t_mage_tilde * x, t_floatarg alpha )
	{
		x->mage->setAlpha( alpha );

		return;
	}

	void mage_tilde_reset( t_mage_tilde * x )
	{
		x->mage->reset();

		return;
	}

	void mage_tilde_speed( t_mage_tilde * x, t_floatarg speed )
	{
		x->mage->setSpeed( speed, MAGE::overwrite );

		return;
	}

	void mage_tilde_volume( t_mage_tilde * x, t_floatarg volume )
	{
		x->mage->setVolume( volume );

		return;
	}

}

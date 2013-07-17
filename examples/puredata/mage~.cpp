 /* ----------------------------------------------------------------------------------------------- */
 /* 																								*/
 /* 	This file is part of MAGE / pHTS ( the performative HMM-based speech synthesis system )		*/
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
 /* 			Numediart Institute for New Media Art ( www.numediart.org )							*/
 /* 			Acapela Group ( www.acapela-group.com )												*/
 /* 																								*/
 /* 																								*/
 /* 	 Developed by :																				*/
 /* 																								*/
 /* 		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit	*/
 /* 																								*/
 /* ----------------------------------------------------------------------------------------------- */

#include "m_pd.h"
#include "m_imp.h"
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
		char labelPath[1024];
		vector < string > labels;
		int currentLabel;
		
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
	void mage_tilde_debug( t_mage_tilde * x );
	void mage_tilde_engine_add( t_mage_tilde * x, t_symbol *name, t_symbol *conf );
	void mage_tilde_engine_remove( t_mage_tilde * x, t_symbol *name );
	void mage_tilde_interpolation( t_mage_tilde * x, t_symbol *voice, t_floatarg weight );
	void mage_tilde_label( t_mage_tilde * x, t_symbol *label );
	void mage_tilde_label_clear( t_mage_tilde * x );
	void mage_tilde_label_fill( t_mage_tilde * x );
	void mage_tilde_label_next( t_mage_tilde * x );
	void mage_tilde_label_insert( t_mage_tilde * x, t_floatarg lab );
	void mage_tilde_label_replace( t_mage_tilde * x, t_floatarg lab );
	void mage_tilde_label_switch( t_mage_tilde * x, t_floatarg lab );
	void mage_tilde_pitch( t_mage_tilde * x, t_floatarg pitchvalue, t_floatarg action );
	void mage_tilde_pitch_overwrite( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_scale( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_shift( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_synth( t_mage_tilde * x );
	void mage_tilde_reset( t_mage_tilde * x );
	void mage_tilde_speed( t_mage_tilde * x, t_floatarg speed, t_floatarg action );
	void mage_tilde_speed_overwrite( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_scale( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_shift( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_synth( t_mage_tilde * x );
	void mage_tilde_volume( t_mage_tilde * x, t_floatarg volume );
	
	void fillLabels( t_mage_tilde * x )
	{
		string line;
		string filename = string(x->labelPath);
		
		ifstream myfile( filename.c_str() );
		
		x->currentLabel = -1;
		x->labels.clear();
		
		if( !myfile.is_open() )
		{
			post( "could not open file %s",filename.c_str() );
			return;
		}
		
		while( getline( myfile, line ) )
		{
			x->labels.push_back(line);
		}
		
		myfile.close();
		
		if( x->labels.size() > 0 )
			x->currentLabel = 0;
		
		return;
	}
	
	void mage_tilde_bang( t_mage_tilde * x )
	{
		post( "blocksize: %d",sys_getblksize() );
	}
	
	void * mage_tilde_new( void )
	{
		t_mage_tilde * x = ( t_mage_tilde * ) pd_new( mage_tilde_class );
		
		post( "mage~ loaded from %s",mage_tilde_class->c_externdir->s_name );
		
		strcpy( x->labelPath, mage_tilde_class->c_externdir->s_name );
		strcat( x->labelPath, "/../../data/labels/cmu-artic/alice01.lab" );
		x->mage = new Mage();
		fillLabels(x);
		
		//post("_new: loading engine");
		//x->mage->addEngine( "slt", "../../../data/configFiles/cmu-artic/slt.conf" );
		//x->mage->addEngine( "awb", "../../../data/configFiles/cmu-artic/awb.conf" );
		//x->mage->enableInterpolation(true);
		
		//post("_new: done with engine");
		
		post( "_new: starting genThread" );
		pthread_create(&(x->thread), NULL, genThread, (void *) x);
		post( "_new: done with genThread" );
		
		outlet_new(&x->x_obj, &s_signal);
		
		post( "_new: done\n" );
		
		return ( void * ) x;
	}
	
	void mage_tilde_setup( void )
	{
		mage_tilde_class = class_new(gensym("mage~"),(t_newmethod)mage_tilde_new,(t_method)mage_tilde_free,sizeof(t_mage_tilde),CLASS_DEFAULT, (t_atomtype) 0);

		class_addbang( mage_tilde_class, mage_tilde_bang );
		post( "_setup: blocksize = %d", sys_getblksize() );
		
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_dsp, gensym("dsp"), (t_atomtype) 0);
		
		// Engine
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_engine_add, gensym("engineadd"), A_SYMBOL, A_SYMBOL, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_engine_remove, gensym("engineremove"), A_SYMBOL, 0);

		// Label
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label, gensym("label"), A_SYMBOL, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_clear, gensym("labelclear"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_fill, gensym("labelfill"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_next, gensym("labelnext"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_insert, gensym("labelinsert"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_replace, gensym("labelreplace"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_switch, gensym("labelswitch"), A_FLOAT, 0);

		// Pitch
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch, gensym("pitch"), A_FLOAT, A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_overwrite, gensym("pitchoverwrite"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_scale, gensym("pitchscale"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_shift, gensym("pitchshift"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_synth, gensym("pitchsynth"), (t_atomtype) 0);
		
		// Reset
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_reset, gensym("reset"), (t_atomtype) 0);
		
		// Speed
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed, gensym("speed"), A_FLOAT, A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed_overwrite, gensym("speedoverwrite"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed_scale, gensym("speedscale"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed_shift, gensym("speedshift"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_speed_synth, gensym("speedsynth"), (t_atomtype) 0);
		
		// Volume
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_volume, gensym("volume"), A_FLOAT, 0);
		
		// Alpha
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_alpha, gensym("alpha"), A_FLOAT, 0);
		
		// Interpolate
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_interpolation, gensym("interpolate"), A_SYMBOL, A_FLOAT, 0);
		
		// Debug
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_debug, gensym("debug"), (t_atomtype) 0);

	}
	
	void mage_tilde_free( t_mage_tilde * x )
	{
		pthread_cancel(x->thread);
		printf( "stopping genThread\n" );
		pthread_join(x->thread,NULL);
		post( "free mage memory" );
		delete x->mage;
	}
	
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp )
	{
		post( "_dsp" );
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
		
		while( 1 )
		{ 
			pthread_testcancel();
			
			if( x->mage->ready() )
			{
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
			}
			else
			{
				usleep( 1000 );
			}
		}
		
		return ( NULL );
	}
	
	void mage_tilde_alpha( t_mage_tilde * x, t_floatarg alpha )
	{
		x->mage->setAlpha( alpha );
		
		return;
	}
	
	void mage_tilde_debug( t_mage_tilde * x )
	{
		x->mage->printInterpolationWeights();
		
		return;
	}
	
	void mage_tilde_engine_add( t_mage_tilde * x, t_symbol * name, t_symbol * conf )
	{
		post( "_new: loading engine %s", name->s_name );
		x->mage->addEngine( name->s_name, conf->s_name );
	}

	void mage_tilde_engine_remove( t_mage_tilde * x, t_symbol * name )
	{
		post( "_new: removing engine %s", name->s_name );
		x->mage->removeEngine( name->s_name );
	}


	void mage_tilde_interpolation( t_mage_tilde * x, t_symbol * voice, t_floatarg weight )
	{
		string s(voice->s_name);
		
		x->mage->enableInterpolation(true);
		
		double interpolationWeights[nOfStreams + 1];
		map < string, double * > interpolationFunctions;
		
		for( unsigned int i = 0; i < nOfStreams + 1; i++ ) 
		{
			interpolationWeights[i] = (double) weight;
		}
		
		interpolationFunctions[s] = interpolationWeights;
		
		x->mage->setInterpolationFunctions( interpolationFunctions );	
		
		return;
	}
	
	void mage_tilde_label( t_mage_tilde * x, t_symbol *label )
	{
		strcpy(x->labelPath, label->s_name);
		fillLabels(x);
		
		return;
	}
	
	void mage_tilde_label_clear( t_mage_tilde * x )
	{
		x->mage->clearLabels();
		
		return;
	}
	
	void mage_tilde_label_fill( t_mage_tilde * x )
	{
		Label label;
		vector < string >::const_iterator it;
		
		for( it = x->labels.begin(); it < x->labels.end(); it++ )
		{
			//post( "pushing %s",line.c_str() );
			label.setQuery( ( * it ) );
			x->mage->pushLabel( label );
		}
		
		return;
	}
	
	void mage_tilde_label_next( t_mage_tilde * x )
	{
		Label label;
		
		if( x->labels.size() > 0 )
		{
			label.setQuery( x->labels[x->currentLabel] );
			
			x->mage->pushLabel( label );
			
			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
		}
		
		return;
	}
	
	void mage_tilde_label_insert( t_mage_tilde * x, t_floatarg lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?
			
			printf("inserting label %d\n",k);
			label.setQuery( x->labels[k] );
			
			x->mage->pushLabel( label );
			
			// _next() will go to x->currentLabel;
		}
		
		return;
	}
	
	void mage_tilde_label_replace( t_mage_tilde * x, t_floatarg lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?
			
			printf("replacing label %d with %d\n",x->currentLabel,k);
			label.setQuery( x->labels[k] );
			x->mage->pushLabel( label );
			
			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size(); // _next() will go to x->currentLabel+1
		}
		
		return;
	}
	
	void mage_tilde_label_switch( t_mage_tilde * x, t_floatarg lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?
			
			printf("switching from label %d to %d\n",x->currentLabel,k);
			label.setQuery( x->labels[k] );
			x->mage->pushLabel( label );
			
			x->currentLabel = ( k + 1 ) % x->labels.size(); // _next() will go to lab+1
		}
		
		return;
	}
	
	void mage_tilde_pitch( t_mage_tilde * x, t_floatarg pitchvalue, t_floatarg action )
	{
		// controlValue = MAGE::overwrite;
		// controlValue = MAGE::shift;
		// controlValue = MAGE::scale;
		// controlValue = MAGE::synthetic;
		// controlValue = MAGE::noaction;
		
		x->mage->setPitch(pitchvalue, action);
		
		return;
	}
	
	void mage_tilde_pitch_overwrite( t_mage_tilde * x, t_floatarg pitchvalue )
	{
		x->mage->setPitch( pitchvalue, MAGE::overwrite );
		
		return;
	}
	
	void mage_tilde_pitch_scale( t_mage_tilde * x, t_floatarg pitchvalue )
	{
		x->mage->setPitch( pitchvalue, MAGE::scale );
		
		return;
	}
	
	void mage_tilde_pitch_shift( t_mage_tilde * x, t_floatarg pitchvalue )
	{
		x->mage->setPitch( pitchvalue, MAGE::shift );
		
		return;
	}
	
	void mage_tilde_pitch_synth( t_mage_tilde * x )
	{
		x->mage->setPitch( 0, MAGE::synthetic );
		
		return;
	}
	
	void mage_tilde_reset( t_mage_tilde * x )
	{
		x->mage->reset();
		
		return;
	}
	
	void mage_tilde_speed( t_mage_tilde * x, t_floatarg speed, t_floatarg action )
	{
		// controlValue = MAGE::overwrite;
		// controlValue = MAGE::shift;
		// controlValue = MAGE::scale;
		// controlValue = MAGE::synthetic;
		// controlValue = MAGE::noaction;
	
		x->mage->setSpeed( speed, action );
		
		return;
	}

	void mage_tilde_speed_overwrite( t_mage_tilde * x, t_floatarg speedvalue )
	{
		x->mage->setSpeed( speedvalue, MAGE::overwrite );
		
		return;
	}
	
	void mage_tilde_speed_scale( t_mage_tilde * x, t_floatarg speedvalue )
	{
		x->mage->setSpeed( speedvalue, MAGE::scale );
		
		return;
	}
	
	void mage_tilde_speed_shift( t_mage_tilde * x, t_floatarg speedvalue )
	{
		x->mage->setSpeed( speedvalue, MAGE::shift );
		
		return;
	}
	
	void mage_tilde_speed_synth( t_mage_tilde * x )
	{
		x->mage->setSpeed( 0, MAGE::synthetic );
		
		return;
	}
	
	void mage_tilde_volume( t_mage_tilde * x, t_floatarg volume )
	{
		x->mage->setVolume( volume );
		
		return;
	}
	
}

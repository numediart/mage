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

/** 
 * 	 @file	mage~.cpp
 * 	 @author A. Moinet, V. Huguenin
 */

// GitHub version

//PureData
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
		
		t_outlet *sig_out, *bang_out, *f_out, *f_out2; // V 
		
		Mage *mage;
	} t_mage_tilde;
	
	void mage_tilde_setup( void );
	void *mage_tilde_new( void );
	t_int *mage_tilde_perform( t_int * w );
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp );
	void mage_tilde_bang( t_mage_tilde * x);
	void mage_tilde_free( t_mage_tilde * x );
	void * genThread( void * argv );
	void fillLabels( t_mage_tilde * x );
	
	//access to MAGE controls
	void mage_tilde_reset( t_mage_tilde * x );
	void mage_tilde_debug( t_mage_tilde * x );	
	//manually add/remove engines  
	void mage_tilde_engine_add( t_mage_tilde * x, t_symbol *name, t_symbol *conf );
	void mage_tilde_engine_remove( t_mage_tilde * x, t_symbol *name );
	//interpolation between voices
	void mage_tilde_interpolation( t_mage_tilde * x, t_symbol *voice, t_floatarg weight );
	// duration of each state of a label, in frames
	void mage_tilde_duration ( t_mage_tilde * x, t_symbol *s, int ac, t_atom *argv ); // V
	//labels manipulation	
	void mage_tilde_label_clear( t_mage_tilde * x );
	void mage_tilde_label( t_mage_tilde * x, t_symbol *label );
	void mage_tilde_label_fill( t_mage_tilde * x );
	void mage_tilde_label_fill_until_end( t_mage_tilde * x ); // V	
	void mage_tilde_label_next( t_mage_tilde * x );
	void mage_tilde_label_nextvowel( t_mage_tilde * x ); // V
	void mage_tilde_label_insert( t_mage_tilde * x, t_floatarg lab );
	void mage_tilde_label_replace( t_mage_tilde * x, t_floatarg lab );
	void mage_tilde_label_switch( t_mage_tilde * x, t_floatarg lab );
	//pitch
	void mage_tilde_pitch( t_mage_tilde * x, t_floatarg pitchvalue, t_floatarg action );
//	void mage_tilde_pitch ( t_mage_tilde * x, t_symbol *s, int ac, t_atom *argv ); // V
	void mage_tilde_pitch_overwrite( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_scale( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_shift( t_mage_tilde * x, t_floatarg pitchvalue );
	void mage_tilde_pitch_synth( t_mage_tilde * x );
	//speed
	void mage_tilde_speed( t_mage_tilde * x, t_floatarg speed, t_floatarg action );
//	void mage_tilde_speed ( t_mage_tilde * x, t_symbol *s, int ac, t_atom *argv ); // V
	void mage_tilde_speed_overwrite( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_scale( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_shift( t_mage_tilde * x, t_floatarg speedvalue );
	void mage_tilde_speed_synth( t_mage_tilde * x );
	//volume, alpha, gamma
	void mage_tilde_volume( t_mage_tilde * x, t_floatarg volume );
	void mage_tilde_alpha( t_mage_tilde * x, t_floatarg alpha );
	void mage_tilde_gamma( t_mage_tilde * x, t_floatarg gamma );
	//vibrato
	void mage_tilde_vib_amp (t_mage_tilde *x, t_floatarg vibamp); // V
	void mage_tilde_vib_thresh (t_mage_tilde *x, t_floatarg vibthresh); // V
	void mage_tilde_vib_zoom (t_mage_tilde *x, t_floatarg vibzoom); // V
	void mage_tilde_vib_offset (t_mage_tilde *x, t_floatarg viboffset); // V


	void mage_tilde_setup( void )
	{
		mage_tilde_class = class_new(gensym("mage~"),(t_newmethod)mage_tilde_new,(t_method)mage_tilde_free,sizeof(t_mage_tilde),CLASS_DEFAULT, (t_atomtype) 0);
		
		class_addbang(mage_tilde_class, mage_tilde_bang);
		post("_setup : blocksize = %d",sys_getblksize());
		
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_dsp, gensym("dsp"), (t_atomtype) 0);
		
		// Reset
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_reset, gensym("reset"), (t_atomtype) 0);
		
		// Debug
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_debug, gensym("debug"), (t_atomtype) 0);
		
		// Engine
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_engine_add, gensym("engineadd"), A_SYMBOL, A_SYMBOL, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_engine_remove, gensym("engineremove"), A_SYMBOL, 0);
		
		// Interpolate
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_interpolation, gensym("interpolate"), A_SYMBOL, A_FLOAT, 0);

		// Duration
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_duration, gensym("duration"), A_GIMME, 0); // essai

		// Label
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label, gensym("label"), A_SYMBOL, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_clear, gensym("labelclear"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_fill, gensym("labelfill"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_fill_until_end, gensym("labelfilluntilend"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_next, gensym("labelnext"), (t_atomtype) 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_nextvowel, gensym("labelnextvowel"), (t_atomtype) 0);//essai		
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_insert, gensym("labelinsert"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_replace, gensym("labelreplace"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_label_switch, gensym("labelswitch"), A_FLOAT, 0);
		
		// Pitch
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch, gensym("pitch"), A_FLOAT, A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_overwrite, gensym("pitchoverwrite"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_scale, gensym("pitchscale"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_shift, gensym("pitchshift"), A_FLOAT, 0);
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_pitch_synth, gensym("pitchsynth"), (t_atomtype) 0);
		
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

		// Gamma
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_alpha, gensym("gamma"), A_FLOAT, 0);

		// Vibrato
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_vib_amp, gensym("vibratoamp"), A_FLOAT, 0);// V
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_vib_thresh, gensym("vibratothresh"), A_FLOAT, 0);// V
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_vib_zoom, gensym("vibratozoom"), A_FLOAT, 0);// V
		class_addmethod(mage_tilde_class, (t_method)mage_tilde_vib_offset, gensym("vibratooffset"), A_FLOAT, 0);// V

	}

	void * mage_tilde_new( void )
	{
		t_mage_tilde *x = (t_mage_tilde *) pd_new(mage_tilde_class);
		
		post( "mage~ loaded from %s",mage_tilde_class->c_externdir->s_name );
		
		strcpy( x->labelPath, mage_tilde_class->c_externdir->s_name );
		strcat( x->labelPath, "/../../data/labels/cmu-artic/alice01.lab" );
		x->mage = new Mage();
		fillLabels(x);
		
// Uncomment the following block and replace MageSourcePath with your path to your Mage sources;
// then recompile, if you want to avoid needing to manually add voice engines each time
// that you create a new Mage instance.		
/*		post("_new: loading engine");
		x->mage->addEngine( "slt", "/MageSourcePath/data/configFiles/cmu-artic/slt.conf" );
		x->mage->addEngine( "awb", "/MageSourcePath/data/configFiles/cmu-artic/awb.conf" );
		x->mage->addEngine( "clb", "/MageSourcePath/data/configFiles/cmu-artic/clb.conf" );
		x->mage->addEngine( "jmk", "/MageSourcePath/data/configFiles/cmu-artic/jmk.conf" );
		x->mage->addEngine( "rms", "/MageSourcePath/data/configFiles/cmu-artic/rms.conf" );
		x->mage->addEngine( "bdl", "/MageSourcePath/data/configFiles/cmu-artic/bdl.conf" );
		post("_new: done with engine"); */		
		
		x->mage->enableInterpolation(true);
				
		post("_new: starting genThread");
		pthread_create(&(x->thread), NULL, genThread, (void *) x);
		post("_new : done with genThread");
		
		x->sig_out = outlet_new(&x->x_obj, &s_signal);
		x->bang_out = outlet_new(&x->x_obj, &s_bang); // essai
		x->f_out = outlet_new(&x->x_obj, &s_float); // essai
		x->f_out2 = outlet_new(&x->x_obj, &s_float); // essai
			
		post("_new: done\n");
		
		return (void *)x;
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
	
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp )
	{
		post("_dsp");
		dsp_add( mage_tilde_perform, 3, x, sp[0]->s_vec, sp[0]->s_n );
	}
	
	void mage_tilde_bang( t_mage_tilde * x )
	{
		post( "blocksize: %d",sys_getblksize() );
	}
	
	void mage_tilde_free( t_mage_tilde * x )
	{
		pthread_cancel(x->thread);
		printf( "stopping genThread\n" );
		pthread_join(x->thread,NULL);
		post("free mage memory");
		delete x->mage;
	}
	
	void * genThread(void * argv)
	{
		printf( "running genThread\n" );
		
		t_mage_tilde * x = ( t_mage_tilde * ) argv;
		
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
				
				outlet_float(x->f_out, x->mage->getDuration() );//V				

							  // compute the corresponding parameters taking into account the model 
				// and if set, the interpolation and/or duration functions set by the user
				x->mage->computeParameters ();
				
				// optimize the generated parameters 
				x->mage->optimizeParameters();
				
				usleep( 100 );
			}
			else
			{
				usleep( 100 );
			}			
		}
		
		return ( NULL );
	}
	
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
		
        post ("labels number %d", x->labels.size());
		outlet_float(x->f_out2, x->labels.size()); // V - give size of file 		
		
		myfile.close();
		
		if( x->labels.size() > 0 )
			x->currentLabel = 0;
		
		return;
	}


	
	void mage_tilde_reset( t_mage_tilde * x )
	{
		x->mage->reset();
		
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
	
	void mage_tilde_duration ( t_mage_tilde * x, t_symbol *s, int ac, t_atom *argv )
    {
        double *updateDuration = new double [5];
        int durationMode = 0;
        
        if (ac != 6)
            post("Bad number of parameters for durationoverwrite message ! ");
        else
        {
//			post("Good number of parameters for durationoverwrite message ! ");
            for( int i = 0; i < 5; i++ )
            {
                if ((argv+i)->a_type == A_FLOAT) {
                    updateDuration[i] = atom_getint(argv+i);
//					post("value: %f ", updateDuration[i]);
                }
                else
                {
                    post ("Bad type");
                }
            }
            if ((argv+5)->a_type == A_FLOAT)
            {
                durationMode = atom_getint(argv+5);
//				post("mode value: %d ", durationMode);
            }
            else
                post ("Bad mode type");
        }
        
        x->mage->setDuration( updateDuration, durationMode );
    }  


	
	void mage_tilde_label( t_mage_tilde * x, t_symbol *label )
	{
        post("filepath %s", label->s_name);//V
		strcpy(x->labelPath, label->s_name);
		fillLabels(x);
		
		return;
	}
	
	void mage_tilde_label_clear( t_mage_tilde * x )
	{
		const char *lastlab = x->mage->clearLabels().c_str();
		
		post ("last label : %s", lastlab );
		
		return;
	}
	
	void mage_tilde_label_fill( t_mage_tilde * x )
	{
		Label label;
		vector < string >::const_iterator it;
		
		for( it = x->labels.begin(); it < x->labels.end(); it++ )
		{
			//post( "pushing %s",line.c_str() );
			outlet_bang( x->bang_out ); // V
			label.setQuery( ( * it ) );
			x->mage->pushLabel( label );
		}
		
		return;
	}

	void mage_tilde_label_fill_until_end( t_mage_tilde * x ) // V
	{
		Label label;
		int i;
		
		if( x->labels.size() > 0 )
		{
			for (i = x->currentLabel; i < x->labels.size(); i++)
			{
				outlet_bang( x->bang_out ); // V
				label.setQuery( x->labels[x->currentLabel] );
				
				x->mage->pushLabel( label );
				
				x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
//				post("onepush");
			}
		}
		
		
		return;
	}
	
	void mage_tilde_label_next( t_mage_tilde * x )
	{
		Label label;
		
		if( x->labels.size() > 0 )
		{
			outlet_bang( x->bang_out ); // V
			label.setQuery( x->labels[x->currentLabel] );
			
			x->mage->pushLabel( label );
			
			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
		}
		
		return;
	}

	void mage_tilde_label_nextvowel( t_mage_tilde * x ) // V - thanks R. Seems to behave with difficulty on Pure Data
	{
		Label label;
		const char* carac = "+"; 		
		
		if( x->labels.size() > 0 )
		{
			outlet_bang( x->bang_out ); // V
			label.setQuery( x->labels[x->currentLabel] );
			
			x->mage->pushLabel( label );
			
			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
			
			const char* vla = x->mage->getLabel().getQuery().c_str();
			//		post ("%s", vla );
			
			char index = 1 + strchr(vla, *carac) - vla;
			const char *firstelem = vla + index;
			char pau_buf[3];
			
			bool isitvowel = ((firstelem[0] == 'a')  || (firstelem[0] == 'e') || (firstelem[0] == 'i') || (firstelem[0] == 'o') || (firstelem[0] == 'u') || (firstelem[0] == 'y'));
			//		if (isitvowel==1) { post("vowel"); }
			if (isitvowel == 0) {
				if (firstelem[0]=='p') {
					strncpy(pau_buf,firstelem,3);
					if(strcmp(pau_buf,"pau")==0){
						isitvowel=1;
						//	post("pau");
					}
				}
			}
			while (isitvowel == 0) {
				usleep(100000);
				if( x->labels.size() > 0 )
				{
					label.setQuery( x->labels[x->currentLabel] );
					
					x->mage->pushLabel( label );
					
					x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
				}
				
				vla = x->mage->getLabel().getQuery().c_str();
				index = 1 + strchr(vla, *carac) - vla;
				firstelem = vla + index;
				isitvowel = ((firstelem[0] == 'a')  || (firstelem[0] == 'e') || (firstelem[0] == 'i') || (firstelem[0] == 'o') || (firstelem[0] == 'u') || (firstelem[0] == 'y'));
				//			if (isitvowel==1) { post("vowel"); }
				if (isitvowel == 0) {
					if (firstelem[0]=='p') {
						strncpy(pau_buf,firstelem,3);
						if(strcmp(pau_buf,"pau")==0){
							isitvowel=1;
							//						post("pau");
						}
					}
				}			
			}
		}
		
		return;
	}
	
	void mage_tilde_label_insert( t_mage_tilde * x, t_floatarg lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?

			post("inserting label %d\n",k);
			outlet_bang( x->bang_out ); // V
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

			post("replacing label %d with %d\n",x->currentLabel,k);
			outlet_bang( x->bang_out ); // V
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
			
			post("switching from label %d to %d\n",x->currentLabel,k);
			outlet_bang( x->bang_out ); // V
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

	void mage_tilde_alpha( t_mage_tilde * x, t_floatarg alpha )
	{
		x->mage->setAlpha( alpha );
		
		return;
	}
	
	void mage_tilde_gamma( t_mage_tilde * x, t_floatarg gamma )
	{
		x->mage->setGamma( gamma );
		
		return;
	}



	//Vibrato -V
	void mage_tilde_vib_amp (t_mage_tilde *x, t_floatarg vibamp) // V
	{
		x->mage->setvibamp( vibamp );
        
		return;
	}
	
	void mage_tilde_vib_thresh (t_mage_tilde *x, t_floatarg vibthresh) // V
	{
		x->mage->setvibthresh( vibthresh );
        
		return;
	}
	
	void mage_tilde_vib_zoom (t_mage_tilde *x, t_floatarg vibzoom) // V
	{
		x->mage->setvibzoom( vibzoom );
        
		return;
	}

	void mage_tilde_vib_offset (t_mage_tilde *x, t_floatarg viboffset) // V
	{
		x->mage->setviboffset( viboffset );
        
		return;
	}

}

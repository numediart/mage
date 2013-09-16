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

/**
 * @file mage~.cpp
 * @author Loïc Reboursière, Victor Huguenin
 */

// Github version

//MaxMSP
#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <pthread.h>
#include <mage.h>
#include <string.h>


using namespace std;
using namespace MAGE;

extern "C" 
{	
    
    void *mage_tilde_class;    
    
	typedef struct _mage_tilde
	{
		t_pxobject ob;
		pthread_t thread;
		char labelPath[1024];
		vector < string > labels;
		int currentLabel;
		Mage *mage;
		void *intout; // V
		void *intout2; // V
		void *bangout; // V
	} t_mage_tilde;

	void *mage_tilde_new( t_symbol *s, long argc, t_atom *argv );
	t_int *mage_tilde_perform( t_int * w );
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp, short *count );
	void mage_tilde_bang( t_mage_tilde * x);
	void mage_tilde_free( t_mage_tilde * x );
	void * genThread( void * argv );
    void fillLabels( t_mage_tilde * x );
	
	//access to MAGE controls
	void mage_tilde_reset( t_mage_tilde * x );
	//manually add/remove engines  
	void mage_tilde_engine_add( t_mage_tilde * x, t_symbol *name, t_symbol *conf );
	void mage_tilde_engine_remove( t_mage_tilde * x, t_symbol *name );
	//interpolation between voices - V
	void mage_tilde_interpolation( t_mage_tilde * x, t_symbol *voice,double weight );
	// duration of each state of a label, in frames
	void mage_tilde_duration( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv );		
	//labels manipulation
    void mage_tilde_label( t_mage_tilde * x, t_symbol *label );
	void mage_tilde_label_clear( t_mage_tilde * x ); //V
	void mage_tilde_label_pause( t_mage_tilde * x ); //V
	void mage_tilde_label_fill( t_mage_tilde * x );
	void mage_tilde_label_fill_until_end( t_mage_tilde * x ); // V
	void mage_tilde_label_next( t_mage_tilde * x );
	void mage_tilde_label_nextvowel( t_mage_tilde * x ); // V
	void mage_tilde_label_insert( t_mage_tilde * x, long lab );
	void mage_tilde_label_replace( t_mage_tilde * x, long lab );
	void mage_tilde_label_switch( t_mage_tilde * x, long lab );
	//pitch
	void mage_tilde_pitch( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv ); // V
    void mage_tilde_pitch_overwrite( t_mage_tilde * x, double pitch );
	void mage_tilde_pitch_scale( t_mage_tilde * x, double pitch );
	void mage_tilde_pitch_shift( t_mage_tilde * x, double pitch );
	void mage_tilde_pitch_synth( t_mage_tilde * x );
	//speed
	void mage_tilde_speed( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv );//V
	//volume, alpha, gamma
	void mage_tilde_volume( t_mage_tilde * x, double volume );
	void mage_tilde_alpha( t_mage_tilde * x, double alpha );
	void mage_tilde_gamma( t_mage_tilde * x, double gamma );// V
	//vibrato
	void mage_tilde_vib_amp (t_mage_tilde *x, double vibamp); // V
	void mage_tilde_vib_thresh (t_mage_tilde *x, double vibthresh); // V
	void mage_tilde_vib_zoom (t_mage_tilde *x, double vibzoom); // V
	void mage_tilde_vib_offset (t_mage_tilde *x, double viboffset); // V
	//inlets/outlets assistance - V
	void mage_tilde_assist (t_mage_tilde *x, void *b, long io, long index, char *s);

	    
	int main( void )
	{
        t_class *c;
		c = class_new("mage~", (method)mage_tilde_new, (method)mage_tilde_free, (long)sizeof(t_mage_tilde), 0L, A_GIMME, 0);
		
		// Core
		class_addmethod(c, (method)mage_tilde_bang, "bang", 0);
        //		post("_setup : blocksize = %d",sys_getblksize());
        class_addmethod(c, (method)mage_tilde_dsp, "dsp", A_CANT, 0);

		// Reset
        class_addmethod(c, (method)mage_tilde_reset, "reset", A_GIMME, 0);
       
		// Engine
		class_addmethod(c, (method)mage_tilde_engine_add, "engineadd", A_SYM, A_SYM, 0);
		class_addmethod(c, (method)mage_tilde_engine_remove, "engineremove", A_SYM, 0);

		// Interpolate - V
		class_addmethod(c, (method)mage_tilde_interpolation, "interpolate", A_SYM, A_FLOAT, 0);
		
		// Duration
        class_addmethod(c, (method)mage_tilde_duration, "duration", A_GIMME, 0);       

 		// Label
        class_addmethod(c, (method)mage_tilde_label, "label", A_SYM, 0);
		class_addmethod(c, (method)mage_tilde_label_clear, "labelclear",0);// V
		class_addmethod(c, (method)mage_tilde_label_pause, "labelpause",0);// V		
        class_addmethod(c, (method)mage_tilde_label_fill, "labelfill", A_GIMME, 0);
        class_addmethod(c, (method)mage_tilde_label_fill_until_end, "labelfilluntilend", A_GIMME, 0);// V
		class_addmethod(c, (method)mage_tilde_label_next, "labelnext",0);
		class_addmethod(c, (method)mage_tilde_label_nextvowel, "labelnextvowel",0);//essai		
		class_addmethod(c, (method)mage_tilde_label_insert, "labelinsert", A_LONG, 0);
		class_addmethod(c, (method)mage_tilde_label_replace, "labelreplace", A_LONG, 0);
		class_addmethod(c, (method)mage_tilde_label_switch, "labelswitch", A_LONG, 0);

		// Pitch
		class_addmethod(c, (method)mage_tilde_pitch, "pitch", A_GIMME, 0); // V 
		class_addmethod(c, (method)mage_tilde_pitch_overwrite, "pitchoverwrite", A_FLOAT, 0);
		class_addmethod(c, (method)mage_tilde_pitch_scale, "pitchscale", A_FLOAT, 0);
		class_addmethod(c, (method)mage_tilde_pitch_shift, "pitchshift", A_FLOAT, 0);
		class_addmethod(c, (method)mage_tilde_pitch_synth, "pitchsynth", A_GIMME, 0);
		
		// Speed
		class_addmethod(c, (method)mage_tilde_speed, "speed", A_GIMME, 0); //V

		// Volume
		class_addmethod(c, (method)mage_tilde_volume, "volume", A_FLOAT, 0);

		// Alpha
		class_addmethod(c, (method)mage_tilde_alpha, "alpha", A_FLOAT, 0);

		// Gamma
		class_addmethod(c, (method)mage_tilde_gamma, "gamma", A_FLOAT, 0); //V

		// Vibrato
		class_addmethod(c, (method)mage_tilde_vib_amp, "vibratoamp", A_FLOAT, 0);// V
		class_addmethod(c, (method)mage_tilde_vib_thresh, "vibratothresh", A_FLOAT, 0);// V
		class_addmethod(c, (method)mage_tilde_vib_zoom, "vibratozoom", A_FLOAT, 0);// V
		class_addmethod(c, (method)mage_tilde_vib_offset, "vibratooffset", A_FLOAT, 0);// V



		//inlets/outlets assistance - V
		class_addmethod(c, (method)mage_tilde_assist, "assist", A_CANT, 0);
        
        class_dspinit(c);
        class_register(CLASS_BOX, c);
        mage_tilde_class = c;
        
        return 0;
	}
 
    void * mage_tilde_new( t_symbol *s, long argc, t_atom *argv )
	{
//		t_mage_tilde *x = (t_mage_tilde *) newobject(mage_tilde_class);
		t_mage_tilde *x;// = NULL;	
        
        x = (t_mage_tilde *) object_alloc((t_class *)mage_tilde_class);
        //dsp_setup((t_pxobject *)x,1);
		post("_new: starting");
		
//		strcpy(x->labelPath, "/Users/MT/Downloads/numediart-MAGE-8470733/magelib-2.00/pd/pd_xcodeProject/inouts/labels/alice01.lab");
		x->mage = new Mage();
//		fillLabels(x);
		
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

		x->intout = intout((t_object *)x); // V		
		x->intout2 = intout((t_object *)x); // V
		x->bangout = bangout((t_object *)x); // V
        outlet_new(x, "signal");
		
		post("_new: done\n");
		
		return (x);
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
	
	void mage_tilde_dsp( t_mage_tilde * x, t_signal ** sp, short *count )
	{
		post("_dsp");
        post("my sample rate is: %f", sp[0]->s_sr);
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
				
				outlet_int(x->intout2, x->mage->getDuration() ); //V
				
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
//          post("line %s ", &line); 
			x->labels.push_back(line);
		}
        
//      post ("labels number %d", x->labels.size());
		outlet_int(x->intout, x->labels.size()); // V - give the size of the file
        
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
	


	// engines add/remove
	
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
	
	void mage_tilde_interpolation( t_mage_tilde * x, t_symbol *voice, double weight ) //V
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

    void mage_tilde_duration ( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv )
    {
        double *updateDuration = new double [5];
        int durationMode=0;
        
        if (ac != 6)
            post("Bad number of parameters for durationoverwrite message ! ");
        else
        {
//            post("Good number of parameters for durationoverwrite message ! ");
            for( int i = 0; i < 5; i++ )
            {
                if ((argv+i)->a_type == A_LONG) {
                    updateDuration[i] = atom_getlong(argv+i);
//                    post("value: %f ", updateDuration[i]);
                }
                else
                {
                    post ("Bad type");
                }
            }
            if ((argv+5)->a_type == A_LONG)
            {
                durationMode = atom_getlong(argv+5);
//                post("mode value: %d ", durationMode);
            }
            else
                post ("Bad mode type");
        }
        
        x->mage->setDuration( updateDuration, durationMode );
    }  
		


	void mage_tilde_label( t_mage_tilde * x, t_symbol *label )
	{
        post("filepath %s", label->s_name);
		strcpy(x->labelPath, label->s_name);
		fillLabels(x);

		return;
	}
	
	void mage_tilde_label_clear( t_mage_tilde * x ) //V
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
//			post( "pushing %s",line.c_str() );
			outlet_bang( x->bangout ); // V
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
				outlet_bang( x->bangout ); // V
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
			outlet_bang( x->bangout ); // V
			label.setQuery( x->labels[x->currentLabel] );

			x->mage->pushLabel( label );

			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size();
		}

		return;
	}
	
	void mage_tilde_label_nextvowel( t_mage_tilde * x ) // V - thanks R.
	{
		Label label;
		const char* carac = "+"; 		
		
		if( x->labels.size() > 0 )
		{
			outlet_bang( x->bangout ); // V
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
	
	void mage_tilde_label_insert( t_mage_tilde * x, long lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?

			post("inserting label %d\n",k);
			outlet_bang( x->bangout ); // V
			label.setQuery( x->labels[k] );

			x->mage->pushLabel( label );
			
			// _next() will go to x->currentLabel;
		}
		
		return;
	}
	
	void mage_tilde_label_replace( t_mage_tilde * x, long lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?

			post("replacing label %d with %d\n",x->currentLabel,k);
			outlet_bang( x->bangout ); // V
			label.setQuery( x->labels[k] );
			x->mage->pushLabel( label );
			
			x->currentLabel = ( x->currentLabel + 1 ) % x->labels.size(); // _next() will go to x->currentLabel+1
		}
		
		return;
	}
	
	void mage_tilde_label_switch( t_mage_tilde * x, long lab )
	{	
		Label label;
		
		if( x->labels.size() > 0 )
		{
//			int k = ( ( int ) lab ) % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?
			long k = lab % x->labels.size(); // always 0 <= lab < x->labels.size() ? < 0 ?
        
 			post("switching from label %d to %d\n",x->currentLabel,k);
			outlet_bang( x->bangout ); // V
			label.setQuery( x->labels[k] );
			x->mage->pushLabel( label );
			
			x->currentLabel = ( k + 1 ) % x->labels.size(); // _next() will go to lab+1
		}
		
		return;
	}

	void mage_tilde_label_pause( t_mage_tilde * x ) //V - does work on very exceptionnal circumstances
	{
		int cur;
		
		cur = x->currentLabel;
		
		x->mage->clearLabels();
		
		x->currentLabel = cur;
		
		return;
	}
	


    void mage_tilde_pitch ( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv )
	{
		// controlValue = MAGE::overwrite;
		// controlValue = MAGE::shift;
		// controlValue = MAGE::scale;
		// controlValue = MAGE::synthetic;
		// controlValue = MAGE::noaction;

		if ( ac != 2 )
		{
			if ( (ac == 1) && (argv->a_type == A_FLOAT) ) 
			{ 
				x->mage->setPitch(atom_getfloat(argv), MAGE::overwrite); 
			} 
			else if ( (ac == 1) && (argv->a_type == A_LONG ) ) 
			{ 
				x->mage->setPitch((float)atom_getlong(argv), MAGE::overwrite); 
			} 
			else
				
				post("need either one float/int (pitchoverwrite by that value) or one float/int and one int (int will precise the action)");
		}
		else
		{
			if ( (argv->a_type == A_FLOAT ) && ((argv+1)->a_type == A_LONG) ) {
				x->mage->setPitch(atom_getfloat(argv),atom_getlong(argv+1));
			}
			else if ( (argv->a_type == A_LONG ) && ((argv+1)->a_type == A_LONG) ) {
				x->mage->setPitch((float)atom_getlong(argv),atom_getlong(argv+1));
			}
		}
		
		return;
	}
    
	void mage_tilde_pitch_overwrite( t_mage_tilde * x, double pitch )
	{
		x->mage->setPitch(pitch,MAGE::overwrite);

		return;
	}

	void mage_tilde_pitch_scale( t_mage_tilde * x, double pitch )
	{
		x->mage->setPitch(pitch,MAGE::scale);

		return;
	}
	
	void mage_tilde_pitch_shift( t_mage_tilde * x, double pitch )
	{
		x->mage->setPitch(pitch,MAGE::shift);

		return;
	}
	
	void mage_tilde_pitch_synth( t_mage_tilde * x )
	{
		x->mage->setPitch(0,MAGE::synthetic);

		return;
	}

	
     void mage_tilde_speed ( t_mage_tilde * x, Symbol *s, long ac, t_atom *argv ) //V
	{
		// controlValue = MAGE::overwrite;
		// controlValue = MAGE::shift;
		// controlValue = MAGE::scale;
		// controlValue = MAGE::synthetic;
		// controlValue = MAGE::noaction;

		if ( ac != 2 )
		{
			if ( (ac == 1) && (argv->a_type == A_FLOAT) ) 
			{ 
				x->mage->setSpeed(atom_getfloat(argv), MAGE::overwrite); 
			} 
			else if ( (ac == 1) && (argv->a_type == A_LONG ) ) 
			{ 
				x->mage->setSpeed((float)atom_getlong(argv), MAGE::overwrite); 
			} 
			else
				post("need either one float/int (speedoverwrite by that value) or one float/int and one int (int will precise the action)");
		}
		else
		{
			if ( (argv->a_type == A_FLOAT) && ((argv+1)->a_type == A_LONG) ) {
				x->mage->setSpeed(atom_getfloat(argv),atom_getlong(argv+1));
			}
			else if ( (argv->a_type == A_LONG ) && ((argv+1)->a_type == A_LONG) ) {
				x->mage->setSpeed((float)atom_getlong(argv),atom_getlong(argv+1));
			}
		}
		
		return;
	}
		


	void mage_tilde_volume( t_mage_tilde * x, double volume )
	{
		x->mage->setVolume( volume );
        
		return;
	}

	void mage_tilde_alpha( t_mage_tilde * x, double alpha )
	{
		x->mage->setAlpha( alpha );
//        post("alpha : %f", alpha);
//        post("path : %s", x->labelPath);

		return;
	}
	
	void mage_tilde_gamma( t_mage_tilde * x, double gamma )// V
	{
		x->mage->setGamma( gamma );
		
		return;
	}
	
	
	
	//Vibrato -V
	void mage_tilde_vib_amp (t_mage_tilde *x, double vibamp) // V
	{
		x->mage->setvibamp( vibamp );
        
		return;
	}
	
	void mage_tilde_vib_thresh (t_mage_tilde *x, double vibthresh) // V
	{
		x->mage->setvibthresh( vibthresh );
        
		return;
	}
	
	void mage_tilde_vib_zoom (t_mage_tilde *x, double vibzoom) // V
	{
		x->mage->setvibzoom( vibzoom );
        
		return;
	}

	void mage_tilde_vib_offset (t_mage_tilde *x, double viboffset) // V
	{
		x->mage->setviboffset( viboffset );
        
		return;
	}
	
	
			
	// "The io argument will be 1 for inlets, 2 for outlets. 
	// The index argument will be 0 for the leftmost inlet or outlet."
	void mage_tilde_assist (t_mage_tilde *x, void *b, long io, long index, char *s)
	{
		switch (io)
		{
			case 1:
				switch (index)
			{
				case 0:
					sprintf(s, "all messages to mage");
					break;
			}
				break;
			case 2:
				switch (index)
			{
				case 0:
					sprintf(s, "mage audio output");
					break;
				case 1:
					sprintf(s, "bang at beginning of a label read with labelswitch method");
					break;
				case 2:
					sprintf(s, "number of frames in currently processed label");
					break;					
				case 3:
					sprintf(s, "total number of labels when a label list is read");
					break;										
			}
				break;
		}				
	}
	
}



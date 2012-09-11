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

#pragma once

#include <fstream>
#include <map>

#include "Constants.h"
#include "MathFunctions.h"

#include "Frame.h"
#include "Label.h"
#include "Vocoder.h"

#include "State.h"
#include "Model.h"
#include "Distribution.h"
#include "MSDistribution.h"

#include "MemQueue.h"
#include "LabelQueue.h"
#include "ModelQueue.h"
#include "FrameQueue.h"

namespace MAGE 
{
	class Mage 
	{
		public:
		
			// constructor
			Mage( void );
			Mage( std::string EngineName, int argc, char ** argv );
			Mage( std::string EngineName, std::string confFilename );
			
			// destructor
			~Mage( void );
		
			// getters
			inline Frame getFrame ( void ){ return( this->frame ); };
			inline Label getLabel ( void ){ return( this->label ); };
			inline Model * getModel( void ){ return( this->model ); };
		
			inline Vocoder * getVocoder( void ){ return( this->vocoder ); };

			inline LabelQueue * getLabelQueue( void ){ return( this->labelQueue ); };
			inline ModelQueue * getModelQueue( void ){ return( this->modelQueue ); };
			inline FrameQueue * getFrameQueue( void ){ return( this->frameQueue ); };

			inline int getSampleCounter( void ){ return( this->sampleCount ); };

			inline double getSpeed ( void ){ return( this->hopLen ); };
			inline double getLabelSpeed ( void ){ return( this->labelSpeed ); };
			
			inline std::string getDefaultEngine( void ){ return( this->defaultEngine ); };
		
			double getPitch ( void );
			double getAlpha ( void );
			double getGamma ( void );
			double getPOrder( void );
			double getVolume( void );
		
			double getDuration( void );

			//setters
			inline void setFrame( Frame   aframe ){ this->frame = aframe; };
			inline void setLabel( Label   alabel ){ this->label = alabel; };
			inline void setModel( Model * amodel ){ this->model = amodel; };
		
			inline void setVocoder( Vocoder * avocoder ){ this->vocoder = avocoder; };
		
			inline void setLabelSpeed( double aLabelSpeed ){ this->labelSpeed = aLabelSpeed; }; // less reactive
			inline void setLabelQueue( LabelQueue * alabelQueue ){ this->labelQueue = alabelQueue; };
			inline void setModelQueue( ModelQueue * amodelQueue ){ this->modelQueue = amodelQueue; };
			inline void setFrameQueue( FrameQueue * aframeQueue ){ this->frameQueue = aframeQueue; };
		
			void setAlpha ( double alpha  );
			void setGamma ( double gamma  );
			void setPOrder( double glitch );
			void setVolume( double volume );
			void setPitch ( double pitch,  int action );
			void setSpeed ( double aspeed, int action );

			void setDuration( int * updateFunction, int action );
			void setDefaultEngine( std::string adefaultEngine );

			// methods
			double popSamples( void );

			bool popLabel ( void );

			void run  ( void );	
			void reset( void );
			void resetVocoder ( void );
			void prepareModel ( void );
			void updateSamples( void );	
			void computeDuration( void );
			void computeParameters ( void );
			void optimizeParameters( void );
			void checkInterpolationWeights( bool forced=false );
		
			void pushLabel( Label label );
			void addEngine( std::string name, int argc, char ** argv );
			void addEngine( std::string name, std::string confFilename );

			void removeEngine( std::string EngineName );
		
			void enableInterpolation( bool aenableInterpolation ); // interpolate duration & parameters
			
			// interpolate duration
			inline void enableDurationInterpolation( bool ainterpolateDuration ){ this->interpolateDuration = ainterpolateDuration; };

			// interpolate parameters
			inline void enableParameterInterpolation( bool ainterpolateParameters ){ this->interpolateParameters = ainterpolateParameters; };

		
		protected:		
			// --- Queues ---	
			LabelQueue * labelQueue;
			ModelQueue * modelQueue;
			FrameQueue * frameQueue;
		
			// --- HTS Engine ---
			std::map < std::string, Engine * > engine;
		
			// --- Model ---
			Model * model;
		
			// --- SPTK vocoder ---
			Vocoder * vocoder;
		
			// --- Frame ---
			Frame frame;
		
			// --- Label ---
			Label label;
		
			// HTS_Engine & Voices (Engine)
			string defaultEngine;
		
			int hopLen;
			int sampleCount;
			double labelSpeed;	// we need this because the speed changes on the lable 
								// level and we need to have memory of this
			bool interpolateDuration;
			bool interpolateParameters;

		private:
		
			int * updateFunction; // replace with void * function
			
			bool flag;
			int action;
		
			// HTS_Engine & Voices (Engine)
			int argc;
			char ** argv;
		
			// methods
			void init( void );
			void parseConfigFile( std::string filename );
			void addEngine( std::string name );//called by addEngine( string, ...)
	};
} // namespace

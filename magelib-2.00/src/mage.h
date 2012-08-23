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

#pragma once

#include <fstream>

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
			Mage( std::string confFilename );
			Mage( int argc, char **argv );
		
			// getters
			LabelQueue *getLabelQueue( void );
			ModelQueue *getModelQueue( void );
			FrameQueue *getFrameQueue( void );
			ModelMemory *getMemory( void );
			Engine *getEngine( void );		
			Model *getModel( void );
			Vocoder	*getVocoder( void );
			//Frame getFrame( void );

			double getSpeed ( void );
			double getPitch ( void );
			double getAlpha ( void );
			double getGamma ( void );
			double getVolume( void );
			double getDuration( void );

			//setters
			inline void setLabelQueue( LabelQueue *alabelQueue ){ this->labelQueue = alabelQueue; };
			inline void setModelQueue( ModelQueue *amodelQueue ){ this->modelQueue = amodelQueue; };
			inline void setFrameQueue( FrameQueue *aframeQueue ){ this->frameQueue = aframeQueue; };
			inline void setMemory( ModelMemory *ammemory ){ this->memory = ammemory; };
			inline void setEngine( Engine *aengine ){ this->engine = aengine; };		
			inline void setModel( Model *amodel ){ this->model = amodel; };
			inline void setVocoder( Vocoder *avocoder ){ this->vocoder = avocoder; };
			//void getFrame( Frame frame );
	
			void setSpeed ( double speechSpeed );
			void setPitch ( double pitch, int action );
			void setAlpha ( double alpha );
			void setGamma ( double gamma );
			void setVolume( double volume );
			void setDuration( int *updateFunction, int action);
		
			// methods
			void run( void );
			void resetVocoder( void );
		
		/* --------------------------- Input interface to the engine : phonetics -------------------------- */
		//void MAGE_pushLabel(MAGE_Environment *environment, char *labelAsStr);
		//int MAGE_parseLabel(MAGE_Environment *environment);		
		
		/* ---------------------------- Updating internal state of the engine ----------------------------- */
	
		/* MAGE_updatePDFs: generate PDFs */   
		//void MAGE_updatePDFs(MAGE_Environment *environment);  
	
		/* MAGE_updateFilter: generate the speech parameters */ 
		//void MAGE_updateFilter(MAGE_Environment *environment);   
	
		/* MAGE_updateSamples: generate speech samples from the speech parameters */ 
		//void MAGE_updateSamples(MAGE_Environment *environment);
		
		/* ----------------------------- Accessing engine internal data types ----------------------------- */

		/* MAGE_getNumberOfLabels: get the # of labels queued in the engine of the MAGE_Environment */ 
		//int MAGE_getNumberOfLabels(MAGE_Environment *environment);

		/* MAGE_getLabel: get the current label processed by the engine of the MAGE_Environment */                              
		//MAGE_Label * MAGE_getLabel(MAGE_Environment *environment);

		/* MAGE_getPDFs: get the current PDFs stream processed by the engine of the MAGE_Environment */                              
		//MAGE_PDFs * MAGE_getPDFs(MAGE_Environment *environment); 
	
		/* MAGE_setPDFs: set a different PDFs stream in the engine of the MAGE_Environment */                              
		//void MAGE_setPDFs( MAGE_Environment *environment, MAGE_PDFs *pdfs );
	
		/* MAGE_getFilter: get the current stream with the generated speech parameter processed by the engine of the MAGE_Environment */                              
		//MAGE_Filter *MAGE_getFilter( MAGE_Environment *environment );

		/* MAGE_setFilter: set a different stream with the generated speech parameters in the engine of the MAGE environment */  
		//void MAGE_setFilter( MAGE_Environment *environment, MAGE_Filter *filter );
		
		/* ---------------------------------------- Audio routine ----------------------------------------- */

		/* MAGE_popSamples : access and pop speech samples from ring buffer ~ to be called from audio callback */
		//void MAGE_popSamples(MAGE_Environment *environment, float *buffer, int nOfSamples);	
		
		
		/* ---------------------------------------- specific usage ---------------------------------------- */

		/* MAGE_getLabelFromFile: get one label string from a label file */
		//void * MAGE_getLabelFromFile(MAGE_Environment *environment);

		protected:
		
			// --- Memory ---
			ModelMemory *memory;
		
			// --- Queues ---	
			LabelQueue *labelQueue;
			ModelQueue *modelQueue;
			FrameQueue *frameQueue;
		
			// --- HTS Engine ---
			Engine *engine;
		
			// --- Model ---
			Model *model;
		
			// --- SPTK vocoder ---
			Vocoder *vocoder;
		
			// --- Frame ---
			//Frame frame;
		
			// --- Label ---
			Label label;
		
		private:
		
			bool flag;
			int argc;
			char **argv;
			
			// methods
			void init( int argc, char **argv );
			void parseConfigFile( std::string filename );
	};
} // namespace

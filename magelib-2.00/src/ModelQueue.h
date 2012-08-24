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

/**
 *	 @file	ModelQueue.h
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Model ringbuffer: used to store statistical
 *			models + special generate()function that takes
 *			a lookup window and generates oldest-label frames
 */

#pragma once

#include "MemQueue.h"
#include "Model.h"

#include "FrameQueue.h"
#include "Frame.h"

#include "MathFunctions.h"

namespace MAGE 
{	
	class ModelQueueMemory 
	{
		public :
		
			ModelQueueMemory();
			~ModelQueueMemory();
		
			// for every stream, for every frame, every mean
			double ***mean;			// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, for every frame, every ivar
			double ***ivar;			// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_mean
			double ** gv_mean;		// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_var
			double ** gv_vari;		// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
			// for every stream, every gv_switch
			int ** gv_switch;		// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
		
			// for every stream
			double **g;		// [nOfStreams][maxNumOfFrames];
			double ***wuw;	// [nOfStreams][maxNumOfFrames][maxWindowWidth]
			double **wum;	// [nOfStreams][maxNumOfFrames];
			
			// output parameter vector for otimized mgc, lf0 and lpf for every stream, for every frame
			double ***par;	// [nOfStreams][maxNumOfFrames][nOfDers*nOfMGCs] 
		
			int *voiced_unvoiced; // [maxNumOfFrames]
		
			char **argv;	// configuration arguments 
	};
	
	class ModelQueue : public MemQueue<Model> 
	{
		public:
		
			// constructor
			ModelQueue( unsigned int queueLen );
			
			// getters 
			inline ModelQueueMemory *getModelQueueMemory( void ){ return( this->modelQueueMemory ); };

			// methods
			void generate( FrameQueue *frameQueue, unsigned int backup=nOfBackup );
			void optimizeParameters( MAGE::Engine *engine, unsigned int backup=nOfBackup, unsigned int lookup=nOfLookup );
			void printQueue( void );

		protected:
		
			Frame frame;
			unsigned int head;
			ModelQueueMemory *modelQueueMemory;
	};	
} // namespace

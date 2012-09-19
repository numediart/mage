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

#pragma once

#include "MemQueue.h"
#include "Model.h"

#include "FrameQueue.h"
#include "Frame.h"

#include "MathFunctions.h"

namespace MAGE 
{	
	/** 
	 *  \brief		The memory used of a model queue used in Mage.
	 *  \details	This class is used to define the memory structures that are needed for a ModelQueue.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version	2.00 beta
	 *  \date		2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	class ModelQueueMemory 
	{
		public :
		
			// destructor
			ModelQueueMemory();
			
			// destructor
			~ModelQueueMemory();
		
			// for every stream, for every frame, every mean
			double *** mean;		// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
			// for every stream, for every frame, every ivar
			double *** ivar;		// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
			// for every stream, every gv_mean
			double ** gv_mean;		// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
			// for every stream, every gv_var
			double ** gv_vari;		// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
			// for every stream, every gv_switch
			int ** gv_switch;		// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
		
			// for every stream
			double **  g;	// [nOfStreams][maxNumOfFrames];
			double **  wum;	// [nOfStreams][maxNumOfFrames];
			double *** wuw;	// [nOfStreams][maxNumOfFrames][maxWindowWidth]

			// output parameter vector for otimized mgc, lf0 and lpf for every stream, for every frame
			double *** par;	// [nOfStreams][maxNumOfFrames][nOfDers * nOfMGCs] 
		
			int * voiced_unvoiced; // [maxNumOfFrames]
	};
	
	/** 
	 *  \brief		The memory queues of Model instances used in Mage.
	 *  \details	This class is used to exchange the Model instances between the different threads; 
	 *				it stores statistical models and the special generate() function takes a short
	 *				lookup window and generates oldest-label frames.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version	2.00 beta
	 *  \date		2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	class ModelQueue : public MemQueue<Model> 
	{
		public:
		
			// constructor
			ModelQueue( unsigned int queueLen );
		
			// destructor
			~ModelQueue();
			
			// getters 
			inline ModelQueueMemory *getModelQueueMemory( void ){ return( &this->modelQueueMemory ); };

			// methods
			void printQueue( void );
			void generate   ( FrameQueue * frameQueue, unsigned int backup = nOfBackup );
			void optimizeParameters( MAGE::Engine * engine, unsigned int backup = nOfBackup, unsigned int lookup = nOfLookup );

		protected:
		
			Frame * frame;

			unsigned int head;
			ModelQueueMemory modelQueueMemory;
	};	
} // namespace

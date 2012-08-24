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
	class ModelQueue : public MemQueue<Model> 
	{
		public:
		
			// constructor
			ModelQueue( unsigned int queueLen, MAGE::ModelMemory *memory );
			
			// getters 
			inline ModelMemory *getMem( void ){ return( this->mem ); };

			// methods
			void generate( FrameQueue *frameQueue, unsigned int backup=nOfBackup );
			void optimizeParameters( MAGE::Engine *engine, unsigned int backup=nOfBackup, unsigned int lookup=nOfLookup );
			void printQueue( void );

		protected:
		
			unsigned int head;
			Frame *frame;
		
			ModelMemory *mem;
	};	
} // namespace

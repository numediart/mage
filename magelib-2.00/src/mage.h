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

#include "Constants.h"
#include "MathFunctions.h"

#include "Frame.h"
#include "Label.h"
#include "Engine.h"
#include "Vocoder.h"

#include "Distribution.h"
#include "MSDistribution.h"
#include "State.h"
#include "Model.h"

#include "MemQueue.h"
#include "LabelQueue.h"
#include "ModelQueue.h"
#include "FrameQueue.h"

namespace MAGE 
{
	class Mage 
	{
		public:
		
			//default constructor
			Mage( void );
			Mage( int Argc, char **Argv );
		
			// getters
			LabelQueue *getLabelQueue( void );
			ModelQueue *getModelQueue( void );
			FrameQueue *getFrameQueue( void );
			ModelMemory *getMemory( void );
			Engine *getEngine( void );		
			Model *getModel( void );
			Vocoder	*getVocoder( void );
			//Frame getFrame( void );
		
			//setters
				
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
	};
} // namespace

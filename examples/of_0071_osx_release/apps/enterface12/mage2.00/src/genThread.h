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

#include "ofMain.h"

#include "LabelQueue.h"
#include "ModelQueue.h"
#include "FrameQueue.h"

#include "Label.h"
#include "Model.h"
#include "Engine.h"

using namespace MAGE;

class genThread : public ofThread 
{
	
	public:
	
		genThread( LabelQueue *lab, ModelQueue *mq, FrameQueue *frm, Engine *eng, Model *mod );
		void threadedFunction( void );
	
	protected:
	
		LabelQueue *labelQueue;
		ModelQueue *modelQueue;
		FrameQueue *frameQueue;
		
		Engine *engine;
		Model  *model;
	
		Label label;
};

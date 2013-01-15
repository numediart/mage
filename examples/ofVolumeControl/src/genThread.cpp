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
 *	@file		genThread.cpp
 *
 *	@author		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
 * 			
 */

#include "genThread.h"

// constructor
genThread::genThread( Mage * mage )
{
	this->mage = mage;
}

// methods
void genThread::threadedFunction( void )
{		
	while( isThreadRunning() )
	{
		if( this->mage->ready() )
		{
			// --- Run mage ---
			//this->mage->run( ); 
			
			// OR 
			
			// --- Run mage step-by-step ---
			// get the label to be parced
			if( this->mage->popLabel() ) 
			{
				// prepare the model
				this->mage->prepareModel(); 
				
				// compute the corresponding durations taking into account the model 
				// and if set, the interpolation and/or duration functions set by the user
				this->mage->computeDuration(); 
				
				// compute the corresponding parameters taking into account the model 
				// and if set, the interpolation and/or duration functions set by the user
				this->mage->computeParameters ();
				
				// optimize the generated parameters 
				this->mage->optimizeParameters();
			}
		}
		else 
			usleep(100000);
	}
	return;
}

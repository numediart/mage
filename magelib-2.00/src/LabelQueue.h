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
 *	 @file	LabelQueue.h
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Label queue class: used to exchange the
 *			labels between the different threads; we
 *			could not inherint from MemQueue because
 *			Label is not a POD type -> memory issues
 */

#pragma once

#include <vector>
#include "Label.h"
#include "pa_memorybarrier.h"

using namespace std;

namespace MAGE 
{
	class LabelQueue 
	{
		public:
	
			// constructor
			LabelQueue( unsigned int size );
	
			// methods
			void push( Label &label );
			void push( void );
			void pop ( Label &label );
			void pop( void );
			void get ( Label &label );
			Label* get( void );
			Label* next( void );

			void print( void );

			// accessors 
			bool isEmpty( void );
			bool isFull ( void );
	
	
		protected:
	
			vector<Label> queue;
			unsigned int read, write;
			unsigned int nOfLabels;
	};
} // namespace

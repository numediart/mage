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
 *	 @file	Label.h
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Label class: store the label string +
 *			time tags and either duration is forced
 */

#pragma once

#include <string>
#include <cstring>
#include <sstream>

#include "hts.h"
#include "Constants.h"

using namespace std;

namespace MAGE 
{
	class LabelMemory 
	{
		public :
		
			LabelMemory();
			~LabelMemory();
		
			char strQuery[maxStrLen];
			char strBegin[maxStrLen];
			char strEnd  [maxStrLen];
	};
	
	class Label 
	{
		public:
	
			// constructor
			Label( void );
			Label( string q );
			~Label( void );

			void printQuery( void );
			void parseQuery( string q );
	
			// getters
			string getQuery( void );
			int getBegin( void );
			int getEnd( void );
			double getSpeed( void );
			bool getIsForced( void );
	
			//setters
			void setQuery( string query );
			void setBegin( int begin );
			void setEnd( int end );
			void setSpeed( double speed );
			void setIsForced( bool isDurationForced );

		protected:
	
			LabelMemory labelMemory;

			string query;
			bool isForced;
			double speed;
			int begin;
			int end;
	};
} // namespace

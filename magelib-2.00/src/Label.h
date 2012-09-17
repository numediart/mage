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

/** 
 *	@file		Label.h
 *
 *	@author		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
 *
 *	@brief		Label class: store the label string + time tags and either duration is forced
 * 			
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
		
			// constructor 
			LabelMemory();
		
			// destructor
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
		
			// destructor
			~Label( void );
	
			// getters
			inline string getQuery( void ){ return( this->query ); };
			inline double getSpeed( void ){ return( this->speed ); };

			inline int getBegin( void ){ return( this->begin ); };
			inline int getEnd  ( void ){ return( this->end   ); };
		
			inline bool getIsForced( void ){ return( this->isForced ); };


			//setters
			void setQuery( string aquery );
		
			inline void setBegin( int abegin ){ this->begin = abegin; };
			inline void setEnd  ( int aend   ){ this->end = aend; };
		
			inline void setSpeed( double aspeed ){ this->speed = aspeed; };
			inline void setIsForced( bool isDurationForced ){ this->isForced = isDurationForced; };
		
			// methods
			void printQuery( void );
			void parseQuery( string q );


		protected:
	
			LabelMemory labelMemory;

			string query;
			bool isForced;
			double speed;
			int begin;
			int end;
	};
} // namespace

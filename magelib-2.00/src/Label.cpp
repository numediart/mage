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
 /* 		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
 /* 																								*/
 /* ----------------------------------------------------------------------------------------------- */

/** 
 * 	 @file	Label.cpp
 * 	 @author	N. d'Alessandro, M. Astrinaki
 * 	 @brief	 Label class: store the label string +
 * 			time tags and either duration is forced
 */

#include "Label.h"

// constructor
MAGE::LabelMemory::LabelMemory()
{
}

// destructor
MAGE::LabelMemory::~LabelMemory( void )
{
}

// constructor
MAGE::Label::Label( void )
{
	this->query = "";
	this->isForced = false;
	this->begin = this->end = -1;
	this->speed = 1.0;
}

MAGE::Label::Label( string q )
{
	this->parseQuery( q );
	this->speed = 1.0;
}

// destructor
MAGE::Label::~Label( void )
{
}

// getters


//setters
void MAGE::Label::setQuery( string q )
{
	this->parseQuery( q );
	return;
}

// methods 
void MAGE::Label::parseQuery( string q )
{
	static string first, middle, last;
	istringstream liness( q );
	
	// parse input label string to get strings : start - end - query
	getline( liness, first,	 ' ' );
	getline( liness, middle, ' ' );
	getline( liness, last,	 ' ' );
	
	// parse splitted strings to get char * : start - end - query
	strcpy( this->labelMemory.strBegin, first.c_str()  );
	strcpy( this->labelMemory.strEnd,	middle.c_str() );
	strcpy( this->labelMemory.strQuery, last.c_str()   );
	
	if( isdigit_string( this->labelMemory.strBegin ) && isdigit_string( this->labelMemory.strEnd ) ) // has correct frame information
	{ 
		this->begin = atof( this->labelMemory.strBegin );
		this->end	= atof( this->labelMemory.strEnd   );
		this->query.assign( this->labelMemory.strQuery );
		this->isForced = true;
	} 
	else 
	{
		this->begin = -1.0;
		this->end	= -1.0;
		this->query.assign( this->labelMemory.strBegin );
		this->isForced = false;
	}
	
	this->speed = 1.0;
	
	return;
}

void MAGE::Label::printQuery( void )
{	
	printf( "label: %s\n", this->query.c_str() );
	return;
}

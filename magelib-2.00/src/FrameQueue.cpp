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
 *	 @file	FrameQueue.cpp
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Frame ringbuffer: used to exchange speech
 *			parameters with the synthesis thread
 */

#include "FrameQueue.h"

// constructor
MAGE::FrameQueue::FrameQueue( unsigned int queueLen ):
MAGE::MemQueue<Frame>( queueLen )
{	
}

// methods
void MAGE::FrameQueue::printQueue( void )
{
	int head;
	printf( "frame: " );
	
	for( int k = 0; k < nOfItems; k++ )
	{
		head = ( read + k ) % length;
		printf( "( %i: %f )", head, rawData[head].f0 );
	}
	
	printf( "\n" );
	return;
}

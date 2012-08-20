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
 *	 @file	LabelQueue.cpp
 *	 @author	N. d'Alessandro, M. Astrinaki
 *	 @brief	 Label queue class: used to exchange the
 *			labels between the different threads; we
 *			could not inherint from MemQueue because
 *			Label is not a POD type -> memory issues
 */

#include "LabelQueue.h"

MAGE::LabelQueue::LabelQueue( unsigned int size )
{
	queue.resize( size );
	read = write = 0;
	nOfLabels = 0;
}

void MAGE::LabelQueue::push( Label &label )
{
	queue[write] = label;
	
	write = ( write + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels++;
	return;
}

void MAGE::LabelQueue::pop( Label &label )
{
	label = queue[read];
	
	read = ( read + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels--;
	return;
}

/* like pop but does not advance in the queue */
void MAGE::LabelQueue::get( Label &label )
{
	label = queue[read];
	return;
}

bool MAGE::LabelQueue::isEmpty( void )
{
	PaUtil_ReadMemoryBarrier();
	
	if( nOfLabels <= 0 )
		return true;
	else 
		return false;
}

bool MAGE::LabelQueue::isFull( void )
{
	PaUtil_ReadMemoryBarrier();
	
	if( nOfLabels >= queue.size() )
		return true;
	else 
		return false;
}

void MAGE::LabelQueue::print( void )
{
	return;
	//	 for( int k=0; k<nOfLabels; k++ ){
	
	//		 printf( "%i: %s\n",( int )read+k, queue[read+k].query.c_str() );
	//	 }
}

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
 * 	 @file	MemQueue.h
 * 	 @author	N. d'Alessandro, M. Astrinaki
 * 	 @brief	 Memory-efficient lock-free ringbuffer:
 * 			push and template POD data with memcpy()
 * 			and inform on the state of the buffer
 */

// [TODO] maybe build that class around pa_ringbuffer instead

#pragma once

#include "pa_memorybarrier.h"
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <unistd.h>

namespace MAGE 
{

	template <class Item>
	class MemQueue 
	{
		public:
	
			// constructor 
			MemQueue( unsigned int queueLen );
			~MemQueue( void );
	
			// getters
			unsigned int getNumOfItems( void );

			// methods
			void push( Item * item, unsigned int nOfItems=1 );
			void push( unsigned int nOfItems=1 );
			void pop( Item * item, unsigned int nOfItems=1 );
			void pop( unsigned int nOfItems=1 );
			void get( Item * item, unsigned int nOfItems=1 );
			Item * get( void );
			Item * next( void );
	
			// accessors
			bool isEmpty( void );
			bool isFull( void );
	
		protected:
	
			int nOfItems;
			unsigned int length, remain;
			unsigned int read, write;
			Item * rawData;
	};
} // namespace

template <class Item>
unsigned int MAGE::MemQueue<Item>::getNumOfItems( void )
{
	return( unsigned int )( nOfItems > 0 ) ? nOfItems : 0;
}

template <class Item>
MAGE::MemQueue<Item>::MemQueue( unsigned int queueLen )
{
	length = queueLen;
	rawData = new Item[length];
	
	read = write = 0;
	nOfItems = 0;
}

template <class Item>
MAGE::MemQueue<Item>::~MemQueue( void )
{
	delete[] rawData;
}

template <class Item>
void MAGE::MemQueue<Item>::push( Item * item, unsigned int nItem )
{
	// TODO fix case when 'write' pointer loops and passes 'read'( read should be advanced to write )
	// this bug shouldn't be triggered as long as we check isfull()before any push()in calling functions
	
	PaUtil_ReadMemoryBarrier();
	
	if( write+nItem <= length )
	{
		//TODO either change this for a copy constructor or check that no Item( Model, Label, ... )has dynamically allocated memory
		memcpy( &rawData[write], item, nItem * sizeof( Item ) );
	} 
	else
	{
		//TODO either change this or check that no Item( Model, Label, ... )has dynamically allocated memory
		remain = length - write;
		memcpy( &rawData[write], item, remain * sizeof( Item ) );
		memcpy( rawData, &item[remain],( nItem-remain ) * sizeof( Item ) );
	}
	
	// TODO what if write + nItem > 2 * length ?
	PaUtil_WriteMemoryBarrier();
	write = ( write + nItem ) % length;
	nOfItems += nItem;
	return;
}

 /* advance in queue (to be used in case we use the get() to directly access Item from the queue ) 
 * (as opposed to pushing Item instantiated outside)
*/
template <class Item>
void MAGE::MemQueue<Item>::push( unsigned int nItem )
{
	// TODO fix case when 'write' pointer loops and passes 'read'( read should be advanced to write )
	// this bug shouldn't be triggered as long as we check isfull()before any push()in calling functions
	// TODO what if write + nItem > 2 * length ?
	
	PaUtil_WriteMemoryBarrier();
	write = ( write + nItem ) % length;
	nOfItems += nItem;
	return;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( Item * item, unsigned int nItem )
{
	// TODO fix case when 'write' pointer loops and passes 'read'( read should be advanced to write )
	// this bug shouldn't be triggered as long as we check isfull()before any push()in calling functions
	// TODO an isempty()check * is * needed
	// TODO check for nItem == 0( shouldn't happen except if isempty() )

	// don't pop()further than available ...
	if( nItem > this->getNumOfItems() )
		nItem = this->getNumOfItems();
	
	PaUtil_ReadMemoryBarrier();
	if( read + nItem <= length )
	{
		memcpy( item, &rawData[read], nItem * sizeof( Item ) );
	} 
	else 
	{
		remain = length - read;
		memcpy( item, &rawData[read], remain * sizeof( Item ) );
		memcpy( &item[remain], rawData,( nItem - remain ) * sizeof( Item ) );
	}
	
	PaUtil_WriteMemoryBarrier();
	read = ( read+nItem ) % length;
	nOfItems -= nItem;
	return;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( unsigned int nItem )
{
	if( nItem > this->getNumOfItems() )
		nItem = this->getNumOfItems();
	
	PaUtil_WriteMemoryBarrier();
	read = ( read + nItem ) % length;
	nOfItems -= nItem;
	return;
}

 /* like pop but does not advance in the queue*/
template <class Item>
void MAGE::MemQueue<Item>::get( Item * item, unsigned int nItem )
{
	// TODO fix case when 'write' pointer loops and passes 'read'( read should be advanced to write )
	// this bug shouldn't be triggered as long as we check isfull()before any push()in calling functions
	// TODO an isempty()check * is * needed
	// TODO check for nItem == 0( shouldn't happen except if isempty() )

	//don't pop()further than available ...
	if( nItem > this->getNumOfItems() )
		nItem = this->getNumOfItems();
	
	PaUtil_ReadMemoryBarrier();
	if( read + nItem <= length )
	{
		memcpy( item, &rawData[read], nItem * sizeof( Item ) );
	} 
	else
	{
		remain = length - read;
		memcpy( item, &rawData[read], remain * sizeof( Item ) );
		memcpy( &item[remain], rawData,( nItem - remain ) * sizeof( Item ) );
	}
	return;
}

 /* get current item, the one that pop() would remove. get() does not advance in the queue*/
template <class Item>
Item * MAGE::MemQueue<Item>::get( void )
{
	return &rawData[read];
}

 /* get next item, the one that push() would write to. next() does not advance in the queue*/
template <class Item>
Item * MAGE::MemQueue<Item>::next( void )
{
	return &rawData[write];
}

template <class Item>
bool MAGE::MemQueue<Item>::isEmpty( void )
{
	PaUtil_ReadMemoryBarrier();
	return( nOfItems <= 0 ) ? true : false;
}

template <class Item>
bool MAGE::MemQueue<Item>::isFull( void )
{
	PaUtil_ReadMemoryBarrier();
	return( this->getNumOfItems() >= length ) ? true : false;
}

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
 * 	 @file	LabelQueue.cpp
 * 	 @author	N. d'Alessandro, M. Astrinaki
 * 	 @brief	 Label queue class: used to exchange the
 * 			labels between the different threads; we
 * 			could not inherint from MemQueue because
 * 			Label is not a POD type -> memory issues
 */

#include "LabelQueue.h"

// constructor 
/**
 * 
 * @param size max size of the LabelQueue. i.e. how many Label the buffer ring 
 * can contain before it's full.
 */
MAGE::LabelQueue::LabelQueue( unsigned int size )
{
	queue.resize( size );
	read = write = 0;
	nOfLabels = 0;
}

// methods
/**
 * push a new MAGE::Label into the FIFO queue by copying it.
 * 
 * @param label an instance of MAGE::Label that will be copied into the youngest
 * item of the memory queue
 */
void MAGE::LabelQueue::push( Label &label )
{
	queue[write] = label;
	
	write = ( write + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels++;
	return;
}

/**
 * push a new MAGE::Label into the FIFO queue. In this case, there is no copy of
 * a label, instead the next slot of the memory pool is added to the queue. It is
 * supposed that said slot has been accessed with next() and modified beforehand.
 * Usage is in 3 steps which could be summarized into "access, write, save":
 * 
 * Label *label = labelQueue->next();//access next memory slot
 * label->setQuery("ae^l-ax+s=w@...");//modify it
 * labelQueue->push();//save it into the queue (advance 'write' pointer)
 * 
 */
void MAGE::LabelQueue::push( void )
{
	write = ( write + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels++;
	return;
}

/**
 * remove the oldest item in the queue
 * 
 * @param label an instance of MAGE::Label into which the pop()'d label will be 
 * copied before being removed from the queue
 */
void MAGE::LabelQueue::pop( Label &label )
{
	label = queue[read];
	
	read = ( read + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels--;
	return;
}

/**
 * remove the oldest item in the queue. In this case, there is no copy of
 * a label, instead the 'read' pointer that points to the oldest item in the queue
 * is incremented to the next item of the queue and the item previously pointed
 * to is returned into the memory pool.
 * Usage is in 3 steps which could be summarized into "access, read, delete":
 * 
 * Label *label = labelQueue->get();//access oldest item in the queue
 * string s = label->getQuery();//read it, use it, ...
 * labelQueue->pop();//remove it from the queue (advance 'read' pointer)
 * //never do this after a pop() :
 * string s2 = label->getQuery();//don't do this
 * 
 * Note that once pop() has been called, the item can be overwritten at any time
 * by a subsequent next()/push(). Therefore if the Label has to be used but without
 * blocking/clogging up the queue, it is better to make a copy-pop() with pop(Label&)
 * 
 * Label *label = labelQueue->get();//access oldest item in the queue
 * labelQueue->pop();//remove it from the queue (advance 'read' pointer)
 * //never do this after a pop() :
 * string s = label->getQuery();//don't do this
 * 
 * //do this instead
 * Label label;
 * labelQueue->pop(label);//remove it from the queue (advance 'read' pointer)
 * string s = label.getQuery();//label is a local copy of the label that has been pop()'d
 * 
 */
void MAGE::LabelQueue::pop( void )
{	
	read = ( read + 1 ) % queue.size();
	PaUtil_WriteMemoryBarrier();
	nOfLabels--;
	return;
}

/**
 * like pop(Label&) but does not advance in the queue
 */
void MAGE::LabelQueue::get( Label &label )
{
	label = queue[read];
	return;
}

/**
 * Access the oldest item of the FIFO queue. This is meant to be used with pop(void).
 * See pop(void) doc for more complete explanation
 * 
 * @return a pointer to the item of the queue that pop() would remove. i.e. the
 * oldest slot in the FIFO
 */
MAGE::Label * MAGE::LabelQueue::get( void )
{
		return &queue[read];
}
/**
 * Access next available slot of the memory pool. This is meant to be used with
 * push(void). see push(void) doc for more complete explanations.
 * 
 * @return a pointer to the item of the queue that push() would write to. i.e. 
 * the next available slot in memory that has not yet been pushed into the FIFO
 */
MAGE::Label * MAGE::LabelQueue::next( void )
{
		return &queue[write];
}

void MAGE::LabelQueue::print( void )
{
	//return;
	//	 for( int k=0; k<nOfLabels; k++ ){
	
	//		 printf( "%i: %s\n",( int )read+k, queue[read+k].query.c_str() );
	//	 }
}

// accessors 
/**
 * @return true if the queue is empty, false otherwise
 */
bool MAGE::LabelQueue::isEmpty( void )
{
	PaUtil_ReadMemoryBarrier();
	
	if( nOfLabels <= 0 )
		return true;
	else 
		return false;
}

/**
 * 
 * @return true if the queue is full, i.e. if it contains the max number of elements
 * given to the constructor, false otherwise
 */
bool MAGE::LabelQueue::isFull( void )
{
	PaUtil_ReadMemoryBarrier();
	
	if( nOfLabels >= queue.size() )
		return true;
	else 
		return false;
}


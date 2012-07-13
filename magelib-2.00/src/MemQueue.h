/**
 *   @file    MemQueue.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Memory-efficient lock-free ringbuffer:
 *            push and template POD data with memcpy()
 *            and inform on the state of the buffer
 */

// [TODO] maybe build that class around pa_ringbuffer instead

#pragma once

#include "pa_memorybarrier.h"

namespace MAGE {

template <class Item>
class MemQueue {

  public:
    
    MemQueue( unsigned int queueLen );
    ~MemQueue( void );
    
    unsigned int getNumOfItems( void );
    void push( Item *item, unsigned int nOfItems );
    void pop( Item *item, unsigned int nOfItems );
    void pop( unsigned int nOfItems );
    
    bool isEmpty( void );
    bool isFull( void );
    
  //protected:
    
    unsigned int nOfItems;
    unsigned int length, remain;
    unsigned int read, write;
    Item *rawData;
};

} // namespace

template <class Item>
unsigned int MAGE::MemQueue<Item>::getNumOfItems( void ) {

    return nOfItems;
}

template <class Item>
MAGE::MemQueue<Item>::MemQueue( unsigned int queueLen ) {

    length = queueLen;
    rawData = (Item *) malloc( length*sizeof(Item) );
    
    read = write = 0;
    nOfItems = 0;
}

template <class Item>
MAGE::MemQueue<Item>::~MemQueue( void ) {
    
    free( rawData );
}

template <class Item>
void MAGE::MemQueue<Item>::push( Item *item, unsigned int nItem ) {
    
    PaUtil_ReadMemoryBarrier();
    if( write+nItem < length ) {
    
        memcpy( &rawData[write], item, nItem*sizeof(Item) );
        
        
    } else {
    
        remain = length-write;
        memcpy( &rawData[write], item, remain*sizeof(Item) );
        memcpy( rawData, &item[remain], (nItem-remain)*sizeof(Item) );
    }
    
    PaUtil_WriteMemoryBarrier();
    write = (write+nItem)%length;
    nOfItems += nItem;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( Item *item, unsigned int nItem ) {
    
    PaUtil_ReadMemoryBarrier();
    if( read+nItem < length ) {
        
        memcpy( item, &rawData[read], nItem*sizeof(Item) );
        
        
    } else {
        
        remain = length-write;
        memcpy( item, &rawData[write], remain*sizeof(Item) );
        memcpy( &item[remain], rawData, (nItem-remain)*sizeof(Item) );
    }
    
    PaUtil_WriteMemoryBarrier();
    read = (read+nItem)%length;
    nOfItems -= nItem;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( unsigned int nItem ) {
    
    PaUtil_WriteMemoryBarrier();
    read = (read+nItem)%length;
    nOfItems -= nItem;
}

template <class Item>
bool MAGE::MemQueue<Item>::isEmpty( void ) {
    
    PaUtil_ReadMemoryBarrier();
    if( nOfItems <= 0 ) return true;
    else return false;
}

template <class Item>
bool MAGE::MemQueue<Item>::isFull( void ) {
    
    PaUtil_ReadMemoryBarrier();
    if( nOfItems >= length ) return true;
    else return false;
}

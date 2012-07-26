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
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <unistd.h>


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
    void get( Item *item, unsigned int nOfItems );
    
    bool isEmpty( void );
    bool isFull( void );
    
  protected:
    
    int nOfItems;
    unsigned int length, remain;
    unsigned int read, write;
    Item *rawData;
};

} // namespace

template <class Item>
unsigned int MAGE::MemQueue<Item>::getNumOfItems( void ) {

    return (unsigned int) (nOfItems > 0) ? nOfItems : 0;
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
    // TODO fix case when 'write' pointer loops and passes 'read' (read should be advanced to write)
    // this bug shouldn't be triggered as long as we check isfull() before any push() in calling functions
    
    PaUtil_ReadMemoryBarrier();
    if( write+nItem <= length ) {
        //TODO either change this for a copy constructor or check that no Item (Model, Label, ...) has dynamically allocated memory
        memcpy( &rawData[write], item, nItem*sizeof(Item) );
               
    } else {
        //TODO either change this or check that no Item (Model, Label, ...) has dynamically allocated memory
        remain = length-write;
        memcpy( &rawData[write], item, remain*sizeof(Item) );
        memcpy( rawData, &item[remain], (nItem-remain)*sizeof(Item) );
    }
    
    PaUtil_WriteMemoryBarrier();
    write = (write+nItem)%length;
    nOfItems += nItem;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( Item *item, unsigned int nItem = 1 ) {
    // TODO fix case when 'write' pointer loops and passes 'read' (read should be advanced to write)
    // this bug shouldn't be triggered as long as we check isfull() before any push() in calling functions
    // TODO an isempty() check *is* needed
    // TODO check for nItem == 0 (shouldn't happen except if isempty() )

    //don't pop() further than available ...
    if (nItem > this->getNumOfItems()) {
        nItem = this->getNumOfItems();
    }
    
    PaUtil_ReadMemoryBarrier();
    if( read+nItem <= length ) {
        
        memcpy( item, &rawData[read], nItem*sizeof(Item) );
           
    } else {
        
        remain = length-read;
        memcpy( item, &rawData[read], remain*sizeof(Item) );
        memcpy( &item[remain], rawData, (nItem-remain)*sizeof(Item) );
    }
    
    PaUtil_WriteMemoryBarrier();
    read = (read+nItem)%length;
    nOfItems -= nItem;
}

template <class Item>
void MAGE::MemQueue<Item>::pop( unsigned int nItem = 1 ) {

    if (nItem > this->getNumOfItems()) {
        nItem = this->getNumOfItems();
    }
    
    PaUtil_WriteMemoryBarrier();
    read = (read+nItem)%length;
    nOfItems -= nItem;
}

/* like pop but does not advance in the queue */
template <class Item>
void MAGE::MemQueue<Item>::get( Item *item, unsigned int nItem = 1 ) {
    // TODO fix case when 'write' pointer loops and passes 'read' (read should be advanced to write)
    // this bug shouldn't be triggered as long as we check isfull() before any push() in calling functions
    // TODO an isempty() check *is* needed
    // TODO check for nItem == 0 (shouldn't happen except if isempty() )

    //don't pop() further than available ...
    if (nItem > this->getNumOfItems()) {
        nItem = this->getNumOfItems();
    }
    
    PaUtil_ReadMemoryBarrier();
    if( read+nItem <= length ) {
        
        memcpy( item, &rawData[read], nItem*sizeof(Item) );
           
    } else {
        
        remain = length-read;
        memcpy( item, &rawData[read], remain*sizeof(Item) );
        memcpy( &item[remain], rawData, (nItem-remain)*sizeof(Item) );
    }
}

template <class Item>
bool MAGE::MemQueue<Item>::isEmpty( void ) {
    
    PaUtil_ReadMemoryBarrier();
    return (nOfItems <= 0) ? true : false;
}

template <class Item>
bool MAGE::MemQueue<Item>::isFull( void ) {
    
    PaUtil_ReadMemoryBarrier();
    return (this->getNumOfItems() >= length) ? true : false;
}

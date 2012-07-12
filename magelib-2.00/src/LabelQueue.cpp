/**
 *   @file    LabelQueue.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label Queue Class
 */

#include "LabelQueue.h"

MAGE::LabelQueue::LabelQueue( unsigned int size ) {

    queue.resize( size );
    read = write = 0;
    nOfLabels = 0;
}

void MAGE::LabelQueue::push( Label &label ) {

    queue[write] = label;
    
    write = (write+1)%queue.size();
    
    nOfLabels++;
}

void MAGE::LabelQueue::pop( Label &label ) {

    label = queue[read];
    
    read = (read+1)%queue.size();
    
    nOfLabels--;
}

bool MAGE::LabelQueue::isEmpty( void ) {

    if( nOfLabels <= 0 ) return true;
    else return false;
}

bool MAGE::LabelQueue::isFull( void ) {

    if( nOfLabels >= queue.size() ) return true;
    else return false;
}

void MAGE::LabelQueue::print( void ) {
    
    for( int k=0; k<nOfLabels; k++ ) {
    
        printf( "%i: %s\n", (int)read+k, queue[read+k].query.c_str() );
    }
}

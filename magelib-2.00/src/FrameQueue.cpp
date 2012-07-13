/**
 *   @file    FrameQueue.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Frame ringbuffer: used to exchange speech
 *            parameters with the synthesis thread
 */

#include "FrameQueue.h"

MAGE::FrameQueue::FrameQueue( unsigned int queueLen ) :
MAGE::MemQueue<Frame>(queueLen) {
    
    
}

void MAGE::FrameQueue::printQueue( void ) {

    printf( "frame: " );
    
    for( int k=0; k<nOfItems; k++ ) {
    
        int head = (read+k)%length;
        printf( "( %i: %f ) ", head, rawData[head].lf0 );
    }
    
    printf( "\n" );
}
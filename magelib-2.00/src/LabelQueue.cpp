/**
 *   @file    LabelQueue.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label queue class: used to exchange the
 *            labels between the different threads; we
 *            could not inherint from MemQueue because
 *            Label is not a POD type -> memory issues
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
    PaUtil_WriteMemoryBarrier();
    nOfLabels++;
}

void MAGE::LabelQueue::pop( Label &label ) {

    label = queue[read];
    
    read = (read+1)%queue.size();
    PaUtil_WriteMemoryBarrier();
    nOfLabels--;
}

bool MAGE::LabelQueue::isEmpty( void ) {

    PaUtil_ReadMemoryBarrier();
    if( nOfLabels <= 0 ) return true;
    else return false;
}

bool MAGE::LabelQueue::isFull( void ) {

    PaUtil_ReadMemoryBarrier();
    if( nOfLabels >= queue.size() ) return true;
    else return false;
}

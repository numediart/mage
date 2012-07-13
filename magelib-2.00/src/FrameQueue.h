/**
 *   @file    FrameQueue.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Frame ringbuffer: used to exchange speech
 *            parameters with the synthesis thread
 */

#pragma once

#include "MemQueue.h"
#include "Frame.h"

namespace MAGE {
    
class FrameQueue : public MemQueue<Frame> {
   
  public:
        
    FrameQueue( unsigned int queueLen );
    void printQueue( void );
};
    
} // namespace

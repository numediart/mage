/**
 *   @file    ModelQueue.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Model ringbuffer: used to store statistical
 *            models + special generate() function that takes
 *            a lookup window and generates oldest-label frames
 */

#pragma once

#include "MemQueue.h"
#include "Model.h"

#include "FrameQueue.h"
#include "Frame.h"

#include "MathFunctions.h"

namespace MAGE {
    
class ModelQueue : public MemQueue<Model> {
    
  public:
    
    ModelQueue( unsigned int queueLen );
    void generate( unsigned int window, FrameQueue *frameQueue );
    void printQueue( void );
    
  protected:
    
    unsigned int head;
    Frame frame;
};

} // namespace

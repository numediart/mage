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
    
    ModelQueue( unsigned int queueLen, MAGE::ModelMemory *memory );
    void generate( Engine *engine, FrameQueue *frameQueue, unsigned int window );
    void printQueue( void );
    
    inline ModelMemory *getMem() { return this->mem; };
    
    void optimizeParameters( MAGE::Engine *engine, unsigned int window );
    
  protected:
    
    unsigned int head;
    Frame frame;
    		
    ModelMemory *mem;
};

} // namespace

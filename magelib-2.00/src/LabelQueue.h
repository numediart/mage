/**
 *   @file    LabelQueue.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label queue class: used to exchange the
 *            labels between the different threads; we
 *            could not inherint from MemQueue because
 *            Label is not a POD type -> memory issues
 */

#pragma once

#include <vector>
#include "Label.h"
#include "pa_memorybarrier.h"

using namespace std;
namespace MAGE {

class LabelQueue {

  public:
    
    LabelQueue( unsigned int size );
    
    void push( Label &label );
    void pop( Label &label );
    
    bool isEmpty( void );
    bool isFull( void );
    
  protected:
    
    vector<Label> queue;
    unsigned int read, write;
    unsigned int nOfLabels;
};

} // namespace

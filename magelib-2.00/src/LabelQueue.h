/**
 *   @file    LabelQueue.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label Queue Class
 */

#pragma once

#include <vector>
#include "Label.h"

using namespace std;
namespace MAGE {

class LabelQueue {

  public:
    
    LabelQueue( unsigned int size );
    
    void push( Label &label );
    void pop( Label &label );
    
    bool isEmpty( void );
    bool isFull( void );
    
    void print( void );
    
  protected:
    
    vector<Label> queue;
    unsigned int read, write;
    unsigned int nOfLabels;
};

} // namespace

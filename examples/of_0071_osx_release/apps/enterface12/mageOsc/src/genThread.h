#pragma once

#include "ofMain.h"

#include "LabelQueue.h"
#include "ModelQueue.h"
#include "FrameQueue.h"

#include "Label.h"
#include "Model.h"

using namespace MAGE;

class genThread : public ofThread {

  public:
    
    genThread( LabelQueue *lab, ModelQueue *mod, FrameQueue *frm );
    void threadedFunction( void );
    
  protected:
    
    LabelQueue *labelQueue;
    ModelQueue *modelQueue;
    FrameQueue *frameQueue;
    
    Label label;
    Model model;
};

#pragma once

#include "ofMain.h"

#include "LabelQueue.h"
#include "ModelQueue.h"
#include "FrameQueue.h"

#include "Label.h"
#include "Model.h"
#include "Engine.h"

using namespace MAGE;

class genThread : public ofThread {

  public:
    
    genThread( LabelQueue *lab, ModelQueue *mq, FrameQueue *frm, Engine *eng, Model *mod );
    void threadedFunction( void );
    
  protected:
    
    LabelQueue *labelQueue;
    ModelQueue *modelQueue;
    FrameQueue *frameQueue;
    Engine *engine;
    Model *model;
    
    Label label;

};

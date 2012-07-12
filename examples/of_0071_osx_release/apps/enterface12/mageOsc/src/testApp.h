#pragma once

#include "ofMain.h"
#include "obOlaBuffer.h"
#include "mage.h"

// --- LABEL THINGS ---
const int labelQueueLen = 16;

// --- AUDIO THINGS ---
const int sampleRate = 48000;
const int maxFrameLen =  4800;
const int dacBufferLen = 64;

class testApp : public ofBaseApp {
    
  public:
    
    // app callbacks
    void setup( void );
    void exit( void );
    
    // loop callbacks
    void update( void );
    void draw( void );
    
    // audio out callback
    void audioOut( float *outBuffer, int bufSize, int nChan );
    
    // app constructor
    testApp( int argc, char **argv );
    
    // keyboard callbacks
    void keyPressed( int key );
    void keyReleased( int key );

  protected:
    
    int Argc; // number of arguments passed to the main()
    char **Argv; // table of arguments passed to the main()
    
    //---
    
    MAGE::LabelQueue *labelQueue;
    MAGE::MemQueue<MAGE::Model> *modelQueue;
    
    MAGE::Model model1, model2;
    
    //---
    
    float *sampleFrame; // frame to be OLAed
    obOlaBuffer *olaBuffer; // overlap-add buffer
    int frameLen, hopLen; // frame size and hop size
    int sampleCount; // sample count for triggering
    bool drawSampleFrame; // do we show the frame
};

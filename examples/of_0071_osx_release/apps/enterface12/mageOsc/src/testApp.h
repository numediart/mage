#pragma once

#include "ofMain.h"
#include "mage.h"

#include "obOlaBuffer.h"
#include "genThread.h"

// --- QUEUE THINGS ---
const int labelQueueLen = 128; // max amount of labels that can wait
const int modelQueueLen = nOfLookup+2; // max stored past models for generation
const int frameQueueLen = 200; // longest label 1 sec = 200 frames of 5 smsec

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
    MAGE::ModelQueue *modelQueue;
    MAGE::FrameQueue *frameQueue;
    
    genThread *generate;
    Frame frame;
    
    //---
    
    float *sampleFrame; // frame to be OLAed
    obOlaBuffer *olaBuffer; // overlap-add buffer
    int frameLen, hopLen; // frame size and hop size
    int sampleCount; // sample count for triggering
    bool drawSampleFrame; // do we show the frame
};

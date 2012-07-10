#pragma once

#include "ofMain.h"

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
};

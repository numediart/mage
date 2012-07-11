#include "testApp.h"

void testApp::setup( void ) {
    
    // -- OLA AND AUDIO THINGS ---
    drawSampleFrame = false; // we don't draw the sample frame at runtime
    frameLen = 480; hopLen = 240; sampleCount = 0; // initialize OLA variables
    olaBuffer = new obOlaBuffer( 8*maxFrameLen ); // allocate memory for the OLA buffer
    sampleFrame = new float[ maxFrameLen ]; // allocate memory for the speech frame
    ofSoundStreamSetup( 1, 0, this, sampleRate, dacBufferLen, 4 ); // audio setup
}

void testApp::exit( void ) {
    
    delete sampleFrame;
    delete olaBuffer;
}

void testApp::update( void ) {
    
    
}

void testApp::draw( void ) {
    
    if( drawSampleFrame ) {
        
        float xOffset = 30;
        float yOffset = 30;
        float yWidth = 300;
    
        ofNoFill();
        ofBackground( 30, 30, 30 );
        ofSetColor( 200, 200, 200 );
    
        // middle line to show the zero
        ofLine( xOffset, yOffset+(yWidth/2),
        xOffset+frameLen, yOffset+(yWidth/2) );
        
        for( int k=1; k<frameLen; k++ ) {
        
            // linearly interpolated waveform to look nice on screen
            ofLine( (k-1)+xOffset, ofMap( sampleFrame[k-1], -1, 1, yOffset+yWidth,
            yOffset), k+xOffset, ofMap( sampleFrame[k], -1, 1, yOffset+yWidth, yOffset));
        }
        
        // rectangle box to show where is the max
        ofRect( xOffset, yOffset, frameLen, yWidth );
    }
}

void testApp::audioOut( float *outBuffer, int bufSize, int nChan ) {
    
    for ( int k=0; k<bufSize; k++ ) {
        
        if( sampleCount >= hopLen ) { // if we hit the hop lenght
            
            olaBuffer->ola( sampleFrame, frameLen, k ); // OLA the frame
            sampleCount = 0; // and reset the sample count for next time
            
        } else {
        
            sampleCount++; // otherwise increment sample count
        }
    }
    
    // pulling samples out for the DAC
    olaBuffer->pull( outBuffer, bufSize );
}

//---

testApp::testApp( int argc, char **argv ) {
    
    Argc = argc; // we use this trick to pass the HTS command line flags
    Argv = argv; // to the openFrameworks app and use them at launch
}

void testApp::keyPressed( int key ) {
    
    // press any key to check that the frame
    // is changed and corrected overlapped
    
    frameLen = ofRandom( 300, 600 );
    
    for( int k=0; k<frameLen; k++ ) {
        
        sampleFrame[k] = ofRandomf();
    }
}

void testApp::keyReleased( int key ) {

    
}

#include "testApp.h"

void testApp::setup( void ) {
    
    // --- QUEUES ---
    labelQueue = new MAGE::LabelQueue( labelQueueLen );
    modelQueue = new MAGE::ModelQueue( modelQueueLen );
    frameQueue = new MAGE::FrameQueue( frameQueueLen );
    
    // --- HTS Engine ---
    engine = new MAGE::Engine();
    engine->load(Argc, Argv);
    
    // --- PARAMETER GENERATION THREAD ---
    generate = new genThread( labelQueue, modelQueue, frameQueue, engine );
    generate->startThread();
    
    // -- OLA AND AUDIO ---
    drawSampleFrame = true; // we don't draw the sample frame at runtime
    frameLen = 480; hopLen = 240; sampleCount = 0; // initialize OLA variables
    olaBuffer = new obOlaBuffer( 8*maxFrameLen ); // allocate memory for the OLA buffer
    sampleFrame = new float[ maxFrameLen ](); // allocate memory for the speech frame
    ofSoundStreamSetup( 1, 0, this, sampleRate, dacBufferLen, 4 ); // audio setup
    
    string s(this->Argv[this->Argc-1]);
    parsefile(s);
    //parsefile("../../../../data/inouts/labels/alice01.lab");
}

void testApp::exit( void ) {
    
    generate->waitForThread( true );
    delete generate;
    
    delete labelQueue;
    delete modelQueue;
    delete frameQueue;
    
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
        if( sampleCount >= hopLen-1 ) { // if we hit the hop length
            
            if( !frameQueue->isEmpty() ) {
                
                frameQueue->pop( &frame, 1 ); // we pop a speech parameter frame
            
                // <DUMMY-CODE>
                
                for( int s=0; s<frameLen; s++ ) {
                    if (frame.voiced) {    
                        // create a frame with windowed sin reacting to interactive value of Length
                        float hannWin = 0.5 * (1.0 - cos((TWO_PI * ((float)s)) / (((float)frameLen) - 1.0)));
                        sampleFrame[s] = 0.25 * hannWin * sin( (float)s * ((TWO_PI*exp(frame.lf0))/(float)sampleRate) );
                    } else {
                        sampleFrame[s] = 0.0;
                    }
                }
                
                // </DUMMY-CODE>
            }
            
            olaBuffer->ola( sampleFrame, frameLen, k ); // OLA the frame
            sampleCount = 0; // and reset the sample count for next time
        } else {
            sampleCount++; // otherwise increment sample count
        }
    }

    // pulling samples out for the DAC
    olaBuffer->pop( outBuffer, bufSize );

//    FILE *file;
//
//    file = fopen("out.raw", "ab");
//    fwrite(outBuffer, sizeof(float), bufSize, file);
//
//    fclose(file);
}

//---

testApp::testApp( int argc, char **argv ) {
    
    Argc = argc; // we use this trick to pass the HTS command line flags
    Argv = argv; // to the openFrameworks app and use them at launch
}

void testApp::keyPressed( int key ) {
    if( key == 'l' ) {
        
        //MAGE::Label label("x^x-pau+ae=l@x_x/A:0_0_0/B:x-x-x@x-x&x-x#x-x$x-x!x-x;x-x|x/C:1+1+2/D:0_0/E:x+x@x+x&x+x#x+x/F:content_2/G:0_0/H:x=x^1=10|0/I:19=12/J:79+57-10");
//        MAGE::Label label;
//        label.setQuery( "x^x-pau+ae=l@x_x/A:0_0_0/B:x-x-x@x-x&x-x#x-x$x-x!x-x;x-x|x/C:1+1+2/D:0_0/E:x+x@x+x&x+x#x+x/F:content_2/G:0_0/H:x=x^1=10|0/I:19=12/J:79+57-10" );
//        label.setQuery( "x^pau-ae+l=ax@1_2/A:0_0_0/B:1-1-2@1-2&1-19#1-10$1-5!0-2;0-8|ae/C:0+0+2/D:0_0/E:content+2@1+12&1+6#0+2/F:aux_1/G:0_0/H:19=12^1=10|L-H%/I:3=3/J:79+57-10" );
//        if( !labelQueue->isFull() ) labelQueue->push( label );
//        else printf( "label queue is full !\n");
        
        MAGE::Label label;
        while (!labellist.empty()) {
            string q = labellist.front();
            label.setQuery(q);
            labellist.pop();
        
            if( !labelQueue->isFull() ) labelQueue->push( label );
            else printf( "label queue is full !\n%s",q.c_str());
        }
    }
    
    /*if( key == 'b' ) {
    
        if( !frameQueue->isEmpty() ) frameQueue->pop( &frame, 1 );
        else printf( "frame queue is empty !\n" );
    }
    
    if( key == 'p' ) {
    
        frameQueue->printQueue();
    }*/
}

void testApp::keyReleased( int key ) {

    
}

void testApp::parsefile(std::string filename) 
{
    string line;
    ifstream myfile(filename.c_str());
    
    if (!myfile.is_open()) {
        printf("could not open file %s",filename.c_str());
        return;
    }
    
    for (int k=0;getline(myfile, line);k++) {
        this->labellist.push(line);
    }
    
    myfile.close();
    
    return;
}

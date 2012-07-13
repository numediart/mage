#include "genThread.h"

genThread::genThread( LabelQueue *lab, ModelQueue *mod, FrameQueue *frm ) {

    labelQueue = lab;
    modelQueue = mod;
    frameQueue = frm;
}

void genThread::threadedFunction( void ) {

    while ( isThreadRunning() ) {
        
        if( !labelQueue->isEmpty() ) {
        
            labelQueue->pop( label );
            
            for( int s=0; s<nOfStates; s++ ) {
            
                model.state[s].duration = (int)ofRandom( 1, 40 );
                
                for( int k=0; k<(nOfDers*nOfMGCs); k++ ) {
                
                    model.state[s].mgc[k].mean = ofRandom( -5.0, 5.0 );
                    model.state[s].mgc[k].vari = ofRandom( 0.2, 0.4 );
                }
                
                for( int k=0; k<(nOfDers*nOfLF0s); k++ ) {
                    
                    model.state[s].lf0[k].mean = ofRandom( 110.0, 500.0 );
                    model.state[s].lf0[k].vari = ofRandom( 2.0, 4.0 );
                    model.state[s].lf0[k].msdFlag = false;
                }
                
                for( int k=0; k<nOfLPFs; k++ ) {
                    
                    model.state[s].lpf[k].mean = ofRandom( -5.0, 5.0 );
                    model.state[s].lpf[k].vari = ofRandom( 0.2, 0.4 );
                }
            }
            
            modelQueue->push( &model, 1 );
            
            if( modelQueue->getNumOfItems() >= nOfLookup+1 ) {
            
                modelQueue->generate( nOfLookup+1, frameQueue );                
                modelQueue->pop( 1 );
            }
                
        } else {
        
            usleep(100);
        }
    }
}

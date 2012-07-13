/**
 *   @file    ModelQueue.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Model ringbuffer: used to store statistical
 *            models + special generate() function that takes
 *            a lookup window and generates oldest-label frames
 */

#include "ModelQueue.h"

MAGE::ModelQueue::ModelQueue( unsigned int queueLen ) :
MAGE::MemQueue<Model>(queueLen) {
    
    // this is just to pass the
    // queueLen to the parent class
}

void MAGE::ModelQueue::generate( unsigned int window, FrameQueue *frameQueue ) {

    float sum = 0.0;
    
    // we look at 'window' labels before the current
    // writing head to compute the stats (coarticulation)
    for( int k=-window; k<0; k++ ) {
    
        head = (write+k)%length; // the real ringbufferized lookup head
        
        // <DUMMY-CODE>
        
        // from here to the closing tag, this is dummy code
        // we don't really compute anything else than the sum of
        // all the supposedly accessible data, but we do that to
        // check that we can actually access these data when we
        // are supposed to and simpulate some complexity
        
        for( int s=0; s<nOfStates; s++ ) {
            
            for( int k=0; k<(nOfDers*nOfMGCs); k++ ) {
                
                sum += rawData[head].state[s].mgc[k].mean;
                sum += rawData[head].state[s].mgc[k].vari;
            }
            
            for( int k=0; k<(nOfDers*nOfLF0s); k++ ) {
                
                sum += rawData[head].state[s].lf0[k].mean;
                sum += rawData[head].state[s].lf0[k].vari;
                rawData[head].state[s].lf0[k].msdFlag = true;
            }
            
            for( int k=0; k<nOfLPFs; k++ ) {
                
                sum += rawData[head].state[s].lpf[k].mean;
                sum += rawData[head].state[s].lpf[k].vari;
            }
        }
        
        // </DUMMY-CODE>
    }
    
    head = (write-window)%length; // then we land on the oldest model
    
    for( int s=0; s<nOfStates; s++ ) {
    
        // from each state of the model, we get the computed
        // duration and we iterate to generate the parameters
        
        for( int q=0; q<rawData[head].state[s].duration; q++ ) {
        
            // <DUMMY-CODE>
            
            // again just putting some crap here,
            // to see if data access is working
            // and check if the queue works
            
            for( int k=0; k<nOfMGCs; k++ ) {
                
                frame.mgc[k] = ofRandom( -5.0, 5.0 );
            }
            
            for( int k=0; k<nOfLPFs; k++ ) {
                
                frame.lpf[k] = ofRandom( -5.0, 5.0 );
            }
            
            frame.lf0 = ofRandom( 300.0, 1500.0 );
            
            // </DUMMY-CODE>
            
            while( frameQueue->isFull() ) {
                
                printf("frameQueue is full\n");
                usleep(10);
            };
            frameQueue->push( &frame, 1 );
        }
    }
}

void MAGE::ModelQueue::printQueue( void ) {
    
    for( int k=0; k<nOfItems; k++ ) {
        
        int head = (read+k)%length;
        
        printf( "model %i:", head );
        
        for( int s=0; s<nOfStates; s++ ) {
        
            printf( " %i", rawData[head].state[s].duration );
        }
        
        printf( "\n" );
    }
}

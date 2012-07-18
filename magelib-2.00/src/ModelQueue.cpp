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

    unsigned int k, s, q;
    float sum = 0.0;
    
    // we look at 'window' labels before the current
    // writing head to compute the stats (coarticulation)
    for( int m=-window; m<0; m++ ) {
    
        head = (write+m)%length; // the real ringbufferized lookup head
        
        // <DUMMY-CODE>
        
        // from here to the closing tag, this is dummy code
        // we don't really compute anything else than the sum of
        // all the supposedly accessible data, but we do that to
        // check that we can actually access these data when we
        // are supposed to and simulate some complexity
        
        for( s=0; s<nOfStates; s++ ) {
            
            for( k=0; k<(nOfDers*nOfMGCs); k++ ) {
                
                sum += rawData[head].getState(s).mgc[k].mean;
                sum += rawData[head].getState(s).mgc[k].vari;
            }
            
            for( k=0; k<(nOfDers*nOfLF0s); k++ ) {
                
                sum += rawData[head].getState(s).lf0[k].mean;
                sum += rawData[head].getState(s).lf0[k].vari;
                rawData[head].getState(s).lf0[k].msdFlag = true;
            }
            
            for( k=0; k<nOfLPFs; k++ ) {
                
                sum += rawData[head].getState(s).lpf[k].mean;
                sum += rawData[head].getState(s).lpf[k].vari;
            }
        }
        
        // </DUMMY-CODE>
    }
    
    head = (write-window)%length; // then we land on the oldest model
    
    for( s=0; s<nOfStates; s++ ) {
    
        // from each state of the model, we get the computed
        // duration and we iterate to generate the parameters
        
        for( q=0; q<rawData[head].getState(s).duration; q++ ) {
        
            // <DUMMY-CODE>
            
            // again just putting some crap here,
            // to see if data access is working
            // and check if the queue works
            
            for( k=0; k<nOfMGCs; k++ ) {
                
                frame.mgc[k] = MAGE::Random( -5.0, 5.0 );
            }
            
            for( k=0; k<nOfLPFs; k++ ) {
                
                frame.lpf[k] = MAGE::Random( -5.0, 5.0 );
            }
            
            frame.lf0 = MAGE::Random( 300.0, 1500.0 );
            
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
    unsigned int k, s;


    for( k=0; k<getNumOfItems(); k++ ) {
        
        int head = (read+k)%length;
        
        printf( "model %i:", head );
        
        for( s=0; s<nOfStates; s++ ) {
            printf( " %i", rawData[head].getState(s).duration );
        }
        
        printf( "\n" );
    }
}

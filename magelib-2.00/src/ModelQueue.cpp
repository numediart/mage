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
//TODO actual frame generation with vocoder
    unsigned int k, s, q, qmgc, qlf0, qlpf;
    
    head = (write-window)%length; // then we land on the oldest model
    
    for( s=0, qmgc = 0, qlf0 = 0, qlpf = 0; s<nOfStates; s++ ) {
    
        // from each state of the model, we get the computed
        // duration and we iterate to generate the parameters
        //printf("duration of state %d = %d, v/uv: %g\n",s,rawData[head].getState(s).duration,rawData[head].getState(s).lf0[0].msdFlag);
        for( q=0; q<rawData[head].getState(s).duration; q++ ) {
        
            // <DUMMY-CODE>
            
            // again just putting some crap here,
            // to see if data access is working
            // and check if the queue works
            
            for( k=0; k<nOfMGCs; k++ ) {
                
                frame.mgc[k] = rawData[head].getMem()->par[mgcStreamIndex][qmgc][k];
            }
            qmgc++;
            
            for( k=0; k<nOfLPFs; k++ ) {
                
                frame.lpf[k] = rawData[head].getMem()->par[lpfStreamIndex][qlpf][k];
            }
            qlpf++;
            
            //frame.f0 = exp(rawData[head].getState(s).lf0[0].mean);
            
            if (rawData[head].getState(s).lf0[0].msdFlag > 0.5) {
                frame.voiced = true;
                frame.f0 = exp(rawData[head].getMem()->par[lf0StreamIndex][qlf0][nOfLF0s-1]);
                qlf0++;
            } else {
                frame.voiced = false;
                frame.f0 = 0;
            }
            
            // </DUMMY-CODE>
            
            while( frameQueue->isFull() ) {                 
//                printf("frameQueue is full\n");
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

#include "genThread.h"

genThread::genThread( LabelQueue *lab, ModelQueue *mq, FrameQueue *frm, Engine *eng, Model *mod ) {

    this->labelQueue = lab;
    this->modelQueue = mq;
    this->frameQueue = frm;
    this->engine = eng;
    this->model = mod;
    
    this->model->checkInterpolationWeights( engine );
}

void genThread::threadedFunction( void ) {
    //unsigned int k, s;


    while ( isThreadRunning() ) {
        
        if( !labelQueue->isEmpty() ) {
        
            labelQueue->pop( label );
            
            //for(s=0; s<nOfStates; s++ ) {
            
                //model->getState(s).duration = (int) ofRandom( 1, 40 );
                model->computeDuration( engine, &label );
                model->computeParameters( engine, &label );
                model->computeGlobalVariances( engine, &label );
                model->optimizeParameters( engine );
                
                /*for( k=0; k<(nOfDers*nOfMGCs); k++ ) {
                
                    model->getState(s).mgc[k].mean = ofRandom( -5.0, 5.0 );
                    model->getState(s).mgc[k].vari = ofRandom( 0.2, 0.4 );
                }
                
                for( k=0; k<(nOfDers*nOfLF0s); k++ ) {
                    
                    model->getState(s).lf0[k].mean = ofRandom( 110.0, 500.0 );
                    model->getState(s).lf0[k].vari = ofRandom( 2.0, 4.0 );
                    model->getState(s).lf0[k].msdFlag = false;
                }
                
                for( k=0; k<nOfLPFs; k++ ) {
                    
                    model->getState(s).lpf[k].mean = ofRandom( -5.0, 5.0 );
                    model->getState(s).lpf[k].vari = ofRandom( 0.2, 0.4 );
                }*/
            //}
            
            modelQueue->push( model, 1 );
            
            if( modelQueue->getNumOfItems() > nOfLookup ) {
            
                modelQueue->generate( nOfLookup+1, frameQueue );                
                modelQueue->pop();
            }
                
        } else {
        
            usleep(100);
        }
    }
}

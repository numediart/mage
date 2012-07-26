/* ------------------------------------------------------------------------------------------- */
/*																							   */
/*  This file is part of MAGE / pHTS (the performative HMM-based speech synthesis system)      */
/*																							   */
/*  MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms     */
/*  of the GNU General Public License as published by the Free Software Foundation, either     */
/*  version 3 of the license, or any later version.											   */
/*																							   */
/*  MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;   */	
/*  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  */
/*  See the GNU General Public License for more details.									   */
/*																							   */	
/*  You should have received a copy of the GNU General Public License along with MAGE / pHTS.  */ 
/*  If not, see http://www.gnu.org/licenses/												   */
/*																							   */
/*																							   */	
/*  Copyright 2011 University of Mons :													       */
/*																							   */	
/*			Numediart Institute for New Media Art (www.numediart.org)						   */
/*         Acapela Group (www.acapela-group.com)											   */
/*																							   */
/*																							   */
/*   Developed by :																			   */
/*																							   */
/*		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit */
/*																							   */
/* ------------------------------------------------------------------------------------------- */

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
    
    bool flag = true;


    while ( isThreadRunning() ) {
        
        if( !labelQueue->isEmpty() ) {
        
            labelQueue->pop( label );

            model->computeDuration( engine, &label );
             
			//static int dur[5] = {0,0,10,0,0};
			//model->updateDuration(dur, MAGE::scale); // to put a speed profile on state duration (put it inside compute duration ?)
            
			model->computeParameters( engine, &label );
            model->computeGlobalVariances( engine, &label );
            //model->optimizeParameters( engine );

            modelQueue->push( model, 1 );
            
            if( modelQueue->getNumOfItems() > nOfLookup+nOfBackup ) {
                flag = false;
                modelQueue->optimizeParameters(engine, nOfBackup, nOfLookup);
                modelQueue->generate( frameQueue, nOfBackup );                
                modelQueue->pop();
            } else if (modelQueue->getNumOfItems() > nOfLookup && flag) {
                modelQueue->optimizeParameters(engine, modelQueue->getNumOfItems()-nOfLookup-1, nOfLookup);
                modelQueue->generate( frameQueue, modelQueue->getNumOfItems()-nOfLookup-1 );  
            }     
        } else {
        
            usleep(100);
        }
    }
}

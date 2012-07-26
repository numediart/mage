/**
 *   @file    Constants.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Set of constant values to setup all the
 *            POD arrays within the application, not
 *            the best way but mallocs were a pain
 */

#pragma once 

namespace MAGE 
{
    const unsigned int nOfStreams = 3;		// # of streams : mgcs, lf0, lpf
    
    const unsigned int nOfDers = 3; // # of derivations: ∆(0), ∆(1), ∆(3)
    
    const unsigned int nOfMGCs = 35; // # of MGC coefficients for the MLSA filter
    const unsigned int nOfLF0s = 1; // fundamental frequency is a single value
    const unsigned int nOfLPFs = 31; // # of low-pass filter coefficients
    
    const unsigned int nOfStates = 5; // # of states in the HMM
    
    const unsigned int nOfLookup = 1; // # of looked-up labels
    // # of backed-up labels (models in modelqueue actually) 
    //this is the number of labels/models already used that we keep in memory
    //for smoother parameters computation
    const unsigned int nOfBackup = 2; 
	const int maxNumOfFrames = 512; // maximum # of frames per phoneme
	const int maxWindowWidth = 50;
    
    const int mgcStreamIndex = 0;
    const int lf0StreamIndex = 1;
    const int lpfStreamIndex = 2;
	
	const int overwrite = 0;
	const int shift		= 1;
	const int scale		= 2;
    
    // --- VOCODER ---
    const double defaultAlpha = 0.55;
    const int defaultFrameRate = 240;
    const int defaultInterpFrameRate = 1;
    const int defaultPadeOrder = 4;
}

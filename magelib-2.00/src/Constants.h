/**
 *   @file    Constants.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Set of constant values to setup all the
 *            POD arrays within the application, not
 *            the best way but mallocs were a pain
 */

#pragma once

namespace MAGE {
    const unsigned int nOfStreams = 3;		// # of streams : mgcs, lf0, lpf
    
    const unsigned int nOfDers = 3; // # of derivations: ∆(0), ∆(1), ∆(3)
    
    const unsigned int nOfMGCs = 35; // # of MGC coefficients for the MLSA filter
    const unsigned int nOfLF0s = 1; // fundamental frequency is a single value
    const unsigned int nOfLPFs = 31; // # of low-pass filter coefficients
    
    const unsigned int nOfStates = 5; // # of states in the HMM
    
    const unsigned int nOfLookup = 1; // # of looked-up labels
	const int maxNumOfFrames = 100; // maximum # of frames per phoneme
	const int maxWindowWidth = 50;
}

/**
 *   @file    Constants.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Set of constant values to setup all the
 *            POD arrays within the application, not
 *            the best way but mallocs were a pain
 */

#pragma once

namespace MAGE {
    
    const int nOfDers = 3; // # of derivations: ∆(0), ∆(1), ∆(3)
    
    const int nOfMGCs = 35; // # of MGC coefficients for the MLSA filter
    const int nOfLF0s = 1; // fundamental frequency is a single value
    const int nOfLPFs = 31; // # of low-pass filter coefficients
    
    const int nOfStates = 5; // # of states in the HMM
    
    const int nOfLookup = 1; // # of looked-up labels
}

/**
 *   @file    State.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   HMM state class, it contains the
 *            state duration and distributions
 */

#pragma once

#include "Distribution.h"
#include "MSDistribution.h"
#include "Constants.h"

namespace MAGE {

struct State {
    
    unsigned int duration;
    
    Distribution mgc[nOfDers*nOfMGCs];
    MSDistribution lf0[nOfDers*nOfLF0s];
    Distribution lpf[nOfLPFs];
};

} // namespace

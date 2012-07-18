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

    // global variances switch
    bool gv_switch;
    
    // parameters loaded from trees
    Distribution	mgc[nOfDers*nOfMGCs];
    MSDistribution	lf0[nOfDers*nOfLF0s];
    Distribution	lpf[nOfDers*nOfLPFs];

    // global variances
    Distribution gv_mgc[nOfDers*nOfMGCs];
    Distribution gv_lf0[nOfDers*nOfLF0s];
    Distribution gv_lpf[nOfDers*nOfLPFs];
};

} // namespace

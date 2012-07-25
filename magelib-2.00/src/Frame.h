/**
 *   @file    Frame.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Synthesis frame class
 */

#pragma once

#include "Constants.h"

namespace MAGE {
    
struct Frame {
        
    double mgc[nOfMGCs];
    double lpf[nOfLPFs];
    double f0;
    bool voiced;
};
    
} // namespace

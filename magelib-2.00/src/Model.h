/**
 *   @file    Model.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   HMM Class
 */

#pragma once

#include "Constants.h"
#include "State.h"

namespace MAGE {
    
struct Model {
    
    State state[nOfStates];
};
    
} // namespace

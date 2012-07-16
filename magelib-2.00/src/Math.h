/**
 *   @file    Math.h
 *   @author  A. Moinet
 *   @brief   Some math utilities
 */


#pragma once

#include <cstdlib>

namespace MAGE {

/* functions found in openframeworks' Math.h*/
inline float Max(float a, float b) {
    return ((a) < (b) ? (b) : (a));
}

inline float Min(float a, float b) {
    return ((a) > (b) ? (b) : (a));
}

float Random(float x, float y);

} // namespace

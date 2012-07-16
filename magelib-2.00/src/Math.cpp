/**
 *   @file    Math.h
 *   @author  A. Moinet
 *   @brief   Some math utilities
 */

#include "Math.h"

float MAGE::Random(float x, float y) {
        float high = 0;
        float low = 0;
        float randNum = 0;
        // if there is no range, return the value
        if (x == y) return x;                   // float == ?, wise? epsilon?
        high = MAGE::Max(x,y);
        low = MAGE::Min(x,y);
        randNum = low + ((high-low) * rand()/(RAND_MAX + 1.0));
        return randNum;
}

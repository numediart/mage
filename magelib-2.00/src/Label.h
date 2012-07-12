/**
 *   @file    Label.h
 *   @author  N. d'Alessandro
 *   @brief   Label Class
 */

// DUMMY

#pragma once

#include <string>

using namespace std;
namespace MAGE {
    
class Label {

  public:
    
    Label( void );

//  protected:
    
    string query;
    
    bool isForced;
    
    unsigned long begin;
    unsigned long end;
};

} // namespace

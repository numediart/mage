/**
 *   @file    Label.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label class: store the label string +
 *            time tags and either duration is forced
 */

#pragma once

#include <string>

using namespace std;
namespace MAGE {
    
class Label {

  public:
    
    Label( void );
    void setQuery( string q );
    void printQuery( void );

  protected:
    
    string query;
    
    bool isForced;
    
    unsigned long begin;
    unsigned long end;
};

} // namespace

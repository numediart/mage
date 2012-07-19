/**
 *   @file    Label.h
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label class: store the label string +
 *            time tags and either duration is forced
 */

#pragma once

#include <string>
#include <cstring>
#include <sstream>
#include "Engine.h"
#include "hts.h"

using namespace std;
namespace MAGE {
    
class Label {

  public:
    
    //default constructor
    Label( void );
    Label( string q );
    //Label( string query, Engine engine );

    void printQuery( void );
    void parseQuery( string q );
    
    // getters
    string getQuery( void );
    
    int getBegin( void );
    int getEnd( void );
    
    int getSpeed( void );
    bool getIsForced( void );
    
    //setters
    void setQuery( string query );
    
    void setBegin( int begin );
    void setEnd( int end );
    
    void setSpeed( int speed );
    void setIsForced( bool isDurationForced );

  protected:
    
    string query;
    
    bool isForced;
    
    int speed;
    int begin;
    int end;
};

} // namespace

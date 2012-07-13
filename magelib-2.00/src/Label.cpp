/**
 *   @file    Label.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label class: store the label string +
 *            time tags and either duration is forced
 */

#include "Label.h"

MAGE::Label::Label( void ) {

    query = "";    
    isForced = false;
    begin = end = 0;
}

void MAGE::Label::setQuery( string q ) {
    
    query = q;
}

void MAGE::Label::printQuery( void ) {
    
    printf( "label: %s\n", query.c_str() );
}

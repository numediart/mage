/**
 *   @file    Label.cpp
 *   @author  N. d'Alessandro, M. Astrinaki
 *   @brief   Label class: store the label string +
 *            time tags and either duration is forced
 */

#include "Label.h"

//default constructor
MAGE::Label::Label( void )
{
    query = "";
    isForced = false;
    begin = end = speed = -1;
}
	
MAGE::Label::Label( string query )
{
	string first, middle, last;
    istringstream liness( query );
	
	// parse input label string to get strings : start - end - query
    getline( liness, first,  ' ' );
	getline( liness, middle, ' ' );
    getline( liness, last,   ' ' );	
	
	// parse splitted strings to get char* : start - end - query
	char *strFirst = new char  [first.size()+1]; 
	char *strMiddle = new char [middle.size()+1];
	char *strLast = new char   [last.size()+1];

	strcpy( strFirst,  first.c_str() );
	strcpy( strMiddle, middle.c_str() );
	strcpy( strLast,   last.c_str() );

	if (isdigit_string(strFirst) && isdigit_string(strMiddle)) { // has correct frame infomation
		this->begin = atof(strFirst);
		this->end	= atof(strMiddle);
		this->query.assign(strLast);
		this->isForced = true;
	} else {
		this->begin = -1.0;
		this->end   = -1.0;
		this->query.assign(strFirst);
		this->isForced = false;
	}

	this->speed = 1;
}

/*MAGE::Label::Label( string query, Engine engine )
{
	const double rate = engine.getGlobal().sampling_rate / ( engine.getGlobal().fperiod * 1e+7 );
	
	string first, middle, last;
    istringstream liness( query );
	
	// parse input label string to get strings : start - end - query
    getline( liness, first,  ' ' );
	getline( liness, middle, ' ' );
    getline( liness, last,   ' ' );	
	
	// parse splitted strings to get char* : start - end - query
	char *strFirst = new char [first.size()+1]; 
	char *strMiddle = new char [middle.size()+1];
	char *strLast = new char [last.size()+1];
	
	strcpy( strFirst, first.c_str() );
	strcpy( strMiddle, middle.c_str() );
	strcpy( strLast, last.c_str() );
	
	printf("%s \n", strFirst);
	printf("%s \n", strMiddle);
	printf("%s \n", strLast);
	
	if (isdigit_string(strFirst) && isdigit_string(strMiddle)) { // has correct frame infomation
		this->begin = rate * atof(strFirst);
		this->end	= rate * atof(strMiddle);
		this->query.assign(strLast);
	} else {
		this->begin = -1.0;
		this->end = -1.0;
		this->query.assign(strFirst);
	}
	
	this->isForced = false;
	this->speed = 1;
}*/

// getters
string MAGE::Label::getQuery( void )
{
	return( this->query );
}

int MAGE::Label::getBegin( void )
{
	return( this->begin );
}

int MAGE::Label::getEnd( void )
{
	return( this->end );
}

int MAGE::Label::getSpeed( void )
{
	return( this->speed );
}

bool MAGE::Label::getIsForced( void )
{
	return( this->isForced );
}

//setters
void MAGE::Label::setQuery( string query )
{
	this->query = query;
}

void MAGE::Label::setBegin( int begin )
{
	this->begin = begin;
}

void MAGE::Label::setEnd( int end )
{
	this->end = end;
}

void MAGE::Label::setSpeed( int speed )
{
	this->speed = speed;
}

void MAGE::Label::setIsForced( bool isForced )
{
	this->isForced = isForced;
}

void MAGE::Label::printQuery( void ) {
    
    printf( "label: %s\n", this->query.c_str() );
}

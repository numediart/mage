/* --------------------------------------------------------------------------------------------	*/
/*																								*/
/*	This file is part of MAGE / pHTS( the performative HMM-based speech synthesis system )		*/
/*																								*/
/*	MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms		*/
/*	of the GNU General Public License as published by the Free Software Foundation, either		*/
/*	version 3 of the license, or any later version.												*/
/*																								*/
/*	MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;	*/	
/*	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	*/
/*	See the GNU General Public License for more details.										*/
/*																								*/	
/*	You should have received a copy of the GNU General Public License along with MAGE / pHTS.	*/ 
/*	If not, see http://www.gnu.org/licenses/													*/
/*																								*/
/*																								*/	
/*	Copyright 2011 University of Mons :															*/
/*																								*/	
/*			Numediart Institute for New Media Art( www.numediart.org )							*/
/*			Acapela Group ( www.acapela-group.com )												*/
/*																								*/
/*																								*/
/*	 Developed by :																				*/
/*																								*/
/*		Maria Astrinaki, Geoffrey Wilfart, Alexis Moinet, Nicolas d'Alessandro, Thierry Dutoit	*/
/*																								*/
/* --------------------------------------------------------------------------------------------	*/

/**
 *	 @file	Mage.cpp
 *	 @author M. Astrinaki
 */

#include "mage.h"

MAGE::Mage::Mage( void )
{
	// --- Memory ---
	this->memory = NULL;

	// --- Queues ---	
	this->labelQueue = NULL;
	this->modelQueue = NULL;
	this->frameQueue = NULL;
	
	// --- HTS Engine ---
	this->engine = NULL;
	
	// --- Model ---
	this->model = NULL;
	
	// --- SPTK Vocoder ---
	this->vocoder = NULL;
	// --- FRAME ---
	//Frame frame;
	
	
	
		
}

MAGE::Mage::Mage( int Argc, char **Argv )
{
	// --- Memory ---
	this->memory = new MAGE::ModelMemory::ModelMemory();
	 
	// --- Queues ---	
	this->labelQueue = new MAGE::LabelQueue( maxLabelQueueLen );
	this->modelQueue = new MAGE::ModelQueue( maxModelQueueLen, memory );
	this->frameQueue = new MAGE::FrameQueue( maxFrameQueueLen );
	
	// --- HTS Engine ---
	this->engine = new MAGE::Engine();
	this->engine->load( Argc, Argv );
	
	// --- Model ---
	this->model = new MAGE::Model::Model();

	// --- SPTK Vocoder ---
	this->vocoder = new MAGE::Vocoder::Vocoder();
	
	// --- FRAME ---
	//Frame frame;

}

MAGE::LabelQueue * MAGE::Mage::getLabelQueue( void )
{
	return( this->labelQueue );
}

MAGE::ModelQueue * MAGE::Mage::getModelQueue( void )
{
	return( this->modelQueue );
}

MAGE::FrameQueue * MAGE::Mage::getFrameQueue( void )
{
	return( this->frameQueue );
}

MAGE::ModelMemory * MAGE::Mage::getMemory( void )
{
	return( this->memory );
}

MAGE::Vocoder * MAGE::Mage::getVocoder( void )
{
	return( this->vocoder );
}

MAGE::Engine * MAGE::Mage::getEngine( void )
{
	return( this->engine );
}

MAGE::Model * MAGE::Mage::getModel( void )
{
	return( this->model );
}

/*MAGE::Frame MAGE::Mage::getFrame( void )
{
	return( this->frame );
}*/

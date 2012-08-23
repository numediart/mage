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

#pragma once 

namespace MAGE 
{
	
	const unsigned int nOfDers = 3;		// # of derivations: ∆( 0 ), ∆( 1 ), ∆( 3 )
	const unsigned int nOfMGCs = 35;	// # of MGC coefficients for the MLSA filter
	const unsigned int nOfLF0s = 1;		// fundamental frequency is a single value
	const unsigned int nOfLPFs = 31;	// # of low-pass filter coefficients
	
	const unsigned int nOfStates  = 5;	// # of states in the HMM
	const unsigned int nOfStreams = 3;	// # of streams : mgcs, lf0, lpf
	
	const unsigned int nOfLookup = 1;	// # of looked-up labels
										// # of backed-up labels( models in modelqueue actually )
										// this is the number of labels/models already used that 
										// we keep in memory for smoother parameters computation
	const unsigned int nOfBackup = 2; 
	
	const int maxWindowWidth = 50;
	const int maxNumOfFrames = 512;		// maximum # of frames per phoneme

	// --- Queues ---
	const int maxLabelQueueLen = 512; // max amount of labels that can wait
	const int maxFrameQueueLen = 200; // longest label 1 sec = 200 frames of 5 smsec
	const int maxModelQueueLen = nOfLookup + nOfBackup + 2; // max stored past models for generation
	
	// --- Vocoder ---
	const double defaultAlpha = 0.55;
	const int defaultFrameRate = 240;
	const int defaultInterpFrameRate = 1;
	const int defaultSamplingRate = 48000;
	const int defaultPadeOrder = 5;
	
	const int mgcStreamIndex = 0;
	const int lf0StreamIndex = 1;
	const int lpfStreamIndex = 2;
	
	const int overwrite = 0;
	const int shift		= 1;
	const int scale		= 2;
	const int synthetic	= 3;
	
	// configuration files
	const int maxNumOfArguments = 100;
	
	// max sting lenght
	const int maxStrLen = 1024;

} // namespace	


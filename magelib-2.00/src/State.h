 /* ----------------------------------------------------------------------------------------------- */
 /* 																								*/
 /* 	This file is part of MAGE / pHTS( the performative HMM-based speech synthesis system )		*/
 /* 																								*/
 /* 	MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms		*/
 /* 	of the GNU General Public License as published by the Free Software Foundation, either		*/
 /* 	version 3 of the license, or any later version.												*/
 /* 																								*/
 /* 	MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;	*/	
 /* 	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	*/
 /* 	See the GNU General Public License for more details.										*/
 /* 																								*/	
 /* 	You should have received a copy of the GNU General Public License along with MAGE / pHTS.	*/ 
 /* 	If not, see http://www.gnu.org/licenses/													*/
 /* 																								*/
 /* 																								*/	
 /* 	Copyright 2011 University of Mons :															*/
 /* 																								*/	
 /* 			Numediart Institute for New Media Art( www.numediart.org )							*/
 /* 			Acapela Group ( www.acapela-group.com )												*/
 /* 																								*/
 /* 																								*/
 /* 	 Developed by :																				*/
 /* 																								*/
 /* 		Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit	*/
 /* 																								*/
 /* ----------------------------------------------------------------------------------------------- */

#pragma once

#include "Distribution.h"
#include "MSDistribution.h"
#include "Constants.h"

namespace MAGE 
{
	/** 
	 *  \brief     Definition of the HMMs.
	 *  \details   This struct is used to define every state of the HMMs used. Here it contains the duration and distributions used in every state of HMM.
	 *
	 *  \authors    Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, Nicolas d'Alessandro, Thierry Dutoit
	 *
	 *  \version   2.00 beta
	 *  \date      2011 - 2012
	 *  \copyright 
	 *				Numediart Institute for New Media Art ( www.numediart.org )	\n
	 *				Acapela Group ( www.acapela-group.com )						\n
	 *				GNU Public License (see the licence in the file).
	 */	
	struct State 
	{
		/** 
		 *	\var int duration.
		 *	\brief It contains the duration of every state of a given HMM.
		 */
		int duration;
	
// global variances switch

		/** 
		 *	\var bool mgc_gv_switch.
		 *	\brief It contains the global variance flag of the spectral stream for every state of a given HMM.
		 */
		bool mgc_gv_switch;
		
		/** 
		 *	\var bool lf0_gv_switch.
		 *	\brief It contains the global variance flag of the fundamental frequency stream for every state of a given HMM.
		 */
		bool lf0_gv_switch;
		
		/** 
		 *	\var bool lpf_gv_switch.
		 *	\brief It contains the global variance flag of the low-pass filtering stream for every state of a given HMM.
		 */
		bool lpf_gv_switch;
	
// parameters loaded from trees
		
		/** 
		 *	\var Distribution mgc.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the spectral stream for every state of a given HMM.
		 */
		Distribution mgc[nOfDers * nOfMGCs];
		
		/** 
		 *	\var MSDistribution lf0.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the fundamental frequency stream for every state of a given HMM.
		 */
		MSDistribution lf0[nOfDers * nOfLF0s];
		
		/** 
		 *	\var Distribution lpf.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the low-pass filtering stream for every state of a given HMM.
		 */
		Distribution lpf[nOfDers * nOfLPFs];
	
// global variances
		
		/** 
		 *	\var Distribution gv_mgc.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the global variance of the spectral stream for every state of a given HMM.
		 */
		Distribution gv_mgc[nOfDers * nOfMGCs];
		
		/** 
		 *	\var Distribution gv_lf0.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the global variance of the fundamental frequency stream for every state of a given HMM.
		 */
		Distribution gv_lf0[nOfDers * nOfLF0s];
		
		/** 
		 *	\var Distribution gv_lpf.
		 *	\brief It contains the gaussian distribution (including static and dynamic features) 
		 *			of the global variance of the low-pass filtering stream for every state of a given HMM.
		 */
		Distribution gv_lpf[nOfDers * nOfLPFs];
	};
} // namespace

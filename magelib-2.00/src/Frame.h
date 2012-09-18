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

#include "Constants.h"

namespace MAGE 
{
	/** 
	 *  \brief     Definition of a synthesis frame.
	 *  \details   This struct is used to define every frame used for the synthesis of the output.
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
	struct Frame 
	{
		/** 
		 *	\var double mgc.
		 *	\brief It contains the spectral coefficients (including only the static features) that will be used for the synthesis
		 */
		double mgc[nOfMGCs];

		/** 
		 *	\var double lpf.
		 *	\brief It contains the low-pass filter coefficients (including only the static features) that will be used for the synthesis.
		 */
		double lpf[nOfLPFs];
		
		/** 
		 *	\var double f0.
		 *	\brief It contains the fundamental frequency that will be used for the synthesis.
		 */
		double f0;
		
		/** 
		 *	\var bool voiced.
		 *	\brief It contains the flag determining if the given frame is voiced or unvoiced.
		 */
		bool voiced;
	};
} // namespace

# This is the main CMakeLists.txt for project MAGE
#
# Copyright UMons - 2011
#
# Written by alexis


#Project generalities
PROJECT(MAGE-2.00)

#CMake generalities
CMAKE_MINIMUM_REQUIRED (VERSION 2.6.2)

IF(COMMAND cmake_policy)
	IF(${CMAKE_VERSION} STRLESS "2.8.0")
		#AM: don't know which is the best, but must be < CMP0008 for cmake 2.6.0 and < CMP0012 for cmake 2.6.4
		cmake_policy(SET CMP0003 NEW) 
	ELSE()
		cmake_policy(SET CMP0014 NEW)
	ENDIF()
ENDIF()

#build options
OPTION(BUILD_SHARED_LIBS "Build Shared libraries" ON)
OPTION(USE_OPENFRAMEWORKS "Build openFrameworks-based apps" OFF)

# OS-SPECIFIC SUBPROJECTS COMPILATION for 64 bits (fix compilation problem on x64 platform). 
#TODO: check: there is some flag in cmake >= 2.8.9 for this)
IF(UNIX)
	SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
ENDIF()

# Build type (default is Release)
# NB: Release mode defines a macro NDEBUG and sets the optimization flag to -O3 (i.e. gcc -DNDEBUG -O3)
IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Release CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
ENDIF()

MESSAGE("Files will be built in ${PROJECT_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}")
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE})
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE})

#main paths
SET(MAGE_SRC_PATH "${CMAKE_SOURCE_DIR}/src")
SET(MAGE_EXTERNAL_LIBS_PATH "${CMAKE_SOURCE_DIR}/libs")
SET(MAGE_EXAMPLES_PATH "${CMAKE_SOURCE_DIR}/examples")
SET(MAGE_DOC_PATH "${CMAKE_SOURCE_DIR}/doc")
#paths to external libs
SET(MAGE_HTS_ENGINE_PATH "${MAGE_EXTERNAL_LIBS_PATH}/hts_engine-1.06")
SET(MAGE_PORTAUDIO_PATH "${MAGE_EXTERNAL_LIBS_PATH}/portaudio-0.19")
SET(MAGE_SPTK_PATH "${MAGE_EXTERNAL_LIBS_PATH}/sptk")
#magelib target name
SET(MAGE_LIB_NAME mage)

IF(USE_OPENFRAMEWORKS)
	# this sets the path to the openframeworks folder containing "addons", "apps", "examples", "libs," ... (actually only "libs" is used)
	IF(NOT OF_ROOT_PATH)
		# TODO find a way to install openframework in /usr/local/something 
		# and write FindOpenFrameworks.cmake to avoid this idiotic hardcoded path
		MESSAGE("*** Path to OpenFrameworks is undefined. Setting it to /opt/openframeworks.\r
*** You can change this either within 'ccmake .' or using 'cmake ../.. -DOF_ROOT_PATH=/path/to/openframeworks'")
		SET(OF_ROOT_PATH "/opt/openframeworks")
	ENDIF()
	IF(NOT OFXOSC_ROOT_PATH)
		# TODO find a way to install ofxosc in /usr/local/something 
		# and write FindOpenFrameworks.cmake to avoid this idiotic hardcoded path
		MESSAGE("*** Path to OfxOsc plugin is undefined. Setting it to /opt/ofxosc.\r
*** You can change this either within 'ccmake .' or using 'cmake ../.. -DOFXOSC_ROOT_PATH=/path/to/ofxosc'")
		SET(OFXOSC_ROOT_PATH "/opt/ofxosc")
	ENDIF()
	#specific flags for use with openFrameworks
	SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_REENTRANT -DOF_USING_GTK -DOF_USING_MPG123 -Wall -fexceptions -march=native -mtune=native -MMD -MP")
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_REENTRANT -DOF_USING_GTK -DOF_USING_MPG123 -Wall -fexceptions -march=native -mtune=native -MMD -MP")
ENDIF()

#build the libs
ADD_SUBDIRECTORY(${MAGE_EXTERNAL_LIBS_PATH})
ADD_SUBDIRECTORY(${MAGE_SRC_PATH})
#build the examples
ADD_SUBDIRECTORY(${MAGE_EXAMPLES_PATH})
#TODO automatic generation of doxy documentation
#ADD_SUBDIRECTORY(${MAGE_DOC_PATH})

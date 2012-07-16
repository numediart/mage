# This is the main CMakeLists.txt for project MAGE
#
# Copyright UMons - 2011
#
# Written by alexis


#Project generalities
PROJECT(APPS_ENTERFACE12)
SET(${CMAKE_PROJECT_NAME}_SRC enterface2012)

#CMake generalities
CMAKE_MINIMUM_REQUIRED (VERSION 2.6.2)

IF(COMMAND cmake_policy)
	IF(${CMAKE_VERSION} STRLESS "2.8.0")
		#AM: don't know which is the best, but must be < CMP0008 for cmake 2.6.0 and < CMP0012 for cmake 2.6.4
		cmake_policy(SET CMP0003 NEW) 
	ELSE()
		cmake_policy(SET CMP0015 NEW)
	ENDIF()
ENDIF()

#build options

MESSAGE("Files will be built in ${PROJECT_SOURCE_DIR}/bin")
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_REENTRANT -DOF_USING_GTK -DOF_USING_MPG123 -Wall -fexceptions -march=native -mtune=native -MMD -MP")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_REENTRANT -DOF_USING_GTK -DOF_USING_MPG123 -Wall -fexceptions -march=native -mtune=native -MMD -MP")


# OS-SPECIFIC SUBPROJECTS COMPILATION (AM: IIRC I put this because of a compilation "bug" on x64 platform)
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

#build the test
ADD_SUBDIRECTORY(${${CMAKE_PROJECT_NAME}_SRC})

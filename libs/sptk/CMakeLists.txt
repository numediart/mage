FILE(GLOB SRC ${SRC} *.c)
FILE(GLOB HDR ${HDR} *.h)

SET(SPTK_LIB_NAME ${MAGE_LIB_NAME}-sptk)

#force c++ compilation - needed for use of some C++ stuff
#(cmake doesn't detect C++, it just sees *.c files and deduces that it's C
SET(CMAKE_C_COMPILER ${CMAKE_CXX_COMPILER})

ADD_LIBRARY(${SPTK_LIB_NAME} ${SRC} ${HDR})
#force c++ linkage - needed for use of some C++ stuff
SET_TARGET_PROPERTIES(${SPTK_LIB_NAME} PROPERTIES LINKER_LANGUAGE CXX)
TARGET_LINK_LIBRARIES(${SPTK_LIB_NAME} m)


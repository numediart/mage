IF(USE_OPENFRAMEWORKS)
	#build the enterface 2012 apps
	ADD_SUBDIRECTORY(enterface12)
ENDIF()

#test file used for memory leak in magelib - use valgrind to run it
ADD_SUBDIRECTORY(memorytest)
#PureData object
ADD_SUBDIRECTORY(pd)


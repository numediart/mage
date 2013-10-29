IF(USE_OPENFRAMEWORKS)
	#build the enterface 2012 apps
	ADD_SUBDIRECTORY(ofAlphaControl)
	ADD_SUBDIRECTORY(ofOscControl)
	ADD_SUBDIRECTORY(ofPitchControl)
	ADD_SUBDIRECTORY(ofSpeedControl)
	ADD_SUBDIRECTORY(ofStateDurationControl)
	ADD_SUBDIRECTORY(ofVolumeControl)
ENDIF()

#test file used for memory leak in magelib - use valgrind to run it
ADD_SUBDIRECTORY(memorytest)
#PureData object
ADD_SUBDIRECTORY(puredata)
# pHTSbatch: generating a testing example as a waveform
ADD_SUBDIRECTORY(pHTSbatch)

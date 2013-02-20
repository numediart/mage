# ----------------------- LINUX -----------------------
# linux only for now, maybe it could work on OSX with appropriate suffix change ?
#NB make sure that libmage, libmage-htsengine and libmage-sptk are in pd path (in /usr/local/lib for instance or in the same folder as mage~.pd_linux)
#TODO :: switch this into a CMakeLists.txt :: DONE - keeping the file for debug
pd_linux: mage~.pd_linux

.SUFFIXES: .pd_linux

LINUXCFLAGS = -DPD -O2 -funroll-loops -fomit-frame-pointer \
    -Wall -W -Werror \
    -Wno-unused -Wno-parentheses -Wno-switch -fPIC

INCLUDEPATHS = -I../../src -I../../libs/hts_engine-1.06 -I../../libs/sptk/ -I../../libs/portaudio-0.19/

.cpp.pd_linux:
	g++ $(LINUXCFLAGS) $(INCLUDEPATHS) -o $*.o -c $*.cpp
	g++ -rdynamic -shared -o $*.pd_linux $*.o -lc -lm -pthread -lmage
	#strip --strip-unneeded $*.pd_linux
	rm $*.o

clean:
	rm *.pd_linux

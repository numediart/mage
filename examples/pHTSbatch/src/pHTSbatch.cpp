//
// Copyright 2013 by Idiap Research Institute, http://www.idiap.ch
//
// See the file COPYING for the licence associated with this software.
//
// Author(s):
//   Milos Cernak, October 2013
//

/**
 *   @file    main.cpp
 *   @author  A. Moinet
 *   @brief   This application runs all the step of speech
 *            synthesis linearly. If run in valgrind, it
 *            shows the memory leaks (if any). Cannot use
 *            testApp because OF and audio are full of crap
 *
 *   @command run script mem-test.sh (adapt paths as needed)
 */

#include <cstdlib>
#include <string>
#include <cstring>
#include <fstream>
#include <queue>
#include "mage.h"

using namespace MAGE;
using namespace std;

queue<string> parsefile(string filename) {
  queue<string> labellist;
  string line;
  ifstream myfile(filename.c_str());

  if (!myfile.is_open()) {
    printf("could not open file %s", filename.c_str());
    return labellist;
  }

  for (int k = 0; getline(myfile, line); k++) {
    labellist.push(line);
  }
  myfile.close();
  return labellist;
}

void fillLabelQueue(MAGE::Mage *mage, string s)
{
  MAGE::Label label;
  queue<string> labellist;

  labellist = parsefile( s );

  while( !labellist.empty() ) {
    string q = labellist.front();
    label.setQuery( q );
    labellist.pop();
    mage->pushLabel( label );
  }
}

int main(int argc, char **argv) {

  MAGE::Mage *mage = new MAGE::Mage( "slt", argc, argv );
  MAGE::Frame *frame;

  int bufSize = 240; // 5ms window with 48k sampling frequency
  float *outbuffer;
  outbuffer = new float[bufSize];
  FILE * pFile;
  const char * fName = "synthesis.raw";
  pFile = fopen (fName, "wb");

  string s( argv[argc - 1] );
  printf("MAGE timestamp : %s\n",mage->timestamp().c_str());

  // load labels
  fillLabelQueue( mage, s );

  // process label by label
  while( !mage->getLabelQueue()->isEmpty()) {
    mage->run();
    while( !mage->getFrameQueue()->isEmpty() ) {
      frame = mage->getFrameQueue()->get();
      mage->getVocoder()->push( frame );
      mage->getFrameQueue()->pop();
      for( int k = 0; k < bufSize; k++ ) {
    	  outbuffer[k] = mage->popSamples();
          //float temp = outbuffer[k];
          //fwrite(&temp, sizeof(float), 1, pFile);
      }
	  fwrite(outbuffer,sizeof(float),bufSize,pFile);
    }
  }
  printf("Done, generated %s\n",fName);

  fclose (pFile);

  delete mage;
  delete[] outbuffer;

  return 0;
}


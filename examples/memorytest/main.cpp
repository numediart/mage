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
// --- QUEUE THINGS ---
const int labelQueueLen = 256; // max amount of labels that can wait
const int modelQueueLen = nOfLookup + nOfBackup + 2; // max stored past models for generation
const int frameQueueLen = 200; // longest label 1 sec = 200 frames of 5 smsec

void optimizeParameters(MAGE::Engine *engine, MAGE::Model *model1, MAGE::Model *model2);

using namespace MAGE;

std::queue<std::string> parsefile(std::string filename) {
	std::queue<std::string> labellist;
	std::string line;
	std::ifstream myfile(filename.c_str());

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
	std::queue<std::string> labellist;
	
	labellist = parsefile( s );

	while( !labellist.empty() )
	{
		string q = labellist.front();
		label.setQuery( q );
				
		labellist.pop();
		
		mage->pushLabel( label );
	}
}

void mage_interpolation( MAGE::Mage *mage, string speaker, double weight )
{
	string s(speaker);

	double interpolationWeights[nOfStreams + 1];
	map < string, double * > interpolationFunctions;

	for( unsigned int i = 0; i < nOfStreams + 1; i++ ) 
	{
		interpolationWeights[i] = (double) weight;
	}

	interpolationFunctions[s] = interpolationWeights;

	mage->setInterpolationFunctions( interpolationFunctions );	

	return;
}

int main(int argc, char **argv) {
	MAGE::Mage *mage = new MAGE::Mage( "slt", argc, argv );
	/*mage->addEngine( "slt2",argc,argv );
	mage->addEngine( "slt2",argc,argv );
	mage->addEngine( "slt3",argc,argv );
	mage->removeEngine( "slt3" );*/
	
	mage->addEngine( "slt", "./data/slt.conf" );
	mage->addEngine( "awb", "./data/awb.conf" );
	mage->enableInterpolation(true);
	string s( argv[argc - 1] );
	
	printf("MAGE timestamp : %s\n",mage->timestamp().c_str());
	
	int bufSize = 128;
	MAGE::Frame *frame;
	float *outbuffer;
	outbuffer = new float[bufSize];
	
	fillLabelQueue( mage, s );
	
	int count = 0, fc = 0;
	
	while( !mage->getLabelQueue()->isEmpty() && count < 4 ) 
	{
		printf("count: %d\n", count++);
		mage->run();
		fc = 0;
		while( !mage->getFrameQueue()->isEmpty() )
		{
			printf("frame: %d\n", fc++);
			//frameQueue->pop(&frame);
			frame = mage->getFrameQueue()->get();
			mage->getVocoder()->push( frame );
			mage->getFrameQueue()->pop();
			
			for( int k = 0; k < bufSize; k++ )
			{
				if( mage->getVocoder()->ready() )
					outbuffer[k] = 0.5 * mage->getVocoder()->pop() / 32768;
			}
			
			if (count == 20)
			{
				printf("change interpolation weights\n");
				double weight = 0.2;
				mage_interpolation(mage, "slt", weight);
				mage_interpolation(mage, "awb", 1-weight);
			}
			count ++;
		}
	}
	
	delete mage;
	delete[] outbuffer;
	
	return 0;
}

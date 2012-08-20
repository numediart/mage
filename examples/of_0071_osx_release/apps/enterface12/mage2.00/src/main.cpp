#include "ofAppGlutWindow.h"
#include "testApp.h"

int main( int argc, char **argv )
{	
	ofAppGlutWindow window; // create a window
	ofSetupOpenGL( &window, 800, 600, OF_WINDOW );
	ofRunApp( new testApp( argc, argv ) ); // app
}

#include "darts.h"
//Please view struct in darts.h



struct PolarCoordinates kartToPolar(int x, int y){
	struct PolarCoordinates polarcoords; 
	
	//distance to the origin in cartesian coordinate system
	polarcoords.distance = sqrt(pow(x,2) + pow(y, 2));	
	
	//angle in polar coordinate system
	polarcoords.angle = atan2f(y, x);
	//convert to degrees
	polarcoords.angle = (polarcoords.angle * 180) / M_PI;
			
		
	if(polarcoords.angle < 0) {
		polarcoords.angle += 360;
	}
	

	return polarcoords;
}

int absToRelCoords(struct coord *c){
	
	c -> x -= (SCREEN_WIDTH / 2);
	c -> y -= (SCREEN_HEIGHT / 2);
	c -> y *= -1;

	return 0;
}


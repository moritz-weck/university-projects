#include "darts.h"

const int DARTBOARD_SIZE = 220;


	
	
struct player_score *new_player(void){
	struct player_score *player;
	player = malloc(sizeof *player);
	if (player == NULL) perror("malloc"); //Dealing with errors

	
	printf("new Player made\n");

	player -> aufnahmen = 0; //Values of the player get updated
	player -> current_score = POINTS_NEEDED;
	player -> average = 0;
	player -> tons = 0;
	player -> fortytons = 0;
	player -> eightytons = 0;
	player -> darts = 3;
	return player;
}

int tell_score(struct player_score *player){ return(player -> current_score); }


int update_score(bool *doubleout, struct player_score *player, int first_throw, int second_throw, int third_throw){
	if (player -> current_score > (first_throw + second_throw + third_throw) + 1){ //The player only gains points, if he has not bust his score.
		player -> current_score -= (first_throw + second_throw + third_throw);		
	}

	if ((player -> current_score == (first_throw + second_throw + third_throw)) && (*doubleout == true)){ //The player can only finish the game, if his last dart is in a double
		player -> current_score -= (first_throw + second_throw + third_throw);		
	}

	player -> aufnahmen ++;
	if((first_throw + second_throw + third_throw) >= 100) player -> tons ++; //The players stats get updated, if he has scored at least 100 points.
	if((first_throw + second_throw + third_throw) >= 140) player -> fortytons ++; //The players stats get updated, if he has scored at least 140 points.
	if((first_throw + second_throw + third_throw) >= 180) player -> eightytons ++; //The players stats get updated, if he has scored 180 points.
	player -> average = ((501 - player -> current_score) / player -> aufnahmen); //The average of the players gets calculated.

	return(player -> current_score);

}


int coordsToPoints(bool *doubleout, struct PolarCoordinates *c){
	int segmentPoints;
	float angle = c -> angle;
	float distance = c -> distance;
	

	float db = DARTBOARD_SIZE / 25;
	float sb = db +  DARTBOARD_SIZE / 15;
	float little = sb + DARTBOARD_SIZE / 2;
	float triple = little + DARTBOARD_SIZE / 18;
	float big = triple + (DARTBOARD_SIZE / 3)-2;
	float d_double = big + (DARTBOARD_SIZE /18)+2; 



	if (angle < 9) segmentPoints = 6;
	else if (angle < 27) segmentPoints = 13;
	else if (angle < 45) segmentPoints = 4;
	else if (angle < 63) segmentPoints = 18;
	else if (angle < 81) segmentPoints = 1;
	else if (angle < 99) segmentPoints = 20;
	else if (angle < 117) segmentPoints = 5;
	else if (angle < 135) segmentPoints = 12;
	else if (angle < 153) segmentPoints = 9;
	else if (angle < 171) segmentPoints = 14;
	else if (angle < 189) segmentPoints = 11;  
	else if (angle < 207) segmentPoints = 8; 
	else if (angle < 225) segmentPoints = 16; 
	else if (angle < 243) segmentPoints = 7; 
	else if (angle < 261) segmentPoints = 19;
	else if(angle < 279) segmentPoints = 3;
	else if (angle < 297) segmentPoints = 17;
	else if (angle < 315) segmentPoints = 2; 
	else if (angle < 333) segmentPoints = 15;
	else if(angle < 351) segmentPoints= 10; 
	else segmentPoints = 6;

	if (distance < db) {
		*doubleout = true;
		return 50; }
	else if (distance < sb) {
		*doubleout = false;
		return 25; }
	else if (distance < little) {
		*doubleout = false;
		return(segmentPoints); }
	else if (distance < triple) {
		*doubleout = false;	
		return(segmentPoints * 3); }
	else if (distance < big) {
		*doubleout = false; 
		return(segmentPoints); }
	else if (distance < d_double){
		*doubleout = true;
		return(segmentPoints * 2); } 
	else return 0;


}

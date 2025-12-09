#include "darts.h"



int start_game(int move_speed, SDL_Renderer *renderer, SDL_Texture *texture){

  

	player1 = new_player(); 
	player2 = new_player();
	startScreen(renderer);
	player1 -> darts = 0;
	player2 -> darts = 0;

	while ((player1 -> current_score != 0) && (player2 -> current_score != 0)){
		
		
		printf("\nPlayer 1 turn: 	score: %d\n", player1 -> current_score);	
		players_turn(move_speed, player1, renderer, texture);

		printf("\nPlayer 1 finished turn\n	SCORE: %d\nvistis: %d\n",
		player1 -> current_score, player1 -> aufnahmen);

		if (player1 -> current_score == 0){
			printf("Player 1 won with %d visits!. Congrats!!! \n", player1 -> aufnahmen );
			endScreen(renderer, player1);
			return 0;
		}

		printf("\nPlayer 2 turn: 		score: %d\n", player2 -> current_score);

		players_turn(move_speed, player2, renderer, texture);
		
		if (player2 -> current_score == 0){
                            printf("Player 2 won with %d visits!. Congrats!!! \n", player2 -> aufnahmen );
                            endScreen(renderer, player2);
			    return 0;
                    }

		printf("\n");

		printf("\nPlayer 2 finished turn\n      SCORE: %d\nvisits: %d\n",
                player2 -> current_score, player2 -> aufnahmen);
	}
	return 1;
}

int players_turn(int move_speed, struct player_score *player, SDL_Renderer *renderer, SDL_Texture *texture){
	int first_throw = 0, second_throw = 0, third_throw = 0;
	bool doubleout; 

	player -> darts = 3;
	
		
	first_throw = throw(move_speed, player, &doubleout, renderer, texture);
	if (player -> current_score > first_throw + 1){
		player -> current_score -= first_throw;
		second_throw = throw(move_speed, player, &doubleout, renderer, texture);
	} else if (player -> current_score == first_throw){
		return(update_score(&doubleout, player, first_throw, 0, 0));
	} else {
		return(tell_score(player));
	}


	if (player -> current_score > second_throw + 1){
		player -> current_score -= second_throw;
		third_throw = throw(move_speed, player, &doubleout, renderer, texture);
	} else if (player -> current_score == second_throw){
		if((first_throw + second_throw + third_throw) >= 100) player -> tons ++; //The players stats get updated, if he has scored at least 100 points.
		return(update_score(&doubleout, player, 0, second_throw, 0));
	} else return(update_score(&doubleout, player, -(first_throw), 0, 0)); //If the player busts, his previous points get added again.


	if (player -> current_score >= third_throw){
		if((first_throw + second_throw + third_throw) >= 100) player -> tons ++; //The players stats get updated, if he has scored at least 100 points.
		if((first_throw + second_throw + third_throw) >= 140) player -> fortytons ++; //The players stats get updated, if he has scored at least 140 points.
		if((first_throw + second_throw + third_throw) >= 180) player -> eightytons ++; //The players stats get updated, if he has scored at 180 points.
		return(update_score(&doubleout, player, 0, 0, third_throw));
	} else return(update_score(&doubleout, player, -(first_throw), -(second_throw), 0)); //If the player busts, his previous points get added again.

}

int throw(int move_speed, struct player_score *player, bool *doubleout, SDL_Renderer *renderer, SDL_Texture *texture){

	struct coord coords  = aim(move_speed, renderer, texture, SCREEN_WIDTH, SCREEN_HEIGHT);
        absToRelCoords(&coords);
        struct PolarCoordinates pols = kartToPolar(coords.x, coords.y);
    
        int points = coordsToPoints(doubleout, &pols);
        printf("%d\n", points);
	

		player -> darts --;
	return points;
}

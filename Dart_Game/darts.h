#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>
#include <SDL_error.h>
#include <SDL_image.h>
#include <SDL_render.h>
#include <SDL_video.h>
#include <unistd.h>
#include <SDL_ttf.h>



//main.c
int main(int argc, char *argv[]);
enum screen {SCREEN_WIDTH = 720, SCREEN_HEIGHT = 720};
extern TTF_Font *font;


// checkout
char* checkout (int rest, int darts);

//score.c
enum points {POINTS_NEEDED = 501};

struct player_score *new_player(void);
extern struct player_score* player1;
extern struct player_score* player2; 
int tell_score(struct player_score *player);
int update_score(bool *doubleout, struct player_score *player, int first_throw, int second_throw, int third_throw);
struct player_score {
	int aufnahmen;
	int current_score;
	int average;
	int tons;
	int fortytons;
	int eightytons;
	int darts;
	char *name;
};

//window.c
struct coord{
	int x;
	int y;
};


void createWindow(int SCREEN_WIDTH, int SCREEN_HEIGHT, SDL_Window** window, SDL_Renderer** renderer, SDL_Texture** texture);
void startScreen(SDL_Renderer *renderer);
struct coord aim(int move_speed, SDL_Renderer *renderer, SDL_Texture *img, int SCREEN_WIDTH, int SCREEN_HEIGHT);
void oscillate(int move_speed, SDL_Rect *rect, int axis, int *direction, int SCREEN_WIDTH, int SCREEN_HEIGHT);
void delay(void);
SDL_Texture *writeToScreen(SDL_Renderer *renderer, char *text);
void endScreen(SDL_Renderer *renderer, struct player_score *player);


//kartToPolar 
struct PolarCoordinates kartToPolar(int x, int y);
//Struct for the kartTopolar function
struct PolarCoordinates{
	float angle; 
	float distance;
 
};
int absToRelCoords(struct coord *c);


int coordsToPoints(bool *doubleout, struct PolarCoordinates *c);
 //the radius of the dart board


//gamecontrol.c
int start_game(int move_speed, SDL_Renderer *renderer, SDL_Texture *texture);
int players_turn(int move_speed, struct player_score *player, SDL_Renderer *renderer, SDL_Texture *texture);
int throw(int move_speed, struct player_score *player, bool *doubleout, SDL_Renderer *renderer, SDL_Texture *texture);





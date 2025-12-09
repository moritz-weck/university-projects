//Using SDL and standard IO
#include "darts.h"


TTF_Font *font;


int main(int argc, char *argv[])
{
  int move_speed;

  if (argc > 1) {
	  move_speed = atoi(argv[1]);
	} else {
	  move_speed = 5;
	}

  if (move_speed > 14) move_speed = 15;
  else if (move_speed < 1) move_speed = 1;
		
    //The window we'll be rendering to
    SDL_Window *window;
    SDL_Renderer *renderer;
    //The surface contained by the window
    SDL_Texture* texture;
 

    createWindow(SCREEN_WIDTH, SCREEN_HEIGHT, &window, &renderer, &texture);

    
  

    start_game(move_speed, renderer, texture);
    TTF_CloseFont(font);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}



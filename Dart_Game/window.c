//Using SDL and standard IO
#include "darts.h"

struct player_score* player1;
struct player_score* player2; 


//Function for creating window
void createWindow(int SCREEN_WIDTH, int SCREEN_HEIGHT, SDL_Window** window, SDL_Renderer** renderer, SDL_Texture** texture){
    //Initialize SDL
    if( SDL_Init( SDL_INIT_VIDEO ) < 0 )
    {
        printf( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
    }
    if(TTF_Init() < 0) {
        printf("%s\n", SDL_GetError());
    }
    font = TTF_OpenFont("arcadeclassic.ttf", 72);
    if(!font){
        printf("%s\n", SDL_GetError());
    }
    else{
        //Create window
        *window = SDL_CreateWindow( "Darts", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
        if( *window == NULL )
        {
            printf( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
        }

        else
        {
            *renderer = SDL_CreateRenderer(*window,-1, SDL_RENDERER_PRESENTVSYNC);
            //Update the surface
            int flags = IMG_INIT_PNG | IMG_INIT_JPG;
            if ((IMG_Init(flags) != flags)) {
                SDL_Log(
                "SDL_Image konnte nicht initialisiert werden! SDL_image Error: %s\n",
                IMG_GetError());
            }

            *texture = IMG_LoadTexture(*renderer, "dartboard-23938_960_720.png");
            if(texture == NULL){
                printf("%s", SDL_GetError());
            }
        }
    }
}
void startScreen(SDL_Renderer *renderer){
    SDL_Event event;
    SDL_Rect top_rect = {.x=160, .y=160, .w=400, .h=200};
    SDL_Rect bottom_rect = {.x=210, .y=350, .w=300, .h=100};
    SDL_Texture *top_field = writeToScreen(renderer, "Welcome     To      Darts!");
    SDL_Texture *bottom_field = writeToScreen(renderer, "Press       Any     Key     To      Continue");
    char *player1_name = malloc(30 *sizeof(char));
    char *player2_name = malloc(30 *sizeof(char));
    player1_name[0] = '\0';
    player2_name[0] = '\0';
    bool current_screen = true;
    while(current_screen){
        while(SDL_PollEvent(&event) != 0){
            switch(event.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_KEYDOWN:
                    current_screen = false;
                    break;
            }
        }
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, top_field, NULL, &top_rect);
        SDL_RenderCopy(renderer, bottom_field, NULL, &bottom_rect);
        SDL_RenderPresent(renderer);
        delay();
    }
    current_screen = true;
    top_field = writeToScreen(renderer, "Name      Spieler     1");
    //Input name player 1
    while(current_screen){
        bottom_field = writeToScreen(renderer, player1_name);
        while(SDL_PollEvent(&event) != 0){
            switch(event.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_TEXTINPUT:
                    strcat(player1_name, event.text.text);
                    break;
                case SDL_KEYDOWN:
                    if(event.key.keysym.sym == SDLK_RETURN){
                        current_screen = false;   
                    }
                    break;
            }
        }
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, top_field, NULL, &top_rect);
        SDL_RenderCopy(renderer, bottom_field, NULL, &bottom_rect);
        SDL_RenderPresent(renderer);
        delay();
    }
    player1->name = player1_name;
    //Input name player 2
    current_screen = true;
    top_field = writeToScreen(renderer, "Name      Spieler     2");
    while(current_screen){
        bottom_field = writeToScreen(renderer, player2_name);
        while(SDL_PollEvent(&event) != 0){
            switch(event.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_TEXTINPUT:
                    strcat(player2_name, event.text.text);
                    break;
                case SDL_KEYDOWN:
                    if(event.key.keysym.sym == SDLK_RETURN){
                        current_screen = false;   
                    }
                    break;
            }
        }
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, top_field, NULL, &top_rect);
        SDL_RenderCopy(renderer, bottom_field, NULL, &bottom_rect);
        SDL_RenderPresent(renderer);
        delay();
    }
    player2->name = player2_name;
}
//function to aim
struct coord aim(int move_speed, SDL_Renderer *renderer, SDL_Texture *texture, int SCREEN_WIDTH, int SCREEN_HEIGHT){
    struct coord coords;

    
    SDL_Rect player1score = {.x=40, .y=50, .w=120, .h = 60};
    SDL_Rect player2score = {.x=(SCREEN_WIDTH-160), .y=50, .w=120, .h = 60};
    SDL_Rect player1darts = {.x=40, .y=90, .w=120, .h = 60};
    SDL_Rect player2darts = {.x=(SCREEN_WIDTH-160), .y=90, .w=120, .h = 60};
    SDL_Rect player1checkout = {.x=40, .y=630, .w=120, .h = 60};
    SDL_Rect player2checkout = {.x=(SCREEN_WIDTH-160), .y=630, .w=120, .h = 60};
    char *score1 = malloc(30 * sizeof(char));
    	if (score1 == NULL) perror("Malloc");
    char *score2 = malloc(30 * sizeof(char));
    	if (score2 == NULL) perror("Malloc");
    char *darts1 = malloc(30 * sizeof(char));
    	if (darts1 == NULL) perror("Malloc");
    char *darts2 = malloc(30 * sizeof(char));
    	if (darts2 == NULL) perror("Malloc");
    char *checkout1 = malloc(30 * sizeof(char));
    	if (checkout1 == NULL) perror("Malloc");
    char *checkout2 = malloc(30 * sizeof(char));
    	if (checkout2 == NULL) perror("Malloc");
    SDL_Event e;
    const int xBias = 3;
	const int yBias =  3;
    SDL_Rect rect1 = {.x = 0, .y = 0, .w = 2, .h = SCREEN_HEIGHT};
    int direction = 1;
    bool aiming = true;
    SDL_Rect dartscheibe = {.x = ((SCREEN_WIDTH-600)/2)+xBias, .y = ((SCREEN_HEIGHT-600)/2)+yBias, .w = 600+xBias, .h = 600+yBias};
    //now aims horizontally
    while(aiming){
        sprintf(darts1, "Darts %d", player1->darts);
        sprintf(darts2, "Darts %d", player2->darts);
        sprintf(score1, "%s   %d", player1->name, player1->current_score);
        sprintf(score2, "%s   %d", player2->name,player2->current_score);
        sprintf(checkout1, "%s", checkout(player1->current_score, player1->darts));
        sprintf(checkout2, "%s", checkout(player2->current_score, player2->darts));
        SDL_Texture *player1scoreleft = writeToScreen(renderer, score1);
        SDL_Texture *player2scoreleft = writeToScreen(renderer, score2);
        SDL_Texture *player1dartsleft = writeToScreen(renderer, darts1);
        SDL_Texture *player2dartsleft = writeToScreen(renderer, darts2);
        SDL_Texture *player1checkleft = writeToScreen(renderer, checkout1);
        SDL_Texture *player2checkleft = writeToScreen(renderer, checkout2);
        while(SDL_PollEvent(&e) != 0){
            switch(e.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_KEYDOWN:
                    coords.x = rect1.x;
                    aiming = false;
                    break;
            }
        }
        delay();
        //Rendering
        oscillate(move_speed, &rect1, 0, &direction, SCREEN_WIDTH, SCREEN_HEIGHT);
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, texture, NULL, &dartscheibe);
        SDL_RenderCopy(renderer, player1scoreleft, NULL, &player1score);
        SDL_RenderCopy(renderer, player2scoreleft, NULL, &player2score);
        SDL_RenderCopy(renderer, player1dartsleft, NULL, &player1darts);
        SDL_RenderCopy(renderer, player2dartsleft, NULL, &player2darts);
        SDL_RenderCopy(renderer, player1checkleft, NULL, &player1checkout);
        SDL_RenderCopy(renderer, player2checkleft, NULL, &player2checkout);
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_RenderFillRect(renderer, &rect1);
        SDL_RenderPresent(renderer);
    }
    SDL_Rect rect2 = {.x = 0, .y = 0, .w = SCREEN_WIDTH, .h = 2};
    direction = 1;
    aiming = true;
    
    while(aiming){
        sprintf(darts1, "Darts %d", player1->darts);
        sprintf(darts2, "Darts %d", player2->darts);
        sprintf(score1, "%s   %d", player1->name, player1->current_score);
        sprintf(score2, "%s   %d", player2->name,player2->current_score);
        sprintf(checkout1, "%s", checkout(player1->current_score, player1->darts));
        sprintf(checkout2, "%s", checkout(player2->current_score, player2->darts));
        SDL_Texture *player1scoreleft = writeToScreen(renderer, score1);
        SDL_Texture *player2scoreleft = writeToScreen(renderer, score2);
        SDL_Texture *player1dartsleft = writeToScreen(renderer, darts1);
        SDL_Texture *player2dartsleft = writeToScreen(renderer, darts2);
        SDL_Texture *player1checkleft = writeToScreen(renderer, checkout1);
        SDL_Texture *player2checkleft = writeToScreen(renderer, checkout2);
        while(SDL_PollEvent(&e) != 0){
            switch(e.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_KEYDOWN:
                    while(SDL_WaitEvent(&e)){
                        if(e.type == SDL_KEYDOWN){
                            break;
                        }
                    }
                    coords.y = rect2.y;
                    aiming = false;
                    break;
            }
        }
        delay();
        //move rectangle
        oscillate(move_speed, &rect2, 1, &direction, SCREEN_WIDTH, SCREEN_HEIGHT);
        //backgrund
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 0);
        SDL_RenderClear(renderer);
        
        //render textrue/image
        SDL_RenderCopy(renderer, texture, NULL, &dartscheibe);
        SDL_RenderCopy(renderer, player1scoreleft, NULL, &player1score);
        SDL_RenderCopy(renderer, player2scoreleft, NULL, &player2score);
        SDL_RenderCopy(renderer, player1dartsleft, NULL, &player1darts);
        SDL_RenderCopy(renderer, player2dartsleft, NULL, &player2darts);
        SDL_RenderCopy(renderer, player1checkleft, NULL, &player1checkout);
        SDL_RenderCopy(renderer, player2checkleft, NULL, &player2checkout);
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        
        //create crosshair
        SDL_RenderFillRect(renderer, &rect1);
        SDL_RenderFillRect(renderer, &rect2);
        SDL_RenderPresent(renderer);
    }
    return coords;
}

//function to aim, makes a rectangle move between the borders
//axis: 0 for horizontal movement, 1 for vertical movement
//direction: 1 for right/down, 0 for left/up
void oscillate(int move_speed, SDL_Rect *rect, int axis, int *direction, int SCREEN_WIDTH, int SCREEN_HEIGHT){
    if(axis == 0){
        switch(*direction){
            case 1:
                if(rect->x >= (SCREEN_WIDTH-rect->w)){
                    //turn around if reached border on the right
                    *direction = -1;
                    rect->x -= move_speed ;
                }
                else{
                    rect->x += move_speed ;
                    
                }
                break;
            case -1:
                if(rect->x <= 0){
                    //turn around if reached border on the left
                    *direction = 1 ;
                    rect->x += move_speed ;
                }
                else{
                    rect->x -= move_speed ;
                }
                break;
        }
    }
    else{
        switch(*direction){
            case 1:
                //turn around if reached boarder on the bottom
                if(rect->y >= (SCREEN_HEIGHT-rect->h)){
                    *direction = -1 ;
                    rect->y -= move_speed ; 
                }
                else{
                    rect->y += move_speed ;
                }
                break;
            case -1:
                //turn around if reached border on top
                if(rect->y <= rect->h){
                    *direction = 1 ;
                    rect->y += move_speed ;
                }
                else{
                    rect->y -= move_speed ;
                }
                break;
        }
    }
}
//delays, to not render unneicessarily much
void delay(void){
    int FPS = 60;
    int delay = 1000 / FPS;
    int time;
    int start;

    start = SDL_GetTicks();

    // how much time has past
    time = SDL_GetTicks() - start;

    //wait until next frame
    if(delay > time)
    {
        SDL_Delay(delay - time);
    }
}

SDL_Texture *writeToScreen(SDL_Renderer *renderer, char *input){
    SDL_Color foreground = { 0, 0, 0 , 0};
    SDL_Surface* text_surf = TTF_RenderText_Solid(font, input, foreground);
	SDL_Texture* text_texture = SDL_CreateTextureFromSurface(renderer, text_surf);
    return text_texture;
}

void endScreen(SDL_Renderer *renderer, struct player_score *player){
    SDL_Event event;
    SDL_Rect top_rect = {.x=100, .y=20, .w=520, .h=200};
    SDL_Rect Aufnahmenanzeige = {.x=210, .y=200, .w=300, .h=100};
    SDL_Rect Averageanzeige = {.x=210, .y=300, .w=300, .h=100};
    SDL_Rect Tonsanzeige = {.x=210, .y=400, .w=300, .h=100};
    SDL_Rect Fortytonsanzeige = {.x=210, .y=500, .w=300, .h=100};
    SDL_Rect Eightytonsanzeige = {.x=210, .y=600, .w=300, .h=100};

    char *winner = malloc(50 * sizeof(char));
    	if (winner == NULL) {perror("Malloc"); abort();}

    char *aufnahmencount = malloc(50 * sizeof(char));
	if (aufnahmencount == NULL) {perror("Malloc"); abort();}

    char *averagecount = malloc(50 * sizeof(char));
	if (averagecount == NULL) {perror("Malloc"); abort();}

    char *tonscount = malloc(50 * sizeof(char));
	if (tonscount == NULL) {perror("Malloc"); abort();}

    char *fortytonscount = malloc(50 * sizeof(char));
	if (fortytonscount == NULL) {perror("Malloc"); abort();}

    char *eightytonscount = malloc(50 * sizeof(char));
	if (eightytonscount == NULL) {perror("Malloc"); abort();}


    sprintf(winner, "%s hat gewonnen!", player->name);
    sprintf(aufnahmencount, "%d  Aufnahmen  %d", player1 -> aufnahmen, player2 -> aufnahmen);
    sprintf(averagecount, "%d  Average  %d", player1 -> average, player2 -> average);
    sprintf(tonscount, "%d  100  %d", player1 -> tons, player2 -> tons);
    sprintf(fortytonscount, "%d  140  %d", player1 -> fortytons, player2 -> fortytons);
    sprintf(eightytonscount, "%d  180  %d", player1 -> eightytons, player2 -> eightytons);
    SDL_Texture *top_field = writeToScreen(renderer, winner);
    SDL_Texture *bottom_field = writeToScreen(renderer, aufnahmencount);
    SDL_Texture *average_field = writeToScreen(renderer, averagecount);
    SDL_Texture *tons_field = writeToScreen(renderer, tonscount);
    SDL_Texture *fortytons_field = writeToScreen(renderer, fortytonscount);
    SDL_Texture *eightytons_field = writeToScreen(renderer, eightytonscount);
    

    bool current_screen = true;
       while(current_screen){
        while(SDL_PollEvent(&event) != 0){
            switch(event.type){
                case SDL_QUIT:
                    exit(0);
                case SDL_KEYDOWN:
                    current_screen = false;
		    free(winner);
		    free(aufnahmencount);
                    break;
            }
        }
        SDL_SetRenderDrawColor(renderer, 0xA9, 0xA9, 0xA9, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, top_field, NULL, &top_rect);
        SDL_RenderCopy(renderer, bottom_field, NULL, &Aufnahmenanzeige);
        SDL_RenderCopy(renderer, average_field, NULL, &Averageanzeige);
        SDL_RenderCopy(renderer, tons_field, NULL, &Tonsanzeige);
        SDL_RenderCopy(renderer, fortytons_field, NULL, &Fortytonsanzeige);
        SDL_RenderCopy(renderer, eightytons_field, NULL, &Eightytonsanzeige);
        SDL_RenderPresent(renderer);
        delay();
    }

    free(winner);
    free(aufnahmencount);
    free(averagecount);
    free(tonscount);
    free(fortytonscount);
    free(eightytonscount);
    
}

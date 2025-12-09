CC=gcc
CFLAGS= -Wall -Wextra -pedantic $(shell pkg-config --cflags sdl2 SDL2_image SDL2_ttf) 
CPFLAGS=-MMD -MF $*.d
LDFLAGS=$(shell pkg-config --libs sdl2 SDL2_image SDL2_ttf) -lm
OBJS = main.o window.o score.o checkout.o kartTopolar.o gamecontroll.o 

all: main

main: $(OBJS) darts.h
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<
clean:
	@$(RM) -v main *.o *.d

.PHONY: all clean

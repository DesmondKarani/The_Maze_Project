#OBJS specifies which files to compile as part of the project
OBJS = src/*.c

#CC specifies which compiler we're using
CC = gcc

#COMPILER_FLAGS specifies the additional compilation options we're using
COMPILER_FLAGS = -Wall -Werror -Wextra -pedantic

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = -lmingw32 -lSDL2main -lSDL2 -lm  # Add -lm here if it's for general use
LINUX_LINKER_FLAGS = $(shell sdl2-config --libs) -lm

#OBJ_NAME specifies the name of our executable
OBJ_NAME = maze

#This is the target that compiles our executable
all : $(OBJS)
	$(CC) $(OBJS) $(shell sdl2-config --cflags) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

#Linux SDL compiling
linux : $(OBJS)
	 $(CC) $(OBJS) $(shell sdl2-config --cflags) $(COMPILER_FLAGS) $(LINUX_LINKER_FLAGS) -DLINUX -o $(OBJ_NAME)

#Linux SDL installation
linux_install :
	sudo apt-get update
	sudo apt-get install libsdl2-dev

#MAC SDL compiling
mac : $(OBJS)
	$(CC) $(OBJS) $(shell sdl2-config --cflags) $(COMPILER_FLAGS) $(shell sdl2-config --libs) -DMAC -o $(OBJ_NAME)


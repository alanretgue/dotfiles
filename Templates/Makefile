CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 -fsanitize=address -g
LDFLAGS = -fsanitize=address

SRC = ${filter-out src/main.c, ${wildcard src/*.c}}
OBJ = ${patsubst %.c, %.o, ${SRC}}

all: main

main: ${OBJ} src/main.o
	${CC} ${LDFLAGS} $^ -o exe

clean:
	${RM} -rf ${OBJ} src/main.o

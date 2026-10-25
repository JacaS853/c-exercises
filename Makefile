CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11

all: calc

calc: main.o mathutil.o
	$(CC) $(CFLAGS) -o calc main.o mathutil.o

main.o: main.c mathutil.h
	$(CC) $(CFLAGS) -c main.c

mathutil.o: mathutil.c mathutil.h
	$(CC) $(CFLAGS) -c mathutil.c
	
clean:
	rm -f *.o *.1 *.s calc

.PHONY: all clean
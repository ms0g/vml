CC=clang
ASM=nasm
OUT=test
OBJS=test.o vecm.o 
CFLAGS=-O3 -march=native -Wall -Werror -std=gnu11 -g
AFLAGS=-fmacho64

all: clean $(OUT)

$(OUT): $(OBJS)
	$(CC) $^ -o $@ 

test.o: test.c
	$(CC) $(CFLAGS) -c $<

vecm.o: vecm.asm
	$(ASM) $(AFLAGS) $<

clean:
	rm -f  $(OUT) $(OBJS)
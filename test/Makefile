CC=clang
OUT=main
SRC=main.c
OBJS=main.o
LIB=vml.so
CFLAGS=-O3 -march=native -Wall -Werror -std=gnu11 -g

all: $(OUT)

$(OUT): $(OBJS)
	$(CC) $^ -o $@ $(LIB)

$(OBJS): $(SRC)
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f  $(OUT) $(OBJS) $(LIB)
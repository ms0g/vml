CC=clang
ASM=nasm
OBJS=./build/vml/vml.s.o
AFLAGS=-fmacho64
OS := $(shell uname -s)

ifeq ($(OS), Darwin)
    CFLAGS := -dynamiclib
	LIB = libvml.dylib
endif
ifeq ($(OS), Linux)        
    CFLAGS := -shared
	LIB = libvml.so
endif

all: ./bin/$(LIB)

./bin/$(LIB): ./build/vml/vml.s.o
	$(CC) ./build/vml/vml.s.o $(CFLAGS) -o ./bin/$(LIB)

./build/vml/vml.s.o: ./src/vml.s
	$(ASM) $(AFLAGS) ./src/vml.s -o ./build/vml/vml.s.o

clean:
	rm -rf ./bin/*
	rm -rf $(OBJS)

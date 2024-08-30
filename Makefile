CC=clang
ASM=nasm
OBJS=./build/vml/vml.s.o
OS := $(shell uname -s)

ifeq ($(OS), Darwin)
    CFLAGS := -dynamiclib
	AFLAGS := -fmacho64
	LIB := libvml.dylib
else ifeq ($(OS), Linux)        
    CFLAGS := -shared
	AFLAGS := -felf64
	LIB := libvml.so
endif

all: ./bin/$(LIB)

./bin/$(LIB): ./build/vml/vml.s.o
	$(CC) ./build/vml/vml.s.o $(CFLAGS) -o ./bin/$(LIB)

./build/vml/vml.s.o: ./src/vml.s
	$(ASM) $(AFLAGS) ./src/vml.s -o ./build/vml/vml.s.o

clean:
	rm -rf ./bin/*
	rm -rf $(OBJS)

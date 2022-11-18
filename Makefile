CC=clang
ASM=nasm
OUT=vml.so
SRC=src/vml.asm
OBJS=src/vml.o 
CCFLAGS=-shared
AFLAGS=-fmacho64

all: $(OUT)

$(OBJS): $(SRC)
	$(ASM) $(AFLAGS) $<

$(OUT): $(OBJS)
	$(CC) $^ -o $@ $(CCFLAGS)

clean:
	rm -f  $(OUT) $(OBJS)
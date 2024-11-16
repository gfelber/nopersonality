CC = gcc
CFLAGS = -Os -s -nostartfiles -no-pie -static -fno-builtin
LDFLAGS = -Wl,-Tlinker.ld 
NAME = nopersonality

all:
	$(CC) $(CFLAGS) ./$(NAME).S $(LDFLAGS) -o ./$(NAME)
	strip --strip-section-headers ./$(NAME)

clean:
	rm -rf $(NAME)

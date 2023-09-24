build: clean
	nasm -f elf64 nopersonality.nasm -o nopersonality.o 
	ld -Ttext=0x400100 nopersonality.o -o nopersonality --strip-all

clean:
	rm nopersonality.o || true

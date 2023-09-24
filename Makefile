build: clean
	nasm -f elf64 nopersonality.nasm -o nopersonality.o 
	ld -Ttext=0x4000b0 -znosectionheader --strip-all nopersonality.o -o nopersonality

clean:
	rm nopersonality.o || true

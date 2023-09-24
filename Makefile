build: setup
	nasm -f elf64 nopersonality.nasm -o ./dist/nopersonality.o 
	ld -Ttext=0x4000b0 -znosectionheader --strip-all ./dist/nopersonality.o -o ./dist/nopersonality

x86: setup
	nasm -f bin nopersonalityx86.nasm -o ./dist/nopersonalityx86
	chmod +x ./dist/nopersonalityx86

setup: clean
	mkdir dist

clean:
	rm -r dist || true

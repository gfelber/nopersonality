# nopersonality
low profile wrapper (<256B) to disable ASLR with `ADDR_NO_RANDOMIZE`

usage:
```
./nopersonality BINARY [ARGS...]
```

Note current environment is included.

## Requirements
+ nasm
+ ld
+ make

## build
`make`

## Exit Codes:
1. execve failed
2. no BINARY specified 
3. personality `ADDR_NO_RANDOMIZE` failed (docker disables by default)

.intel_syntax noprefix
.section .text
.globl _start

#include <sys/syscall.h>

#define ADDR_NO_RANDOMIZE 0x0040000

_start:
    # get number of arguments
    pop rbx # argc
    cmp rbx, 2
    jge  MAIN
    mov rdi, 2      # status code 2
    jmp EXIT
    

MAIN: 
    # Set personality to ADDR_NO_RANDOMIZE
    mov rax, SYS_personality
    mov rdi, ADDR_NO_RANDOMIZE
    syscall
    push 3
    pop rdi          # exit code
    cmp rax, 0
    jl EXIT

    pop rax             # remove the binary name
    # Execute the specified binary using execve
    mov rax, SYS_execve
    lea rsi, [rsp]
    pop rdi
    lea rdx, qword [rsp + 8*rbx - 0x10]  # envs
    syscall

    mov rdi, 1      # status code 1

EXIT:
    # Exit
    mov rax, 60       # EXIT SYSCALL
    syscall


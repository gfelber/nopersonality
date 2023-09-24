section .text
  global _start

_start:
    ; get number of arguments
    mov r12, [rsp]  ; argc
    cmp r12, 2
    jge  MAIN
    mov rdi, 2      ; status code 2
    jmp EXIT
    

MAIN: 
    ; Set personality to ADDR_NO_RANDOMIZE
    mov rax, 0x87       ; PERSONALITY SYSCALL
    mov rdi, 0x0040000  ; ADDR_NO_RANDOMIZE
    syscall
    mov rdi, 3          ; exit code
    cmp rax, 0
    jl EXIT

    ; Execute the specified binary using execve
    mov rax, 0x3b                 ; EXECVE SYSCALL
    mov rdi, qword [rsp + 0x10]   ; binary to call
    lea rsi, qword [rsp + 0x10]   ; argvs
    add r12, 3                  
    lea rdx, qword [rsp + 8*r12]  ; envs
    syscall

    mov rdi, 1      ; status code 1

EXIT:
    ; Exit
    mov rax, 60       ; EXIT SYSCALL
    syscall


global main

section .data
    msg db "salut", 10, 0

extern printf
section .text

main:
    push rbp
    mov rbp, rsp

    mov rdi, msg
    xor rax, rax
    call printf wrt ..plt

    mov rdi, msg
    xor rax, rax
    call printf wrt ..plt

.exit:
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall
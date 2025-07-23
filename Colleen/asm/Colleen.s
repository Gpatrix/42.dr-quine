global _start

section .data
    msg db "salut", 0

extern printf
section .text

_start:
    mov rdi, msg
    call printf wrt ..plt

.exit:
    mov rax, 60
    mov rdi, 0
    syscall
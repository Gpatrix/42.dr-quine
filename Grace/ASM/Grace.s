global main
extern dprintf

section .data
    file db "Grace_kid.s", 0
    format db "", 0
    O_FLAGS equ 1101o

section .text




main:
push rbx
sub rsp, 16


open:
    mov rax, 2
    mov rdi, file
    mov rsi, O_FLAGS
    mov rdx, 0777
    syscall

    cmp eax, 0
    jle .error

    mov [rbp+4], eax
    lea rsi, [rel format]
    lea rdx, [rel format]
    mov rcx, 10
    mov r8, 34
    xor rax, rax
    call dprintf wrt ..plt

    mov rax, 3
    movzx rdi, [rbp+4]
    syscall

    xor rax, rax
.error:
    mov rax, -1
.return:
        pop rsi
        ret ;haaaaaa

; The executable must be named Grace.
; •When executed, the program writes in a file named Grace_kid.c/Grace_kid.s the
; source code of the file used to compile the program.
; •The source code must strickly contain
; ◦No main declared.
; ◦Three defines only.
; ◦One comment.
; •The program will run by calling a macro.
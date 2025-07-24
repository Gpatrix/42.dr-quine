%define start_define global main
%define file_name "Grace_kid.s"
%define ZERO 0

start_define
extern dprintf

section .data
    file db file_name, ZERO
    format db "test", ZERO


%macro lets_go 1
    st:
        push rbx
        mov rbp, rsp

        sub rsp, 16

    .open:
        mov rax, 2
        lea rdi, [rel file]
        mov rsi, 0x241
        mov rdx, 0o644
        syscall

        cmp eax, 0
        jle .error

        mov [rbp-4], eax
        mov edi, eax
        lea rsi, [rel format]
        lea rdx, [rel format]
        mov rcx, 10
        mov r8, 34
        xor rax, rax
        call dprintf wrt ..plt

        mov rax, 3
        mov edi, DWORD [rbp-4]
        syscall
        mov rax, %1
        jmp .return

    .error:
        mov rax, 1
    .return:
        add rsp, 16
        pop rbx
        ret ;haaaaaa
%endmacro

section .text

main:
    lets_go(0)



; The executable must be named Grace.
; •When executed, the program writes in a file named Grace_kid.c/Grace_kid.s the
; source code of the file used to compile the program.
; •The source code must strickly contain
; ◦No main declared.
; ◦Three defines only.
; ◦One comment.
; •The program will run by calling a macro.
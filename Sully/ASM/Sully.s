global main
extern dprintf
extern sprintf
extern system

section .data
    file_name db "./Sully_X.s", 0
    file_obj db "./Sully_X.o", 0
    file_bin  db "./Sully_X", 0

section .rodata
    cmd db "nasm -f elf64 -o %2$s %3$s && gcc -o %1$s %2$s", 0
    format db "hi", 0

section .bss
    cmp_cmd resb 87

section .text

main:
    push rbx
    mov rbp, rsp
    sub rsp, 16
    mov dl, 5
    cmp dl, byte 0
    je .return
    mov [rbp-1], dl

.prepare_file_name:
    mov dl, byte [rbp-1]
    add dl, '0'
    lea rax, [rel file_name]
    mov [rax+8], dl
    lea rax, [rel file_obj]
    mov [rax+8], dl
    lea rax, [rel file_bin]
    mov [rax+8], dl

.prepare_cmd:
    lea rdi, [rel cmp_cmd]
    lea rsi, [rel cmd]
    lea rdx, [rel file_bin]
    lea rcx, [rel file_obj]
    lea r8, [rel file_name]
    call sprintf wrt ..plt

.open:
    mov rax, 2
    lea rdi, [rel file_name]
    mov rsi, 0x241
    mov rdx, 0o644
    syscall
    cmp eax, 0
    jle .error

.write:
    mov [rbp-5], eax
    mov edi, eax
    lea rsi, [rel format]
    lea rdx, [rel format]
    mov rcx, 10
    mov r8, 34
    mov r9, [rbp-1]
    dec r9
    xor rax, rax
    call dprintf wrt ..plt

.close:
    mov rax, 3
    mov edi, DWORD [rbp-5]
    syscall

.comp:
    lea rdi, [rel cmp_cmd]
    call system wrt ..plt

.exec:
    lea rdi, [rel file_bin]
    call system wrt ..plt

    xor rax, rax
    jmp .return

.error:
    mov rax, 0

.return:
    add rsp, 16
    pop rbx
    ret
global main
extern dprintf
extern sprintf

section .data
    file_name db "./Sully_X.s", 0
    file_exe  db "./Sully_X", 0
    format db "test", 0

section .text

main:
    push rbx
    mov rbp, rsp
    sub rsp, 16
    mov dl, 5
    add dl, '0'
    mov [rbp-1], dl

.prepare_file_name:
    mov dl, byte [rbp-1]
    lea rax, [rel file_name]
    mov [rax+8], dl
    lea rax, [rel file_exe]
    mov [rax+8], dl

.open:
    mov rax, 2
    lea rdi, [rel file_name]
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
    mov r9, [rbp-8]
    dec r9
    xor rax, rax
    call dprintf wrt ..plt

    mov rax, 3
    mov edi, DWORD [rbp-4]
    syscall

    xor rax, rax
    jmp .return

.error:
    mov rax, 0

.return:
    add rsp, 16
    pop rbx
    ret
global main
extern dprintf
extern sprintf
extern system

section .data
    file_name db "./Sully_X.s", 0
    file_exe  db "./Sully_X", 0

section .rodata
    cmd db "gcc -o %s %s", 0
    format db "int main(void){return 0;}", 0

section .bss
    final_cmd resb 30

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

.prepare_cmd:
    lea rdi, [rel final_cmd]
    lea rsi, [rel cmd]
    lea rdx, [rel file_exe]
    lea rcx, [rel file_name]
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

.close:
    mov rax, 3
    mov edi, DWORD [rbp-4]
    syscall

.comp:
    lea rdi, [rel final_cmd]
    call system wrt ..plt

.exec:
    lea rdi, [rel file_exe]
    call system wrt ..plt

    xor rax, rax
    jmp .return

.error:
    mov rax, 0

.return:
    add rsp, 16
    pop rbx
    ret
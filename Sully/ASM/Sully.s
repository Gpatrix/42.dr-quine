global main
extern dprintf
extern sprintf
extern system
section .data
file_name db "./Sully_X.s", 0
file_obj db "./Sully_X.o", 0
file_bin  db "./Sully_X", 0
section .rodata
cmd db "nasm -f elf64 -dQUINE=1 -o %2$s %3$s && gcc -o %1$s %2$s", 0
format db "global main%2$cextern dprintf%2$cextern sprintf%2$cextern system%2$csection .data%2$cfile_name db %3$c./Sully_X.s%3$c, 0%2$cfile_obj db %3$c./Sully_X.o%3$c, 0%2$cfile_bin  db %3$c./Sully_X%3$c, 0%2$csection .rodata%2$ccmd db %3$cnasm -f elf64 -dQUINE=1 -o %%2$s %%3$s && gcc -o %%1$s %%2$s%3$c, 0%2$cformat db %3$c%1$s%3$c, 0%2$csection .bss%2$ccmp_cmd resb 87%2$csection .text%2$cmain:%2$cpush rbx%2$cmov rbp, rsp%2$csub rsp, 16%2$cmov dl, %4$d%2$ccmp dl, byte 0%2$cjl .return%2$c%%ifndef QUINE%2$cadd dl, 1%2$c%%endif%2$cdec dl%2$cmov [rbp-1], dl%2$c.prepare_file_name:%2$cmov dl, byte [rbp-1]%2$cadd dl, '0'%2$clea rax, [rel file_name]%2$cmov [rax+8], dl%2$clea rax, [rel file_obj]%2$cmov [rax+8], dl%2$clea rax, [rel file_bin]%2$cmov [rax+8], dl%2$c.prepare_cmd:%2$clea rdi, [rel cmp_cmd]%2$clea rsi, [rel cmd]%2$clea rdx, [rel file_bin]%2$clea rcx, [rel file_obj]%2$clea r8, [rel file_name]%2$ccall sprintf wrt ..plt%2$c.open:%2$cmov rax, 2%2$clea rdi, [rel file_name]%2$cmov rsi, 0x241%2$cmov rdx, 0o644%2$csyscall%2$ccmp eax, 0%2$cjle .error%2$c.write:%2$cmov [rbp-5], eax%2$cmov edi, eax%2$clea rsi, [rel format]%2$clea rdx, [rel format]%2$cmov rcx, 10%2$cmov r8, 34%2$cmov r9, [rbp-1]%2$cxor rax, rax%2$ccall dprintf wrt ..plt%2$c.close:%2$cmov rax, 3%2$cmov edi, DWORD [rbp-5]%2$csyscall%2$c.comp:%2$clea rdi, [rel cmp_cmd]%2$ccall system wrt ..plt%2$c.exec:%2$clea rdi, [rel file_bin]%2$ccall system wrt ..plt%2$cxor rax, rax%2$cjmp .return%2$c.error:%2$cmov rax, 0%2$c.return:%2$cadd rsp, 16%2$cpop rbx%2$cret", 0
section .bss
cmp_cmd resb 87
section .text
main:
push rbx
mov rbp, rsp
sub rsp, 16
mov dl, 5
cmp dl, byte 0
jl .return
%ifndef QUINE
add dl, 1
%endif
dec dl
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
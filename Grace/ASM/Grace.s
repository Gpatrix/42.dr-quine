%define start_define global main
%define file_name "Grace_kid.s"
%define ZERO 0
start_define
extern dprintf
section .data
file db file_name, ZERO
format db "%%define start_define global main%2$c%%define file_name %3$cGrace_kid.s%3$c%2$c%%define ZERO 0%2$cstart_define%2$cextern dprintf%2$csection .data%2$cfile db file_name, ZERO%2$cformat db %3$c%1$s%3$c, ZERO%2$c%%macro lets_go 1%2$cst:%2$cpush rbx%2$cmov rbp, rsp%2$csub rsp, 16%2$c.open:%2$cmov rax, 2%2$clea rdi, [rel file]%2$cmov rsi, 0x241%2$cmov rdx, 0o644%2$csyscall%2$ccmp eax, 0%2$cjle .error%2$cmov [rbp-4], eax%2$cmov edi, eax%2$clea rsi, [rel format]%2$clea rdx, [rel format]%2$cmov rcx, 10%2$cmov r8, 34%2$cxor rax, rax%2$ccall dprintf wrt ..plt%2$cmov rax, 3%2$cmov edi, DWORD [rbp-4]%2$csyscall%2$cmov rax, %%1%2$cjmp .return%2$c.error:%2$cmov rax, 1%2$c.return:%2$cadd rsp, 16%2$cpop rbx%2$cret ;haaaaaa%2$c%%endmacro%2$csection .text%2$cmain:%2$clets_go(0)", ZERO
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
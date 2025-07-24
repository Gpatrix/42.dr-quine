%define start_define global main
%define file_name "Grace_kid.s"
%define ZERO 0
start_define
extern dprintf
section .data
file db file_name, ZERO
format db "%%define start_define global main%3$c%%define file_name %2$cGrace_kid.s%2$c%3$c%%define ZERO 0%3$cstart_define%3$cextern dprintf%3$csection .data%3$cfile db file_name, ZERO%3$cformat db %2$ctest%2$c, ZERO%3$c%%macro lets_go 1%3$cst:%3$cpush rbx%3$cmov rbp, rsp%3$csub rsp, 16%3$c.open:%3$cmov rax, 2%3$clea rdi, [rel file]%3$cmov rsi, 0x241%3$cmov rdx, 0o644%3$csyscall%3$ccmp eax, 0%3$cjle .error%3$cmov [rbp-4], eax%3$cmov edi, eax%3$clea rsi, [rel format]%3$clea rdx, [rel format]%3$cmov rcx, 10%3$cmov r8, 34%3$cxor rax, rax%3$ccall dprintf wrt ..plt%3$cmov rax, 3%3$cmov edi, DWORD [rbp-4]%3$csyscall%3$cmov rax, %1%3$cjmp .return%3$c.error:%3$cmov rax, 1%3$c.return:%3$cadd rsp, 16%3$cpop rbx%3$cret ;haaaaaa%3$c%%endmacro%3$csection .text%3$cmain:%3$clets_go(0)", ZERO
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
%include "io.inc"

%macro String 2
    %1: db %2,10,0
%endmacro

%macro write_string 1
    push %1
    call printf
    add esp,4
%endmacro

%macro Integer 1
    %1: times 4 db 0 ; 32-bits integer = 4 bytes
%endmacro

%macro Input_Integer 1
    %1: db "%d",0
%endmacro

%macro write_integer 2
    push %1
    push %2
    call printf
    add esp, 8
%endmacro

section .data
String msg, "Hello, world!"
String msg_input, "Entre um número"
Integer ivalue
Integer tmp
Input_Integer input_v
String msg_out, "A soma das entradas é: %d"

section .text
extern printf
extern scanf
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,0
    mov ebx, 0
   loop:
   ;Equivale ao while(ebx < 3)
    cmp ebx, 3
    je finished
    call get_input
    mov eax, [ivalue]
    imul eax,eax
    add [tmp],eax
    inc ebx
    jmp loop
   finished:
    mov ebx, [tmp]
    write_integer ebx, msg_out 
    ;call get_input
    ;mov eax, [ivalue]
    ret

get_input:
;As funções retornam seu valor em eax...
;Por isso estava quebrando ao tentar fazer a soma com base no eax e ter 
;retorno via ebx
    write_string msg_input
    push ivalue
    push input_v
    call scanf
    add esp, 8    
    ret
    

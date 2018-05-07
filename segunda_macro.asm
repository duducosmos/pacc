%include "io.inc"

%macro String 2
    %1: db %2,10,0
%endmacro

%macro Integer 2
    %1: dd %2
%endmacro

%macro write_string 1
    push %1
    call printf
    add esp,4
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

%macro read_integer 3
    write_string %1
    push %2
    push %3
    call scanf
    add esp, 8    
%endmacro

section .data
String msg, "Valor: %d"
Integer my_int, 23
Input_Integer input_v
String msg2, "Digite um numero"

section .text
global CMAIN
extern printf
extern scanf
CMAIN:
    mov ebp, esp; for correct debugging
    read_integer msg2, my_int, input_v
    mov ebx,[my_int]
    write_integer ebx, msg
    xor eax, eax
    ret
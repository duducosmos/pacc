%include "io.inc"

%macro imprimir_string 1
    push %1
    call printf
    add esp, 4
%endmacro

section .data
msg: db "Oi Mundo!",10,0
msg2: db "Bem-vindo ao treco",10,0
section .text
    extern scanf 
    extern printf
    global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    imprimir_string msg
    imprimir_string msg2
    ret
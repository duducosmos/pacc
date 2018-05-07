%include "io.inc"
SECTION .data
    introducao: db 'Programa para calculo de potencia',10,0
    msg1: db 'Digite um valor inteiro',10, 0
    msg2: db 'Digite a potencia inteira',10, 0
    msgresult: db "Valor de %d elevado a %d e %d",10,0
    formatin: db "%d", 0    
    valor: times 4 db 0 ; 32-bits integer = 4 bytes
    potc: times 4 db 0
    resultado: times 4 db 0     
section .text
global CMAIN
CMAIN:
    push introducao 
    call printf
    add esp,4
    
    push msg1 
    call printf
    add esp,4
    
    push valor
    push formatin
    call scanf
    add esp, 8
    
    push msg2 
    call printf
    add esp,4
    
    push potc
    push formatin
    call scanf
    add esp, 8
    
    call POTENCIA
    
    mov eax, [resultado]
    mov ebx, [potc]
    mov ecx, [valor]
    
    push eax
    push ebx    
    push ecx
    push msgresult 
    call printf
    add esp,16
    
    xor eax, eax
    ret
    
POTENCIA:
    mov ecx, [valor]
    mov eax, [valor]    
    mov ebx, 1    
    while:
        cmp ebx, [potc]
        je end_while 
        mul ecx
        inc ebx
        jmp while       
    end_while:
    
    mov [resultado], eax  
    ret
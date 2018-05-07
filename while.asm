%include "io.inc"
SECTION .data
    msg: db 'ebx = %d.',10, 0
 SECTION .text
   extern scanf 
   extern printf 
   global CMAIN
CMAIN:
    ;Inicializa ebx com 0;
    mov ebx, 0    
    while:
        ;Compara o valor de ebx com 20, 
        ;Se for igual a 20, va para o fim do while
        cmp ebx, 20
        je end_while  
        
        ;Exibe o valor de ebx na tela
        push ebx        
        push msg 
        call printf
        add esp,8
        
        ;Soma ebx com 1 ebx += 1        
        add ebx, 1
        ;Volta para o inicio do while        
        jmp while
    end_while:
    xor eax, eax
    ret
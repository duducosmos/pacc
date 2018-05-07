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
    dowhile:
        ;Exibe o valor de ebx na tela
        push ebx        
        push msg 
        call printf
        add esp,8
        
        ;Soma ebx com 1. ebx += 1        
        add ebx, 1
         
        ;Compara o valor de ebx com 20, 
        ;Se for igual a 20, va para o fim do dowhile
        cmp ebx, 20
        je end_dowhile  
        ;Volta para o inicio do dowhile      
        jmp dowhile
    end_dowhile:
    xor eax, eax
    ret
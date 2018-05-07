%include "io.inc"
SECTION .data
    msg: db 'Valor = %d, Posicao %d',10, 0
    DADOS: dd 100, 320, 400, 500
           dd 600, 700, 800, 900
    DADOSLEN: equ ($-DADOS) / 4
 SECTION .text
   extern scanf 
   extern printf 
   global CMAIN
CMAIN:
    ;Inicializa ebx com 0;
    ;ebx sera o contador for(int ebx=0; ebx < dados len; ebx++);
    mov ebx, 0    
    for_each:
        ;Compara o valor de ebx com DADOSLEN, 
        ;Se for igual a DADOSLEN, va para o fim do for_each
        cmp ebx, DADOSLEN
        je end_for_each 
        
        ;Pega o valor contido no vetor de dados                 
        mov eax,[DADOS+4*ebx]
        
        ;Exibe o valor do dado e da posicao na tela
        push ebx 
        push eax               
        push msg 
        call printf
        add esp,12
        
        ;Incrementa o ebx   
        inc ebx
        ;Volta para o inicio do for each        
        jmp for_each
    end_for_each:
    xor eax, eax
    ret
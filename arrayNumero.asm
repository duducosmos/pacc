SECTION .data
    TEXTO: db 'ABCDEFG'
    msglen:  equ $-TEXTO
    MSG: db ''
    formatout: db "%", 10, 0 
    FIM: db "FIM", 10, 0 
    DADOS: dd 100, 320, 400, 500
           dd 600, 700, 800, 900
    DADOSLEN: equ ($-DADOS) / 4
    formatoutint: db "%d", 10, 0
    number: dd 000
   
 SECTION .text
   global main 
   extern scanf 
   extern printf 
main:
   push ebx 
   push ecx
   
   mov ebx, 0
   LOOP:  
       mov eax,[DADOS+4*ebx]
           
       push eax
       push formatoutint
       call printf
       add esp, 8  
       
       inc ebx
       cmp ebx, DADOSLEN
       JL LOOP
   

   
   push FIM
   call printf
   add esp, 4 
   
   

                       
   pop ecx
   pop ebx 
   mov eax, 0 
   ret
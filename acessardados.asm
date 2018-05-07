SECTION .data
    TEXTO: db 'ABCDEFG'
    msglen:  equ $-TEXTO
    MSG: db ''
    formatout: db "%", 10, 0 
    FIM: db "FIM", 10, 0 
 SECTION .text
   global main 
   extern scanf 
   extern printf 
main:
   push ebx 
   push ecx
   
   mov ebx, TEXTO
   LOOP:
   
   
   mov al, [ebx]
   mov [MSG], al
   
   
   push MSG
   push formatout
   call printf
   add esp, 8 
   
   inc ebx
   cmp ebx, TEXTO + msglen  
   jb LOOP
   

   
   push FIM
   call printf
   add esp, 4 
   
   

                       
   pop ecx
   pop ebx 
   mov eax, 0 
   ret
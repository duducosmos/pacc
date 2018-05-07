%include "io.inc"
SECTION .data
    TEXTO: db 'ABCDEFG'
    MSG: db ''
    formatout: db "%", 10, 0 
 SECTION .text
   global main 
   extern scanf 
   extern printf 
main:
   push ebx 
   push ecx   
   mov ebx, TEXTO
   add ebx, 1
   inc ebx   
   mov al, [ebx]
   mov [MSG], al   
   push MSG
   push formatout
   call printf
   add esp, 8 


                       
   pop ecx
   pop ebx 
   mov eax, 0 
   ret
   
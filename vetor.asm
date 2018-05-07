%include "io.inc"
SECTION .data
    MEUVETOR: dd 100, 320, 400, 500
              dd 600, 700, 800, 900
    COMPRIMENTO_MEUVETOR: equ ($-MEUVETOR) / 4
    formatout: db "%d", 10, 0
section .text
global CMAIN
CMAIN:
   mov ebx, 0
   LOOP:  
       mov eax,[MEUVETOR+4*ebx]
       push eax
       push formatout
       call printf
       add esp, 8         
       inc ebx
       cmp ebx, COMPRIMENTO_MEUVETOR
       JL LOOP       
    ret
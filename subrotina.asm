%include "io.inc"
section .data
formatout: db "%d", 10, 0
section .text
global CMAIN
extern printf
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,5
    mov edx,2    
    call SOMA    
    push eax
    push formatout
    call printf
    add esp, 8
    ret
    
SOMA:
    mov eax,ecx
    add eax,edx
    ret
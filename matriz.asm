%include "io.inc"
SECTION .data
    MINHAMATRIZ: dd 100, 320, 400, 500
                 dd 600, 700, 800, 900
    MINHAMATRIZLIN: dd 2
    MINHAMATRIZCOL: dd 4
    formatout: db "%d", 10, 0
    formatoutlinha: db "%d ", 0
    NLINE: db "", 10, 0 
    
SECTION .text
    global main 
    extern scanf 
    extern printf 
main:
   mov esi, 0;linha 
    L1:
        mov edi, 0;coluna 
        L2:  
            mov ebx, esi      
            mov eax, [MINHAMATRIZCOL]         
            mul ebx             ; eax = eax*ebx
            add eax,edi            
            mov eax,[MINHAMATRIZ+4*eax]
                           
            push eax
            push formatoutlinha
            call printf
            add esp, 8 
            
            add edi,1
            cmp edi,[MINHAMATRIZCOL]
            jl L2  
                      
        push NLINE
        call printf
        add esp, 4
                 
        inc esi
        cmp esi,[MINHAMATRIZLIN]
        jl L1  
        
    push NLINE
    call printf
    add esp, 4  
    
    mov eax, 0 
    ret
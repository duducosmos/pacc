%include "io.inc"
%macro somavetor 3
    mov ebx,0
    mov ecx, %2    
    fldz ;st0 <- 0
    while:        
        fld dword [%1+4*ebx]
        fadd
        inc ebx
        cmp ebx, ecx
        jl while
    end_while:
    fstp qword [%3]
%endmacro

section .data
    tmp: dq 0.0
    soma: dd 0.0
    msg: db "soma = %e",10,0
    vetor:       dd		 7.36464646465
		dd		 0.930984158273
		dd		 10.6047098049
		dd		 14.3058722306
		dd		 15.2983812149
		dd		 -17.4394255035
		dd		 -17.8120975978
		dd		 -12.4885670266
		dd		 3.74178604342
		dd		 16.3611827165
		dd		 -9.1182728262
		dd		 -11.4055038727
		dd		 4.68148165048
		dd		 -9.66095817322
		dd		 5.54394454154
		dd		 13.4203706426
		dd		 18.2194407176
		dd		 -7.878340987
		dd		 -6.60045833452
		dd		 -7.98961850398
    N: equ ($-vetor)/4     
section .text
extern printf
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    somavetor vetor, N, tmp
    
    push dword [tmp+4]
    push dword [tmp]
    push dword msg
    call printf
    add esp,12
    
    xor eax, eax
    ret
    

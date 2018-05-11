%include "io.inc"
section .data
    a: dd 4.0
    b: dd 3.0
    c: dq 0.0
    msg: db "soma = %f",10,0
    msg2: db "raiz = %f",10,0
    msg3: db "multiplicacao = %f",10,0
    msg4: db "Divisao = %f",10,0
    
section .text
extern printf
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;Inicializando a FPU
    finit
    ;Colocando os valores de a e b na pilha
    ;para realizar operacoes de ponto flutuante
    fld dword [a]
    fld dword [b]
    ;somando os dois itens na pilha
    fadd
    ;armazenando a respota em c
    fstp qword [c]
    
    ;Colocando a parte L do dado em c na pilha
    push dword [c+4]
    ;Colocando a parte H do dado em c na pilha
    push dword [c]
    push dword msg
    call printf
    add esp,12
    
    
    finit
    fld dword [a]
    ;Calculando a raiz quadrada de a
    fsqrt
    fstp qword [c]
    
    
    push dword [c+4]
    push dword [c]
    push dword msg2
    call printf
    add esp,12
    
    finit
    fld dword [a]
    fld dword [b]
    ;realizando a multiplicacao de a com b
    fmul
    fstp qword [c]
    
    
    push dword [c+4]
    push dword [c]
    push dword msg3
    call printf
    add esp,12
    
    finit
    fld dword [a]
    fld dword [b]
    ;realizando a divisao de a por b
    fdiv
    fstp qword [c]
    
    
    push dword [c+4]
    push dword [c]
    push dword msg4
    call printf
    add esp,12
    
    
    
    xor eax, eax
    ret
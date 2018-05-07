%include "io.inc"
SECTION .data
    msg1: db 'Escolha um Número inteiro entre 0 e 5.',10, 0
    msgCerto: db "Parabéns, vc acertou",10,0
    msgErrado: db "Não foi dessa vez",10,0
    formatin: db "%d", 0
    usrinput: times 4 db 0 ; 32-bits integer = 4 bytes
 SECTION .text
   extern scanf 
   extern printf 
   global CMAIN
CMAIN:
    ;Pedindo que o usuário digite um numero
    push msg1
    call printf
    add esp, 4    
    ;Armazenando o número digitado na variável usrinput    
    push usrinput
    push formatin
    call scanf
    add esp, 8
    ;Acessando o valor da variável, para comparação    
    mov ebx, [usrinput]
    ;Comparando o valor da variável com o número 2    
    cmp ebx, 2
    ;Se o valor digitado pelo usuário for igual a dois, vá para o bloco if_block
    je if_block
    ;Casi a variável tenha valor diferente de 2, vá para o bloco else_block
    jmp else_block
    if_block:
        ;Se o usuário digitar 2, o bloco corrente será executado 
        ; e a mensagem armazenado em msgCerto será exibida
        push msgCerto
        call printf
        add esp, 4
        ;Como o bloco else_block não deve ser executado, fazemos um salto para o end_if        
        jmp end_if
        
    else_block:
        ;Caso o valor digitado pelo usuário seja diferente de 2, o bloco else_block será executado
        ; E a mensagem contida em msgErrado será exibida
        push msgErrado
        call printf
        add esp, 4
        ;Ao finalizar esse bloco, fazemos o salto para o end_if.
        jmp end_if        
    end_if:
        
        
    
    
    xor eax, eax
    ret
global main
extern printf, scanf

section .data
    scan_format: db "%f",0
    print_format: db "Result: %f",10,0

section .bss
    result_num: resb 4

section .text
main:
    push result_num
    push scan_format
    call scanf
    add esp, 8

    sub esp,8  ;reserve stack for a double in stack
    mov ebx,result_num
    fld dword [ebx]   ;load float
    fstp qword [esp]  ;store double (8087 does the conversion internally)
    push print_format
    call printf
    add esp, 12
    ret
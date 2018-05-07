SECTION .data
    message1: db "Digite um Numero: ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul terminator
    integer1: times 4 db 0 ; 32-bits integer = 4 bytes
    
 SECTION .text
   global main 
   extern scanf 
   extern printf 
main:

   push ebx ; save registers
   push ecx
   push message1
   call printf

   add esp, 4 ; remove parameters
   push integer1 ; address of integer1 (second parameter)
   push formatin ; arguments are right to left (first parameter)
   call scanf

   add esp, 8 ; remove parameters
   
   mov eax, 1
   mov ebx, dword [integer1]
   LOOP:
   mul ebx
   DEC ebx
   cmp ebx, 1
   JG LOOP
   
   push eax
   push formatout
   call printf                            ; call printf to display the sum
   add esp, 8                             ; remove parameters
   pop ecx
   pop ebx ; restore registers in reverse order
   mov eax, 0 ; no error
   ret
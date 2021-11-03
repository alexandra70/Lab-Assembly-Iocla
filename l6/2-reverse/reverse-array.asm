%include "../utils/printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx

    mov ecx, ARRAY_LEN

pus:
    push dword [input + ecx*4 - 4]
    loop pus

   mov ecx, ARRAY_LEN

tak:
    pop dword [output + 4*ecx - 4]
    loop tak

    xor ecx, ecx

print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret

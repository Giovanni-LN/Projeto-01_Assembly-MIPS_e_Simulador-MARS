# main.asm

.data
prompt_str1: .asciiz "Digite a primeira string: "
prompt_str2: .asciiz "Digite a segunda string: "
result_equal: .asciiz "As strings são iguais."
result_greater: .asciiz "A primeira string é MAIOR."
result_smaller: .asciiz "A primeira string é MENOR."

str1: .space 100   # Espaço para a primeira string
str2: .space 100   # Espaço para a segunda string

.text
.globl main

main:
    # Solicita ao usuário para digitar a primeira string
    li $v0, 4
    la $a0, prompt_str1
    syscall

    # Lê a primeira string do usuário
    li $v0, 8
    la $a0, str1
    li $a1, 100
    syscall

    # Solicita ao usuário para digitar a segunda string
    li $v0, 4
    la $a0, prompt_str2
    syscall

    # Lê a segunda string do usuário
    li $v0, 8
    la $a0, str2
    li $a1, 100
    syscall

    # Chama a função strcmp
    la $a0, str1
    la $a1, str2
    jal strcmp

    # Imprime o resultado
    beqz $v0, print_equal       # Se $v0 é zero, imprime "As strings são iguais."
    bgtz $v0, print_greater     # Se $v0 é positivo, imprime "A primeira string é maior."
    bltz $v0, print_smaller     # Se $v0 é negativo, imprime "A primeira string é menor."

print_equal:
    li $v0, 4
    la $a0, result_equal
    syscall
    j end_program

print_greater:
    li $v0, 4
    la $a0, result_greater
    syscall
    j end_program

print_smaller:
    li $v0, 4
    la $a0, result_smaller
    syscall

end_program:
    # Termina o programa
    li $v0, 10
    syscall
# Include da implementação da função strcmp
.include "strcmp.asm"

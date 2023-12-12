# main.asm

.data
prompt_str1: .asciiz "Digite a primeira string: "
prompt_str2: .asciiz "Digite a segunda string: "
prompt_num: .asciiz "Digite o número de caracteres a serem comparados: "
result_equal: .asciiz "As strings são iguais até o número especificado de caracteres."
result_different: .asciiz "As strings são diferentes até o número especificado de caracteres. \n"
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
    li $a1, 100
    la $a0, str1
    syscall

    # Solicita ao usuário para digitar a segunda string
    li $v0, 4
    la $a0, prompt_str2
    syscall

    # Lê a segunda string do usuário
    li $v0, 8
    li $a1, 100
    la $a0, str2
    syscall

    # Solicita ao usuário para digitar o número de caracteres a serem comparados
    li $v0, 4
    la $a0, prompt_num
    syscall

    # Lê o número de caracteres do usuário
    li $v0, 5
    syscall
    move $a2, $v0   # Armazena o número de caracteres em $a2

    # Chama a função strncmp
    la $a0, str1
    la $a1, str2
    jal strncmp
    move $a3, $v0
    # Imprime o resultado
    beqz $v0, print_equal       # Se $v0 é zero, imprime "As strings são iguais até o número especificado de caracteres."
    bnez $v0, print_different   # Se $v0 é não zero, imprime "As strings são diferentes até o número especificado de caracteres."

print_equal:
    li $v0, 4
    la $a0, result_equal
    syscall
    j end_program

print_different:    
    li $v0, 4
    la $a0, result_different
    syscall
    bgtz $a3, print_greater     # Se $v0 é positivo, imprime "A primeira string é maior."
    bltz $a3, print_smaller     # Se $v0 é negativo, imprime "A primeira string é menor."

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
    
# Include da implementação da função strncmp
.include "strncmp.asm"

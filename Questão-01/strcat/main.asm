# main.asm

.data
prompt_dest: .asciiz "Digite a string de destino: "
prompt_source: .asciiz "Digite a string de origem: "
result_concatenated: .asciiz "Strings concatenadas: "

destination: .space 100   # Espaço para a string de destino
source: .space 100        # Espaço para a string de origem

.text
.globl main



main:
    # Solicita ao usuário para digitar a string de destino
    li $v0, 4
    la $a0, prompt_dest
    syscall

    # Lê a string de destino do usuário
    li $v0, 8
    li $a1, 100
    la $a0, destination
    syscall

    # Solicita ao usuário para digitar a string de origem
    li $v0, 4
    la $a0, prompt_source
    syscall

    # Lê a string de origem do usuário
    li $v0, 8
    li $a1, 100
    la $a0, source
    syscall

    # Chama a função strcat
    la $a0, destination
    la $a1, source
    jal strcat

    # Imprime o resultado
    li $v0, 4
    la $a0, result_concatenated
    syscall

    # Imprime a string concatenada
    li $v0, 4
    la $a0, destination
    syscall

    # Termina o programa
    li $v0, 10
    syscall
# Include da implementação da função strcat
.include "strcat.asm"
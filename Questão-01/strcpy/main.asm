# Grupo : Giovanni Lima, Caio Fontes e Raphael Barbosa
# Atividade 1°VA - Projeto 01 - Assembly MIPS e Simulador MARS
# Arquitetura e Organização de Computadores 2023.1
# 1° Questão - Requisito "a"
# Arquivo main da função strcpy

# main.asm

.data
source: .asciiz "Hello, MIPS!"  # String de origem
destination: .space 20           # Espaço para a string de destino

.text
.globl main

main:
    # Carrega o endereço de memória do destino e origem
    la $a0, destination
    la $a1, source

    # Chama a função strcpy
    jal strcpy

    # Imprime o resultado
    li $v0, 4          # Chamada do sistema para imprimir string
    la $a0, destination # Carrega o endereço da string de destino
    syscall

    # Termina o programa
    li $v0, 10         # Chamada do sistema para encerrar o programa
    syscall
    
.include "strcpy.asm"

# main.asm

.data
source: .asciiz "MIPS memcpy test"  # String de origem
destination: .space 50               # Espaço para o destino

.text
.globl main
main:
    # Teste da função memcpy
    li $t0, 10         # Número de bytes a serem copiados
    la $a0, destination # Endereço de memória do destino
    la $a1, source      # Endereço de memória da origem
    move $a2, $t0       # Número de bytes a serem copiados

    # Chama a função memcpy
    jal memcpy

    # Imprime o resultado
    li $v0, 4           # Chamada do sistema para imprimir string
    la $a0, destination  # Carrega o endereço da string de destino
    syscall

    # Termina o programa
    li $v0, 10          # Chamada do sistema para encerrar o programa
    syscall
# Include da implementação da função memcpy
.include "memcpy.asm"

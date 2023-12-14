.data
buffer: .space 1        # Espaço para armazenar o caractere lido

.text
.globl main

main:
    li $t0, 0xffff0000  # Endereço do registrador Receiver Control (KEYBOARD)
    li $t1, 0xffff0004  # Endereço do registrador Receiver Data (KEYBOARD)
    li $t2, 0xffff0008  # Endereço do registrador Transmitter Control (DISPLAY)
    li $t3, 0xffff000c  # Endereço do registrador Transmitter Data (DISPLAY)

connect_to_mips:
    # Conecta ao MIPS
    li $v0, 44          # Código de sistema para conectar ao MIPS
    syscall

main_loop:
    # Leitura do teclado (KEYBOARD)
    lb $t4, 0($t0)      # Lê o registrador Receiver Control
    andi $t4, $t4, 0x1  # Isola o bit de pronto
    beqz $t4, main_loop # Se o bit de pronto for 0, continua no loop

    lb $t5, 0($t1)      # Lê o registrador Receiver Data

    # Impressão no display (DISPLAY)
    sb $t5, 0($t3)      # Escreve o caractere no registrador Transmitter Data
    li $t6, 0x1         # Prepara o bit de pronto no registrador Transmitter Control
    sb $t6, 0($t2)      # Ativa o bit de pronto no registrador Transmitter Control

    j main_loop         # Volta ao início do loop

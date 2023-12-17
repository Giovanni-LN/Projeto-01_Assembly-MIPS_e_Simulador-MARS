# Função memcpy em Assembly MIPS
# $a0: Endereço de memória do destino (destination)
# $a1: Endereço de memória da origem (source)
# $a2: Número de bytes a serem copiados (num)
# $v0: Valor de retorno (endereço de memória do destino)

.text
.globl memcpy

memcpy:
    # Salva o endereço de memória do destino para retorno
    move $v0, $a0

    # Loop para copiar bytes até atingir o número especificado
copy_loop:
    bnez $a2, continue_copy  # Se $a2 não é zero, continua a cópia

    # Se $a2 é zero, termina o loop
    jr $ra                  # Retorna ao endereço de chamada

continue_copy:
    lb $t0, 0($a1)           # Carrega o byte da origem em $t0
    sb $t0, 0($a0)           # Armazena o byte no destino

    addi $a0, $a0, 1         # Avança para o próximo byte no destino
    addi $a1, $a1, 1         # Avança para o próximo byte na origem
    addi $a2, $a2, -1        # Decrementa o contador de bytes a serem copiados
    j copy_loop              # Salta de volta para o início do loop

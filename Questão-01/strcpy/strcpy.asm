# Função strcpy em Assembly MIPS
# $a0: Endereço de memória do destino (destination)
# $a1: Endereço de memória da origem (source)
# $v0: Valor de retorno (endereço de memória do destino)

.text
.globl strcpy

strcpy:
    # Salva o endereço de memória do destino para retorno
    move $v0, $a0

    # Loop para copiar bytes até encontrar o caractere nulo ('\0')
copy_loop:
    lb $t0, 0($a1)        # Carrega o byte da origem em $t0
    sb $t0, 0($a0)        # Armazena o byte no destino

    beqz $t0, copy_done   # Se o byte for nulo, termina o loop

    addi $a0, $a0, 1      # Avança para o próximo byte no destino
    addi $a1, $a1, 1      # Avança para o próximo byte na origem
    j copy_loop           # Salta de volta para o início do loop

copy_done:
    jr $ra                # Retorna ao endereço de chamada

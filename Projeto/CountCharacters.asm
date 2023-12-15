# CountCharacters.asm

.text
.globl CountCharacters

CountCharacters:
    # $a0: Endereço do buffer
    # $v0: Número de caracteres no buffer

    # Inicializa o contador
    li $v0, 0

count_loop:
    lb $t1, 0($a0)     # Carrega o byte do buffer
    beqz $t1, count_done  # Se encontrou o caractere nulo, termina o loop

    addi $v0, $v0, 1    # Incrementa o contador de caracteres
    addi $a0, $a0, 1    # Avança para o próximo byte
    j count_loop

count_done:
    jr $ra


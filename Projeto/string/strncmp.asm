# Função strncmp em Assembly MIPS
# $a0: Endereço de memória da primeira string (str1)
# $a1: Endereço de memória da segunda string (str2)
# $a2: Número máximo de caracteres a serem comparados (num)
# $v0: Valor de retorno

.text
.globl strncmp

strncmp:
    # Loop para comparar caracteres até encontrar a diferença, caractere nulo ou num ser alcançado
compare_loop:
    # Carrega o byte da primeira string em $t0
    lb $t0, 0($a0)

    # Carrega o byte da segunda string em $t1
    lb $t1, 0($a1)

    # Compara os bytes
    bne $t0, $t1, compare_done   # Se os bytes são diferentes, termina o loop
    beqz $t0, compare_done      # Se o byte é nulo, as strings são iguais
    sub $a2, $a2, 1              # Decrementa num
    beqz $a2, compare_done       # Se num atingiu zero, termina o loop

    # Avança para o próximo byte nas duas strings
    addi $a0, $a0, 1
    addi $a1, $a1, 1
    
    j compare_loop               # Salta de volta para o início do loop

compare_done:
    # Se chegou aqui, as strings são iguais até num caracteres ou até o caractere nulo
    sub $v0, $t0, $t1   
    jr $ra                        # Retorna ao endereço de chamada    


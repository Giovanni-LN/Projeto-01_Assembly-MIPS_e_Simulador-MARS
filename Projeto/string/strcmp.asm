# Função strcmp em Assembly MIPS
# $a0: Endereço de memória da primeira string (str1)
# $a1: Endereço de memória da segunda string (str2)
# $v0: Valor de retorno

.text
.globl strcmp

strcmp:
    # Loop para comparar caracteres até encontrar a diferença ou caractere nulo
compare_loop:
    lb $t0, 0($a0)          # Carrega o byte da primeira string em $t0
    lb $t1, 0($a1)          # Carrega o byte da segunda string em $t1

    bne $t0, $t1, compare_done # Se os bytes são diferentes, termina o loop

    beqz $t0, strings_equal   # Se o byte é nulo, as strings são iguais

    addi $a0, $a0, 1          # Avança para o próximo byte na primeira string
    addi $a1, $a1, 1          # Avança para o próximo byte na segunda string
    j compare_loop            # Salta de volta para o início do loop

compare_done:
    # Calcula o valor de retorno
    sub $t0, $t0, $t1         # Subtrai os valores ASCII dos caracteres

strings_equal:
    move $v0, $t0
    jr $ra                    # Retorna ao endereço de chamada

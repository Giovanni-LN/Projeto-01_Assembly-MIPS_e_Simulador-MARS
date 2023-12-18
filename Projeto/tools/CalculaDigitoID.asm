.text
.globl CalculaDigitoID
CalculaDigitoID:
# Suponha que option_2 contenha a string "123456"
la $s0, option_2     # Endereço da string
li $t0, 0  # Inicializa o índice do dígito
li $t3, 2         

load_digit_loop:
    lb $t1, 0($s0)     # Carrega o próximo caractere
    beqz $t1, end_load_digit  # Se encontrar o terminador nulo, encerra o loop

    # Converte o caractere para número subtraindo o valor ASCII de '0'
    sub $t1, $t1, '0'

    # Realiza os cálculos
    mul $t1, $t1, $t3    
    add $t2, $t2, $t1
    
    addi $t3, $t3, 1 
    addi $s0, $s0, 1    # Avança para o próximo dígito
    
    j load_digit_loop

end_load_digit:
    # Realiza a operação final
    div $t2, $t2, 11
    mflo $t2            # Obtém o inteiro da divisão
    addi $t2, $t2, '0'  # Converte para ASCII

    # Concatena o resultado no final da string
    la $a0, option_2
    li $t0, 0
    concat_result_loop:
        lb $t1, 0($a0)
        beqz $t1, end_concat_result
        addi $a0, $a0, 1

    j concat_result_loop

end_concat_result:
    sb $t2, 0($a0)     # Coloca o resultado no final da string
jr $ra

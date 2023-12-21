.data 
    id_X: .asciiz "X" 

.text
.globl CalculaDigitoID
CalculaDigitoID: #calcula qual será o dígito de verificação

    la $s0, option_2     # Endereço da string
    li $t0, 0            # Inicializa o índice do dígito
    li $t3, 2    
    li $t2, 0 #zera o registrador onde vai ser armazenado o digito   

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
        li $t4, 11
        # Realiza a operação final
        div $t2, $t4
        mfhi $t2            # Obtém o resto inteiro da divisão
        

        # Verifica se o resto é 10
        li $t1, 10
        beq $t2, $t1, concatena_X  # Se for 10, pula para o código de 'X'
        j concatena_ID       
	
    concatena_X:
        # Concatena 'x' no final da string
        la $a0, option_2
        strlen_loop_X:
            lb $t1, 0($a0)
            beqz $t1, end_concat_result_X  # Se encontrar o terminador nulo, encerra o loop
            addi $a0, $a0, 1
            j strlen_loop_X

        end_concat_result_X:
            li $t1, 'x'
            sb $t1, 0($a0)     # Coloca 'x' no final da string
            j end_concat_result_id

concatena_ID:
    # Concatena o resultado no final da string
    addi $t2, $t2, '0'  # Converte para ASCII
    la $a0, option_2
    li $t0, 0
    concat_result_loop:
        lb $t1, 0($a0)
        beqz $t1, end_concat_result
        addi $a0, $a0, 1
    j concat_result_loop
	
end_concat_result:
    sb $t2, 0($a0)     # Coloca o resultado no final da string
end_concat_result_id:
        jr $ra

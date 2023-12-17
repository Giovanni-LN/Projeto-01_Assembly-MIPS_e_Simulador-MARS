.text
.globl ClearClientData

ClearClientData:
	# Limpar o espaço de dados clientData
	li $t0, 0          # Valor zero
	li $t1, 3200       # Tamanho do espaço de dados

	la $a0, clientData # Endereço inicial do espaço de dados
	loop_clear_data:
    	lb $t1, 0($a0)   # Carrega o byte atual
    	beqz $t1, end_clear_data  # Se o byte atual for nulo, saia do loop
    	sb $t0, 0($a0)   # Armazena zero na posição atual
    	addi $a0, $a0, 1  # Avança para a próxima posição
    	j loop_clear_data  # Continue o loop  
    	
jr $ra  
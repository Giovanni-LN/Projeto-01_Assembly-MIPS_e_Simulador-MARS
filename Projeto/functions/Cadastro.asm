.data
	abre_parenteses: .asciiz "("
	fecha_parenteses: .asciiz ")"
.text
.globl Cadastro
Cadastro:
#empilha o valor altual de #$ra
subi $sp, $sp, -4# necessário , pois quando uma função chama outra o registrador $ra é sobrescrito e perde o retorno original
sw $ra, 0($sp) #-4 é apenas uma convenção

#start_data_buffer:
	# Inserir '(' no início da string
	#la $t0, salve_data_buffer       # Endereço da string
	#li $t1, '('            # Caractere a ser inserido

	# Inserir o caractere no início
	#sb $t1, 0($t0)
		
	jal CalculaDigitoID
	
	# a partir daqui concatena todas as partes, que estão separadas(opcao_1,2,3), para no fim salvar em clientData
	la $a0, salve_data_buffer
	la $a1, option_1
	jal strcat
	
	la $a0, salve_data_buffer #buffer temporario
	la $a1, fecha_parenteses
	jal strcat
	#
	la $a0, salve_data_buffer
	la $a1, option_2
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, fecha_parenteses
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, option_3
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, fecha_parenteses
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, saldo_inicial
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, fatura_inicial
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, limite_credito_inicial
	jal strcat
	
	la $a0, salve_data_buffer
	la $a1, ponto_virgula
	jal strcat
	
	la $a0, clientData #armazena o buffer temporarios em clientData
	la $a1, salve_data_buffer
	jal strcat

	
lw $ra, 0($sp)
addi $sp, $sp, 4 
jr $ra	

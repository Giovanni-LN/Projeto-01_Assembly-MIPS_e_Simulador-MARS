.text
.globl GetComand
GetComand:
	# 1. Leitura da String de Entrada
	li $v0, 8            # código da syscall para ler string
	la $a0, buffer       # endereço do buffer
	li $a1, 128          # comprimento máximo da string
	syscall

    # 2. Identificação do Comando
    la $a0, buffer
    la $a1, cmd_buffer
    li $a2, 0

    command_loop:
        lb $t0, 0($a0) 
        beq $t0, 10, end_get_data 
        beqz $t0, command_not_found #quebra de linha
        beq $t0, '-', get_data_buffer
        
        sb $t0, 0($a1)
        addi $a1, $a1, 1
        sb $zero, 0($a1)
        
                  
        addi $a0, $a0, 1

        j command_loop  

get_data_buffer:
	la $a0, buffer
	la $a1, data_buffer			
	find_data_loop: #encontra o inicio dos dados do comando
		lb $t0, 0($a0)
		beq $t0, '-', start_data_loop	      
        	addi $a0, $a0, 1
        
	j find_data_loop	
	
        #salva os dados
        start_data_loop: 
              addi $a0, $a0, 1	
        data_loop:
        	lb $t0, 0($a0)
		beqz $t0, end_get_data  # Fim da string  
	
		sb $t0, 0($a1)
        	addi $a1, $a1, 1
        	sb $zero, 0($a1)   
        	addi $a0, $a0, 1 	
        j data_loop        
end_get_data:                 
jr $ra

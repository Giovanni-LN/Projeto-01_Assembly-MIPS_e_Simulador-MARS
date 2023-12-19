.text
.globl SelectOptions #seleciona qual função vai chamar
SelectOptions:
	#empilha o valor altual de #$ra
	subi $sp, $sp, -4# necessário , pois quando uma função chama outra o registrador $ra é sobrescrito e perde o retorno original
	sw $ra, 0($sp) #-4 é apenas uma convenção
	
	la $a1 , cmd_buffer #vai ser passado como parametro para strcmp	
	la $a0, cmd1 #segundo parametro para strcmp
	jal strcmp    
    	beqz $v0, conta_cadastrar
    	
    	la $a1 , cmd_buffer #tem que fazer isso novamente pois perde a referência
	la $a0, cmd2
	jal strcmp    
    	beqz $v0, conta_format
    	
    	la $a1 , cmd_buffer
	la $a0, cmd3
	jal strcmp    
    	beqz $v0, debito_extrato
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd4
	jal strcmp    
    	beqz $v0, credito_extrato
    	
    	la $a1 , cmd_buffer
	la $a0, cmd5
	jal strcmp    
    	beqz $v0, transferir_debito
    	
    	la $a1 , cmd_buffer
	la $a0, cmd6
	jal strcmp    
    	beqz $v0, transferir_credito
    	
    	la $a1 , cmd_buffer
	la $a0, cmd7
	jal strcmp    
    	beqz $v0, pagar_fatura
    	
    	la $a1 , cmd_buffer
	la $a0, cmd8
	jal strcmp    
    	beqz $v0, sacar
    	
    	la $a1 , cmd_buffer
	la $a0, cmd9
	jal strcmp    
    	beqz $v0, depositar
    	
    	la $a1 , cmd_buffer
	la $a0, cmd10
	jal strcmp    
    	beqz $v0, alterar_limite    	
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd11
	jal strcmp    
    	beqz $v0, conta_fechar   	
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd12
	jal strcmp    
    	beqz $v0 data_hora    	
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd13
	jal strcmp    
    	beqz $v0, salvar    	
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd14
	jal strcmp    
    	beqz $v0, recarregar    	
    	    	
    	la $a1 , cmd_buffer
	la $a0, cmd15
	jal strcmp    
    	beqz $v0, formatar
    	
    	la $a1 , cmd_buffer
	la $a0, cmd16
	jal strcmp    
    	beqz $v0, sair
    	
    	la $a1 , cmd_buffer
	la $a0, cmd17
	jal strcmp    
    	beqz $v0, info
    	
    	lw $ra, 0($sp)
	addi $sp, $sp, 4   	
 jr $ra

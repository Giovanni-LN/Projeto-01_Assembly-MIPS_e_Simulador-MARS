.text
.globl GetComand
GetComand:	
    	command_loop:
        	lb $t0, 0($a0)
        	beq $t0, 10, end_get_comand #quebra de linha         	           
        	beqz $t0, end_get_comand # Fim da string 
        	
        	sb $t0, 0($a1)
        	addi $a1, $a1, 1
        	sb $zero, 0($a1)
        	
        	addi $a0, $a0, 1
        	                          
        j command_loop
end_get_comand:
jr $ra

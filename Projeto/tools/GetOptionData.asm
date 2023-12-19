.text
.globl GetOptionData #option são os dados por exmeplo em conta_cadastro eles são cpf, numero, nome
GetOptionData:
    la $a0, data_buffer
load_option_1:
	la $s1, option_1       
        loop_option_1:       
            lb $t0, 0($a0)              
            beqz $t0, end_get_option_data  # Fim da string
            beq $t0, '-', load_option_2

            sb $t0, 0($s1)
            addi $s1, $s1, 1
            sb $zero, 0($s1)

            addi $a0, $a0, 1    
        j loop_option_1
        
load_option_2:
 	addi $a0, $a0, 1 
 	la $s1, option_2  
        loop_option_2:       
            lb $t0, 0($a0)              
            beqz $t0, end_get_option_data  # Fim da string
            beq $t0, '-', load_option_3

            sb $t0, 0($s1)
            addi $s1, $s1, 1
            sb $zero, 0($s1)

            addi $a0, $a0, 1    
        j loop_option_2 
               
load_option_3:
 	addi $a0, $a0, 1 
 	la $s1, option_3  
        loop_option_3:       
            lb $t0, 0($a0)              
            beqz $t0, end_get_option_data  # Fim da string            

            sb $t0, 0($s1)
            addi $s1, $s1, 1
            sb $zero, 0($s1)

            addi $a0, $a0, 1    
        j loop_option_3
        
        
end_get_option_data:
    jr $ra


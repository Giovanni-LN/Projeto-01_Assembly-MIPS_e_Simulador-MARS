.data 
	char: .byte 'A' # armazena um byte de caractere
.text 
	li $v0, 4 #imprimir char ou string
	la $a0, char
	syscall 
	
	li $v0, 10 #encerrar programa, sem isso ele encerra quando acabar as instruções
	syscall 
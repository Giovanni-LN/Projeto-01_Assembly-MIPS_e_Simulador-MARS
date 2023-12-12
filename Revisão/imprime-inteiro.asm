.data 
	inteiro : .word 16 # armazena um inteiro
.text 
	li $v0 1 # chamada para imprimir um inteiro
	lw $a0 inteiro 
	syscall 
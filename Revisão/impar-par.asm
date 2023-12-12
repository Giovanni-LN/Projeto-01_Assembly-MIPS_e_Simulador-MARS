.data 
	msg: .asciiz "digite um número "
	par: .asciiz "o número é par"
	impar: .asciiz "o número é impar"
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall 
	
	li $t0, 2
	div $v0, $t0
	
	mfhi $t1 # armazena em $t1 o valor de h1, resto da divisão.
	
	#obs, também poderia escrever assim:
	#beq $t1, $zero, numeroPar. ($zero é um registrador padrão para inteiros)
	beqz $t1, numeroPar #beqz faz uma verificação DIRETA se $t1 = 0
	li $v0, 4
	la $a0, impar
	syscall 
	
	li $v0, 10 #se não finalizar ele continua execulta numeroPar.
	syscall #só chega aqui se for impar e finaliza o programa.
	
	numeroPar: #se for par salta para esta parte ignora a anterior e finaliza.
	li $v0, 4
	la $a0, par
	syscall 
.data
	msg: .asciiz "Digite um número inteiro Positivo: "
	msgPar: .asciiz "O número é Par"
	msgImpar: .asciiz "O número é InPar"
.text
	.main:		
		la $a0, msg
		jal msgFuncion #salta para função e armazena o ENDEREÇO de retorno em $ra (obs: endereço de retorno != valor de retorno)
		jal getInt #0 VALOR de retorno está salvo em $v0
		
		move $a0 , $v0
		li $a1 , 2 #$a0 e $a1 são argumentos para a função a seguir 
		jal divFuncion #assim como em getInt, o valor de retorno está em $v0
		
		beqz $v0, numeroPar
		jal numeroImpar 
	
	msgFuncion:
		li $v0, 4		
		syscall
		jr $ra #retorna para o endereço salvo, no caso a função que chamou
	getInt:
		li $v0, 5
		syscall
		jr $ra	
	divFuncion:
		div $a0, $a1
		mfhi $v0 #será o retorno
		jr $ra
	numeroPar:
		la $a0, msgPar
		jal msgFuncion
		jal end_program
	numeroImpar:
		la $a0, msgImpar
		jal msgFuncion
		jal end_program		
	end_program:
		li $v0, 10
		syscall
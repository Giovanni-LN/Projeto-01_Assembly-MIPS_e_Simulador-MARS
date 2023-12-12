.data
	pergunta: .asciiz "Qual é seu nome? "
	saudacao: .asciiz "Olá "
	nome: .space 25 #define um espaçamento maximo para a string
.text
	li $v0, 4
	la $a0, pergunta
	syscall 
	
	li $v0, 8 #valor de leitura de string
	la $a0, nome #armazena a string tanto em $a0 quanto em nome
	la $a1, 25 #avisa quantos caracteres seram lidos
	syscall 
	#obs: seria melhor, computacionalmente,
	#salvar o valor atual de $a0 em outro registrador
	#pois será substituido na proxima instrução
	#o valor não será perdido,nesse caso, pois está salvo, também, em nome
	li $v0, 4
	la $a0, saudacao 
	syscall 
	
	li $v0, 4
	la $a0, nome #imprime o que está armazenado em nome
	syscall 
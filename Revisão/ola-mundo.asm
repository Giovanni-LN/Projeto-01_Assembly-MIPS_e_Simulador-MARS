.data
	#área destinada para armazenar dados na memória principal
	msg : .asciiz "Olá Mundo!" #mensagem que será exibida
.text
	#área para execultar instruções do programa
	li $v0, 4 #inicia instrução para impressão de string
	la $a0, msg #indica qual o endereço da mensagem
	syscall # imprime,nesse caso, o que está no registrador a0
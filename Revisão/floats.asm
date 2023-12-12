.data
	msg: .asciiz "Digite um número float "
	zero: .float 0.0
.text
	li $v0, 4
	la $a0, msg
	syscall 
	
	li $v0, 6 #valor para leitura de float, o valor vai para $f0
	syscall 
	
	lwc1 $f1, zero #lwc1 é usado para elementos de 32bits, equivalente à $f1 = 0.0
	add.s $f12, $f1, $f0 # somando floats, equivalenhte à $f12 = $f1 + $f0
	# obs: cambiarra necessária para passar o valor desejado para $f12, de outra forma ocorre erro
	#A impressão de float imprime o valor armazenado em $f12 
	
	li $v0, 2 #chamada para imprimir floats
	syscall 
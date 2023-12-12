.data
	msg: .asciiz "Digite um número double "
	zero: .double 0.0
.text
	li $v0, 4
	la $a0, msg
	syscall 
	
	#double ocupa dois registradores no caso a seguir $f0 e $f1
	li $v0, 7 #valor para leitura de double, o valor vai para $f0 e $f1, 
	syscall 
	
	ldc1 $f2, zero #ldc1 é usado para elementos double, equivalente à $f2 = 0.0 (obs: $f1 já está ocupado)
	add.d $f12, $f2, $f0 # somando doubles, equivalenhte à $f12 = $f2 + $f0
	# obs: cambiarra necessária para passar o valor desejado para $f12, de outra forma ocorre erro
	#A impressão de double imprime o valor armazenado em $f12 
	
	li $v0, 3 # chamada para imprimir doubles
	syscall 

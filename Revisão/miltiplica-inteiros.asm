.text
	li $t0, 2 # note que também será usando no exemplo de sll
	li $t1, 50
	
	mul $s0, $t0, $t1 # Equivalente à $s0 = $t0 * $t1
	li $v0, 1
	
	move $a0, $s0
	syscall 
	
	#Sheft Left Lógico (multiplica por potências de 2)
	sll $s1, $t0, 10 #É equivalente à: $t0 * (2^10)= 2048. (obs: $t0 = 2)

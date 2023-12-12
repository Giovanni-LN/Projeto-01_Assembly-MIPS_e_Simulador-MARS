.text 
	li $t0, 75 # aloca o valor inteiro 75 no registrador
	li $t1, -25
	add $s0, $t0, $t1 # é equivalente à $s0 = $t0 + $t1
	
	# adiciona diretamente o, sem uso de registrador, o valor 50, equivalente à $s1 = $s0 + 50
	addi $s1, $s0 , 50 

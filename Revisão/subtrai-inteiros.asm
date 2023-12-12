.text 
	li $t0, 100 # aloca o valor inteiro 100 no registrador
	li $t1, -25
	sub $s0, $t0, $t1 # é equivalente à $s0 = $t0 - $t1
	
	# subitrai diretamente o, sem uso de registrador, o valor 25, equivalente à $s1 = $s0 - 25
	subi  $s1, $s0 , 25 
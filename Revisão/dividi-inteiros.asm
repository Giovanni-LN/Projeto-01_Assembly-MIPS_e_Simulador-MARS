.text
	li $t0, 32 #Também são usandos nos exemplos de srl
	li $t1, 5
	
	div $t0, $t1 # Os Valores do resultado e do resto ficam em registradores especiais lo e hi.
	
	mflo $s0 # move o valor do resutado da divisão, lo, para o registrador $s0.
	mfhi $s1 # move o valor do resto, hi, para $s1.
	
	#obs: estas são as únicas maneiras de trabalhar com lo e hi,
	#nenhuma outra operação funciona com estes registradores especiais.
	
	#Shift Right Logical(divide por potências de 2)
	srl $s3, $t1 , 2 # é equivalente à $s3 = $t1/(2^2).
	srl $s4, $t0 , 4 # é equivalente à $s3 = $t1/(2^4).
	
	#obs : ele apenas armazena a parte INTEIRA da divisão.
	#Ex: 5 / 4 = 1, o resto é ignorado.
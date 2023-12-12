.data
	myArray:
	.align 2
	.space 16 #espaço reservado para o vetor
.text
	.main:
		move $t0, $zero
		move $t1, $zero #é o numero que vai ser somado +1 a cada loop e armazenado no array
		li $t2, 16
				
	insertInt:
		loop_insert:	
			beq $t0, $t2 , showInt
			sw $t1, myArray($t0)
			addi $t0, $t0, 4
			addi $t1, $t1, 1
			j loop_insert
	
	showInt:
		move $t0, $zero
		loop_show: #não pode ter duas partes com mesmo nome ex: loop
			beq $t0, $t2, end_program
			li $v0, 1
			lw $a0, myArray($t0)
			syscall
			addi $t0, $t0, 4
			j loop_show
		
	end_program:
			
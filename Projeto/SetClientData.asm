.data	
	
.text
.globl SetClientData
SetClientData:
	#empilha o valor altual de #$ra
	subi $sp, $sp, -4# necessário , pois quando uma função chama outra o registrador $ra é sobrescrito e perde o retorno original
	sw $ra, 0($sp) #-4 é apenas uma convenção, eu li em um fórum
	
	#abri arquivo, se não existir ele cria um
	li $v0, 13
	la $a0, localArquivo
	li $a1, 1 #1 significa modo de escrita, 0 é modo de leitura
	syscall #descritor foi salvo em $v0
	
	move $s0, $v0  #cópia do descritor
	
	la $a0, clientData #necessário passar clietData para $a0 como argumento
	jal CountCharacters #função para contar a quantidade de bytes
	move $t1, $v0 #salva o tamanho de clientData em bytes
	
	#escrevendo arquivo	
	li $v0, 15
	move $a0, $s0
	la $a1, clientData #passa o conteúdo para $a1
	move $a2, $t1 #passa qual é o tamanho do arquivo
	syscall 
	
	#fechar arquivo
	li $v0, 16
	move $a0, $s0
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
jr $ra
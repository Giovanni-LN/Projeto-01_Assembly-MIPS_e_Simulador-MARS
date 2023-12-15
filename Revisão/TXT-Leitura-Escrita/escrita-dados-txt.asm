.data
	conteudo: .asciiz "Hello World!!!"
	localArquivo: .asciiz "texto2.txt"
	
.text
	#abri arquivo, se não existir ele cria um
	li $v0, 13
	la $a0, localArquivo
	li $a1, 1 #1 significa modo de escrita, 0 modo de leitura
	syscall #descritor salvo em $v0
	
	move $s0, $v0
	
	#escrevendo arquivo
	li $v0, 15
	move $a0, $s0
	la $a1, conteudo #passa o conteúdo para $a1
	li $a2, 9 #tamanho do centeúdo, com tamanho diferente vai gerar respostas estranhas (conteúdo possui tamanho 14, inseri 9 para errar propositalmente)
	syscall 
	
	#fechar arquivo
	li $v0, 16
	move $a0, $s0
	syscall 
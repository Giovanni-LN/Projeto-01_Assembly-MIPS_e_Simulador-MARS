.text
.globl Formatar
Formatar:
	# Abrir o arquivo em modo de escrita
    	li $v0, 13       # Código da syscall para abrir um arquivo
    	la $a0, set_localArquivo  # local do arquivo
    	li $a1, 1        # Modo de escrita (O_WRONLY)
    	li $a2, 0        # Permissões (não importa neste caso)
    	syscall

	# Fechar o arquivo imediatamente
    	li $v0, 16       # Código da syscall para fechar um arquivo
    	move $a0, $v0    # Usar o descritor de arquivo retornado ao abrir
    	syscall
        	
end_clear_data:
	jr $ra

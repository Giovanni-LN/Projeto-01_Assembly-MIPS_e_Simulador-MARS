.data
	tabela_info_comand: .asciiz "Aqui estão listado todos os possiveis comandos\n"	
.text
.globl Info

Info:
    # Função para imprimir a lista de comandos com quebra de linha
    # Argumentos:
    # Nenhum argumento

    # Configuração da syscall para imprimir string
    li $v0, 4
	
    la $a0, tabela_info_comand
    syscall
    # Imprime todos os comandos com quebra de linha
    la $a0, cmd1
    syscall
    la $a0, newline
    syscall

    la $a0, cmd2
    syscall
    la $a0, newline
    syscall

    la $a0, cmd3
    syscall
    la $a0, newline
    syscall

    la $a0, cmd4
    syscall
    la $a0, newline
    syscall

    la $a0, cmd5
    syscall
    la $a0, newline
    syscall

    la $a0, cmd6
    syscall
    la $a0, newline
    syscall

    la $a0, cmd7
    syscall
    la $a0, newline
    syscall

    la $a0, cmd8
    syscall
    la $a0, newline
    syscall

    la $a0, cmd9
    syscall
    la $a0, newline
    syscall

    la $a0, cmd10
    syscall
    la $a0, newline
    syscall

    la $a0, cmd11
    syscall
    la $a0, newline
    syscall

    la $a0, cmd12
    syscall
    la $a0, newline
    syscall

    la $a0, cmd13
    syscall
    la $a0, newline
    syscall

    la $a0, cmd14
    syscall
    la $a0, newline
    syscall

    la $a0, cmd15
    syscall
    la $a0, newline
    syscall

    la $a0, cmd16
    syscall
    la $a0, newline
    syscall

    la $a0, cmd17
    syscall
    la $a0, newline
    syscall

    # Retorna da função
    jr $ra

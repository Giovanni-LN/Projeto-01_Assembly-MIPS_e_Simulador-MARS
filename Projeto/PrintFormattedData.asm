.text
.globl PrintFormattedData

PrintFormattedData:
    # $a0: Endereço do buffer

    # Inicializa o índice
    li $t0, 0
    move $s0, $a0

print_loop:
    lb $t1, 0($s0)     # Carrega o byte do buffer
    beqz $t1, print_done  # Se encontrou o caractere nulo, termina o loop

    # Verifica se é um caractere especial e realiza as substituições
    beq $t1, '(', replace_open_paren
    beq $t1, ')', replace_close_paren
    beq $t1, ';', replace_semicolon
    beq $t1, 0xA, replace_newline

    # Imprime o caractere original
    li $v0, 11           # Código do sistema para imprimir caractere
    move $a0, $t1
    syscall

    # Avança para o próximo byte
    addi $s0, $s0, 1
    j print_loop

replace_open_paren:
    li $t1, ' '           # Substitui '(' por espaço
    j print_char

replace_close_paren:
    li $t1, ' '           # Substitui ')' por espaço
    j print_char

replace_semicolon:
    li $t1, 0xA           # Substitui ';' por quebra de linha
    j print_char

replace_newline:
    # Pula caracteres de nova linha
    addi $s0, $s0, 1
    j print_loop

print_char:
    # Imprime o caractere substituído
    li $v0, 11           # Código do sistema para imprimir caractere
    move $a0, $t1
    syscall

    # Avança para o próximo byte
    addi $s0, $s0, 1
    j print_loop

print_done:
    jr $ra              # Retorna ao endereço de chamada

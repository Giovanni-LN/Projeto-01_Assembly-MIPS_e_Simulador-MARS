.data
	buffer: .space 128    # buffer para armazenar a string de entrada	
	mensagem_invalido: .asciiz "Comando inválido"
	
	msg_sonho: .asciiz "Funciona!!"
	
	cmd_buffer: .space 32	
	option_1: .space 32
	option_2: .space 32
	option_3: .space 32	
	
	data_buffer: .space 128
	salve_data_buffer: .space 128

		
	cmd1: .asciiz "conta_cadastrar"
	cmd2: .asciiz "conta_format"
	cmd3: .asciiz "debito_extrato"
	cmd4: .asciiz "credito_extrato"
	cmd5: .asciiz "transferir_debito"
	cmd6: .asciiz "transferir_credito"
	cmd7: .asciiz "pagar_fatura"
	cmd8: .asciiz "sacar"
	cmd9: .asciiz "depositar"
	cmd10: .asciiz "alterar_limite"
	cmd11: .asciiz "conta_fechar"
	cmd12: .asciiz "data_hora"
	cmd13: .asciiz "salvar"
	cmd14: .asciiz "recarregar"
	cmd15: .asciiz "formatar"
	cmd16: .asciiz "sair"
	cmd17: .asciiz "info"
	
	limite_credito_inicial: .asciiz "1500)"
	saldo_inicial: .asciiz "0000)"
	fatura_inicial: .asciiz "0000)"
	
	newline: .asciiz  "\n"
	ponto_virgula: .asciiz ";"
	
	#OBS: muitos dos dados alocados aqui vão ser usados em outras funções, caso execulte o arquivo contendo a função independentemente provavelmente ela não vai funcionar, sempre execulte o main
	#Atenção Se o mars.jar não estiver na mesma pasta que o arquivo txt é preciso inserir o caminho completo até chegar nele ex: C:/Users/_SEU-USUARIO_/Desktop/assembly-mars/texto.txt
	get_localArquivo: .asciiz "data/ClientData.txt"	
	set_localArquivo: .asciiz "data/ClientData_teste.txt"	
	clientData: .space 3200 #sempre coloque no final de .data, isso evita problema de invasão/estouro de memória
.text

.main:	
	jal GetClientData
	main_loop:	
		
		jal GetComand
		jal GetOptionData
		
		jal SelectOptions
		j command_not_found
	
#opções
	conta_cadastrar:
		jal Cadastro
		j update_loop
				
	conta_format:
		
		j update_loop
		
	debito_extrato:
		
		j update_loop
		
        credito_extrato:
        	
        	j update_loop
        
        transferir_debito:
        	
        	j update_loop
        
        transferir_credito:
       		
        	j update_loop
        
        pagar_fatura:
        	
        	j update_loop
        
        sacar:
        	
        	j update_loop
        
        depositar:
        	
        	j update_loop
        
        alterar_limite:
        	
        	j update_loop
        
        conta_fechar:
        	
       		j update_loop
        
        data_hora:
        	
        	j update_loop
        
        salvar: #feito #precisa de alguns testes
        	jal CountCharacters
        	beqz  $v0 formatar_salvar # se clientData = 0 significa que foi usado o comando formatar
        	jal SetClientData
        	j update_loop
        
        recarregar: #"feito" ainda precisa de mais testes
        	jal ClearClientData
        	jal GetClientData        	
        	j update_loop
        
        formatar: #feito    	
        	jal ClearClientData #apaga os dados do buffer clienteData, mas não muda o arquivo txt  	
        	j update_loop
        	
       info:  #feito
       		jal Info
       		j update_loop 
       		 
       sair: #feito
        	j end_program   	
          
        			
command_not_found:
        # Comando não encontrado, imprime mensagem e sai
        li $v0, 4
        la $a0, mensagem_invalido
        syscall
        la $a0, newline
	syscall	
        j update_loop

formatar_salvar:
	jal Formatar
	j update_loop
j main_loop 
 
update_loop:
	# Limpar o buffers
	la $a0, buffer
	li $a1, 128	
	jal ClearBuffer
	
	la $a0, cmd_buffer
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, option_1
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, option_2
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, option_3
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, data_buffer
	li $a1, 128	
	jal ClearBuffer
	
	la $a0, salve_data_buffer
	li $a1, 128	
	jal ClearBuffer
j main_loop
 		      		
end_program:
    # Finaliza o programa
    li $v0, 10
    syscall
    
.include "string/strcmp.asm"
.include "string/strcat.asm"

.include "functions/GetComand.asm"
.include "functions/GetOptionData.asm"

.include "functions/SelectOptions.asm"
.include "functions/Cadastro.asm"
.include "functions/Info.asm"
.include "functions/Formatar.asm"
.include "io-data/GetClientData.asm"
.include "io-data/SetClientData.asm"
.include "tools/PrintFormattedData.asm"
.include "tools/CountCharacters.asm"
.include "tools/ClearClientData.asm"
.include "tools/ClearBuffer.asm"

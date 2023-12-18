.data
	buffer: .space 32    # buffer para armazenar a string de entrada	
	mensagem_invalido: .asciiz "Comando inválido"
	
	msg_sonho: .asciiz "Funciona!!"
	
	cmd_buffer: .space 32	
	name_buffer: .space 64
	cpf_buffer: .space 20
	id_buffer: .space 20	
	
	data_buffer: .space 128
	name_data: .space 64
	cpf_data: .space 20
	id_data: .space 20
		
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
	
	limite_credito_inicial: .asciiz "(1500)"
	saldo_inicial: .asciiz "(0000)"
	fatura_inicial: .asciiz "(0000)"
	
	newline: .asciiz  "\n"
	ponto_virgula: .asciiz ";"
	
	#OBS: muitos dos dados alocados aqui vão ser usados em outras funções, caso execulte o arquivo contendo a função independentemente provavelmente ela não vai funcionar, sempre execulte o main
	#Atenção Se o mars.jar não estiver na mesma pasta que o arquivo txt é preciso inserir o caminho completo até chegar nele ex: C:/Users/_SEU-USUARIO_/Desktop/assembly-mars/texto.txt
	get_localArquivo: .asciiz "data/ClientData.txt"	
	set_localArquivo: .asciiz "data/ClientData_teste.txt"	
	clientData: .space 3200 #sempre coloque no final de .data, isso evita problema de invasão/estouro de memória
.text

.main:	
	#jal GetClientData
	main_loop:	
		#jal PrintFormattedData		
	
		#j end_program
		# 1. Leitura da String de Entrada
		li $v0, 8            # código da syscall para ler string
		la $a0, buffer       # endereço do buffer
		li $a1, 128          # comprimento máximo da string
		syscall
	
		la $a0, buffer ## provavelmente NESTE(NESTE!!!) caso nem precise, pois $a0 ja aponta para buffer, mas assim fica mais fácil de entender
		la $a1, cmd_buffer
		jal GetComand
	
		la $a0, cmd_buffer
		jal SelectOptions

		j command_not_found#só entra aqui se nenhuma opção for selecionada
	
#opções
	conta_cadastrar:
		jal Cadastro
		j update_loop
				
	conta_format:
		j imprime_teste
		j update_loop
		
	debito_extrato:
		j imprime_teste
		j update_loop
		
        credito_extrato:
        	j imprime_teste
        	j update_loop
        
        transferir_debito:
        	j imprime_teste
        	j update_loop
        
        transferir_credito:
       		j imprime_teste
        	j update_loop
        
        pagar_fatura:
        	j imprime_teste
        	j update_loop
        
        sacar:
        	j imprime_teste
        	j update_loop
        
        depositar:
        	j imprime_teste
        	j update_loop
        
        alterar_limite:
        	j imprime_teste
        	j update_loop
        
        conta_fechar:
        	j imprime_teste
       		j update_loop
        
        data_hora:
        	j imprime_teste
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
        
        sair: #feito
        	j end_program 
        	
       info:  #feito
       		jal Info
       		j update_loop    	
          
        			
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
	j end_program 
j main_loop 



 		      		
end_program:
    # Finaliza o programa
    li $v0, 10
    syscall
    
.include "string/strcmp.asm"
.include "string/strcat.asm"
.include "functions/GetComand.asm"
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

update_loop:
	# Limpar o buffers
	la $a0, buffer
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, cmd_buffer
	li $a1, 32	
	jal ClearBuffer
	
	la $a0, name_buffer
	li $a1, 64	
	jal ClearBuffer
	
	la $a0, cpf_buffer
	li $a1, 20	
	jal ClearBuffer
	
	
	la $a0, id_buffer
	li $a1, 20	
	jal ClearBuffer
	
	la $a0, data_buffer
	li $a1, 128	
	jal ClearBuffer
	
	la $a0, name_data
	li $a1, 64	
	jal ClearBuffer
	
	la $a0, cpf_data
	li $a1, 20	
	jal ClearBuffer
	
	la $a0, id_data
	li $a1, 20	
	jal ClearBuffer
j main_loop 
	
	
imprime_teste:	# essa parte é apenas para testes	
		li $v0, 4

		la $a0, msg_sonho  
		syscall	
		        		
        	la $a0, newline
		syscall	
		
        	la $a0, cmd_buffer
        	syscall 

		j end_program

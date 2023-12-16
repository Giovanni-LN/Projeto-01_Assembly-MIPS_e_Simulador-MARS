.data
	#OBS: muitos dos dados alocados aqui vão ser usados em outras funções, caso execulte o arquivo contendo a função independentemente provavelmente ela não vai funcionar, sempre execulte o main
	#Atenção Se o mars.jar não estiver na mesma pasta que o arquivo txt é preciso inserir o caminho completo até chegar nele ex: C:/Users/_SEU-USUARIO_/Desktop/assembly-mars/texto.txt
	localArquivo: .asciiz "ClientData.txt"	
	clientData: .space 3200 #sempre coloque no final de .data, isso evita problema de invasão/estouro de memória
.text

.main:	
	jal GetClientData #acessa localArquivo(,txt) e insere os dados em clientData		    	    
	
	jal PrintFormattedData #acessa clientData
	
	#jal SetClientData #acessa localArquivo(.txt) e salva os dados de clienData	
end_program:
li $v0, 10
syscall

.include "GetClientData.asm"
.include "PrintFormattedData.asm"
.include "CountCharacters.asm"
.include "SetClientData.asm"

#COMANDOS
#conta_cadastrar-<option1>-<option2>-<option3>
#conta_format-<option1>
#debito_extrato-<option1>
#credito_extrato-<option1>
#transferir_debito-<option1>-<option2>-<option3>
#transferir_credito-<option1>-<option2>-<option3>
#pagar_fatura-<option1>-<option2>-<option3>
#sacar-<option1>-<option2>
#depositar-<option1>-<option2>
#alterar_limite-<option1>-<option2>
#conta_fechar-<option1>
#data_hora-<option1>-<option2>
#salvar
#recarregar
#formatar
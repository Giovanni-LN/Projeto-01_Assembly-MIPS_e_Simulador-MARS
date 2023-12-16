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

#empilha o valor altual de #$ra
#subi $sp, $sp, -4# necessário , pois quando uma função chama outra $ra é sobrescrito e perde o retorno
#sw $ra, 0($sp) #-4 é apenas uma convenção, ei li em um fórum

#lw $ra, 0($sp)
#addi $sp, $sp, 4
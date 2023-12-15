.data
	clienteData: .space 3200
.text

.main:
	 # Chama a função GetClientData
	jal GetClientData
    
	# Salva o endereço do conteúdo no clienteData
	move $s0, $v0
	
	move $a0, $s0
	jal PrintFormattedData

	
end_program:
li $v0, 10
syscall

.include "GetClientData.asm"
.include "PrintFormattedData.asm"


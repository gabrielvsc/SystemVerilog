.text
main:
    addi a0, zero, 16
    addi a1, zero, 1
    addi s0, a0, 0
fact:
    addi s3, zero, 1 
	loop:
    	beq s0, a1,fim
    	mul s3,s3,s0
    	addi s0,s0,-1
    	jal zero, loop
fim:
    nop
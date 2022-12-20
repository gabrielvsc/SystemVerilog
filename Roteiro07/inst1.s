.text
main:
    addi s0, zero, 5  # s0 = N <- Aqui é onde você insere o N
    addi a0, zero, 1  # a0 = 1
fact:
    addi a1, zero, 1  # s3 = 1
	loop:
    	beq s0, a0,fim # if(s0 == a0) fim
    	mul a1,a1,s0   # s3 = s3 * s0
    	addi s0,s0,-1  # s0 = s0 - 1
    	jal zero, loop
fim:
    nop
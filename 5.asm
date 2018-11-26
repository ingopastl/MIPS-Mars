.data
	num: .word
	inputMessage: .asciiz "Entre com um inteiro: "
	positiveEvenMessage: .asciiz "O numero e par e positivo\n"
	positiveOddMessage: .asciiz "O numero e impar e positivo\n"
	negativeEvenMessage: .asciiz "O numero e par e negativo\n"
	negativeOddMessage: .asciiz "O numero e impar e negativo\n"
	
.text
	li $v0, 4
	la $a0, inputMessage
	syscall # Print the input message

	li $v0, 5
	syscall # Read the user input
	move $s0, $v0
	sw $s0, num
	
	li $t1, 2
	blt $v0, 0, negative
		div $s0, $t1
		mfhi $t0
		beq $t0, 0, posEven
			li $v0, 4
			la $a0, positiveOddMessage
			syscall
			j exit
		posEven:
			li $v0, 4
			la $a0, positiveEvenMessage
			syscall
			j exit
	negative:
		div $s0, $t1
		mfhi $t0
		beq $t0, 0, negEven
			li $v0, 4
			la $a0, negativeOddMessage
			syscall
			j exit
		negEven:
			li $v0, 4
			la $a0, negativeEvenMessage
			syscall
	exit:
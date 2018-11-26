.data
	n: .space 4
	inputMessage: .asciiz "Type an integer: "
	invalidInputMessage: .asciiz "Invalid input\n"
	factorialMessage: .asciiz "Factorial: "

.text
	main:
		j input
		invalidInput:
		li $v0, 4
		la $a0, invalidInputMessage
		syscall
		input:
		li $v0, 4
		la $a0, inputMessage
		syscall
		li $v0, 5
		syscall
		sw $v0, n
		blt $v0, 0, invalidInput
		
		lw $a0, n
		jal factiorial
		
		li $v0, 4
		la $a0, factorialMessage
		syscall
		li $v0, 1
		move $a0, $v1
		syscall
		
		# End of program
		li $v0, 10
		syscall
	
	factiorial:
		move $v1, $a0 # Factorial
		move $s0, $a0
		loop:
			subi $s0, $s0, 1
			beq $s0, 0, exitLoop
			mul $v1, $v1, $s0
			j loop
		exitLoop:
		jr $ra
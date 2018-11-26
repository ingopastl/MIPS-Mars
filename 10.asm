.data
	inputMessage: .asciiz "Type an integer: "
	invalidMessage: .asciiz "Invalid input\n"
	sumMessage: .asciiz "Sum: "
	
.text
	main:
		j start
		negative:
		li $v0, 4
		la $a0, invalidMessage
		syscall
		
		start:
		li $v0, 4
		la $a0, inputMessage
		syscall
		li $v0, 5
		syscall
		blt $v0, 0, negative
		
		move $a0, $v0
		jal sum
		
		li $v0, 4
		la $a0, sumMessage
		syscall
		li $v0, 1
		move $a0, $v1
		syscall
		
		li $v0, 10
		syscall
		
	sum:
		sub $sp, $sp, 8
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		
		# Base cade
		li $v1, 1
		beq $a0, 1, sumDone
		
		move $s0, $a0
		sub $a0, $a0, 1
		jal sum
		
		add $v1, $s0, $v1
		
		sumDone:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		add $sp, $sp, 8
		jr $ra
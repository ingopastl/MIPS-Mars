.data
	intArray: .space 40
	inputMessage: .asciiz "Type an integer: "
	sumString: .asciiz "\nSummation: "

.text
	main:
		li $t0, 0 # i = 0
		readingLoop:
			bge $t0, 40, exitReadingLoop
			
			li $v0, 4
			la $a0, inputMessage
			syscall
			li $v0, 5
			syscall
			sw $v0, intArray($t0)
		
			addi $t0, $t0, 4 # i++
			j readingLoop
		exitReadingLoop:
		
		la $a0, intArray # Array address
		li $a1, 40 # Size of the array
		jal bubbleSort
		
		li $t0, 0 # i = 0
		li $s0, 0 # Sum = 0
		printingLoop:
			bge $t0, 40, exitPrintingLoop
			
			li $v0, 1
			lw $a0, intArray($t0)
			add $s0, $s0, $a0
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			
			addi $t0, $t0, 4 # i++	
			j printingLoop
		exitPrintingLoop:
		
		li $v0, 4
		la $a0, sumString
		syscall
		li $v0, 1
		move $a0, $s0
		syscall
		# End of program
		li $v0, 10
		syscall 
	
	bubbleSort:
		li $t0, 0 # i = 0
		bLoop:
			subi $t2, $a1, 4 # n - 1
			bge $t0, $t2, exitBLoop
			li $t1, 0 # j = 0
			b2Loop:
				sub $t3, $t2, $t0 #n - 1 - i
				bge $t1, $t3, exitB2Loop
				
				add $t4, $a0, $t1 # &arr[j]
				lw $s0, 0($t4)
				addi $t5, $t4, 4 # &arr[j+1]
				lw $s1, 0($t5)
				ble $s0, $s1, dontSwap
				sw $s1, 0($t4)
				sw $s0, 0($t5)
				dontSwap:
				
				addi $t1, $t1, 4 # j++
				j b2Loop
			exitB2Loop:
			addi $t0, $t0, 4 # i++	
			j bLoop
		exitBLoop:
		jr $ra
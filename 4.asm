.text
	li $s0, 1
	li $s1, 2

	li $t0, 0 # Index
	loop:
		bge $t0, 10, exitLoop
		
		blt $s0, $s1, if
			addi $s1, $s1, 2
			j exitIfElse
		if:
			addi $s0, $s0, 2
		exitIfElse:
		
		addi $t0, $t0, 1 # index++
		j loop
	exitLoop:
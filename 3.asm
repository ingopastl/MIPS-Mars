.text
	li $s0, 0x10010020 # v[0]
	li $s1, 28 # Number of bytes in the array 'v'
	li $s2, 100 # num = 100
	
	li $t0, 0 # index
	
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 1
	sw $t2, 0($t1) # v[i] = 1
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 3
	sw $t2, 0($t1) # v[i] = 3
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 2
	sw $t2, 0($t1) # v[i] = 2
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 1
	sw $t2, 0($t1) # v[i] = 1
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 4
	sw $t2, 0($t1) # v[i] = 4
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	addi $t2, $zero, 5
	sw $t2, 0($t1) # v[i] = 5
	
	lw $t3, 8($s0) # v[2]
	lw $t4, 16($s0) # v[4]
	
	addi $t0, $t0, 4 # index++
	add $t1, $s0, $t0  # v[i]
	add $t2, $zero, $t3
	add $t2, $t2, $t4
	add $t2, $t2, $s2
	sw $t2, 0($t1) # v[i] = v[2] + v[4] + num
	
	li $s3, 0x10010040 # u[0]
	
	li $t0, 0 # index
	loop:
		bge $t0, $s1, exitLoop
		
		add $t1, $s0, $t0 # v[i]
		lw $t2, 0($t1)
		add $t2, $t2, $t2 # v[i] = v[i] + v[i]
		sw $t2, 0($t1)
		
		add $t3, $s3, $t0 # u[i]
		sw $t2, 0($t3)
		
		addi $t0, $t0, 4 # index++
		j loop
	exitLoop:

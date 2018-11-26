.text
	li $s0, 0x10010020
	
	la $s1, 0($s0) # i = 0
	li $s2, 100 # num = 100
	
	addi $t0, $zero, 1
	sw $t0, 0($s1) # v[i] = 1
	
	addi $s1, $s1, 4 # i++
	addi $t0, $zero, 3
	sw $t0, 0($s1)
	
	addi $s1, $s1, 4 # i++
	addi $t0, $zero, 2
	sw $t0, 0($s1)
	
	addi $s1, $s1, 4 # i++
	addi $t0, $zero, 1
	sw $t0, 0($s1)
	
	addi $s1, $s1, 4 # i++
	addi $t0, $zero, 4
	sw $t0, 0($s1)
	
	addi $s1, $s1, 4 # i++
	addi $t0, $zero, 5
	sw $t0, 0($s1)
	
	lw $t1, 8($s0) # v[2]
	lw $t2, 16($s0) # v[4]
	
	addi $s1, $s1, 4 # i++
	add $t0, $zero, $t1
	add $t0, $t0, $t2
	add $t0, $t0, $s2
	sw $t0, 0($s1)
	

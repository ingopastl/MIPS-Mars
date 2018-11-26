.text
main:
	la $s0, 0x10010000
	
	addi $t1, $zero, 1
	sw $t1, 0($s0)
	addi $t1, $zero, 3
	sw $t1, 4($s0)
	addi $t1, $zero, 2
	sw $t1, 8($s0)
	addi $t1, $zero, 1
	sw $t1, 12($s0)
	addi $t1, $zero, 4
	sw $t1, 16($s0)
	addi $t1, $zero, 5
	sw $t1, 20($s0)
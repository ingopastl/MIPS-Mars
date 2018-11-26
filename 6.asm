.data
	jumpTalbe: .word a, s, m, d
	fistNumberMessage: .asciiz "Type the first number: "
	secondNumberMessage: .asciiz "Type the second number: "
	opCodeMessage: .asciiz "Type the operation code\n1-Add 2-Sub 3-Mult 4-Div\nInput: "
	invalidMessage: .asciiz "Invalid input, mate\n"
	
.text
	li $v0, 4
	la $a0, fistNumberMessage
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	j op
	invalid:
	li $v0, 4
	la $a0, invalidMessage
	syscall
	op:
	li $v0, 4
	la $a0, opCodeMessage
	syscall
	li $v0, 5
	syscall
	bgt $v0, 4, invalid
	ble $v0, 0, invalid
	move $s5, $v0
	
	li $v0, 4
	la $a0, secondNumberMessage
	syscall
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	la $s0, jumpTalbe
	sll $t1, $s5, 2
	sub $t1, $t1, 4 
    	add $t1, $t1, $s0
    	lw $t0, 0($t1)
    	jr $t0
	
	a:
		add.s $f3, $f1, $f2
		li $v0, 2
		mov.s $f12, $f3
		syscall
		j switchExit
	s:
		sub.s $f3, $f1, $f2
		li $v0, 2
		mov.s $f12, $f3
		syscall
		j switchExit
	m:
		mul.s $f3, $f1, $f2
		li $v0, 2
		mov.s $f12, $f3
		syscall
		j switchExit
	d:
		div.s $f3, $f1, $f2
		li $v0, 2
		mov.s $f12, $f3
		syscall
		j switchExit
	switchExit:

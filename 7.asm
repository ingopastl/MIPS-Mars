sll $t0, $s0, 2        # $t0 = f * 4
add $t0, $s6, $t0      # $t0 = &A[f]
sll $t1, $s1, 2        # $t1 = g * 4
add $t1, $s7, $t1      # $t1 = &B[g]
lw $s0, 0($t0)	       # f = A[f]

addi $t2, $t0, 4       # $t2 = &A[f+1]
lw $t0, 0($t2)         # $t0 = A[f+1]
add $t0, $t0, $s0      # A[f+1] = A[f+1] + f
sw $t0, 0($t1)         # $t0 = B[g]
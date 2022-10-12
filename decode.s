decode:
addi $sp, $sp, -20
sw $ra, 16($sp)
sw $s3, 12($sp)
sw $s2, 8($sp)
sw $s1, 4($sp)
sw $s0, 0($sp)

move $s0, $a3
srl $s1, $s0, 31 #s1 has s in 0 bit
sll $t0, $s0, 9
srl $s2, $t0, 9 #s2 has m in 22:0 bits
sll $t1, $s0, 1
srl $s3, $t1, 24 #s3 has e in 7:0 bits

sw $s1, ($a0)
sw $s3, ($a1)
sw $s2, ($a2)

lw	$s0, 0($sp)
lw	$s1, 4($sp)
lw	$s2, 8($sp)
lw          $s3, 12($sp)
lw	$ra, 16($sp) #retrieve values from stack
addi	$sp, $sp, 20 #pop stack

jr $ra

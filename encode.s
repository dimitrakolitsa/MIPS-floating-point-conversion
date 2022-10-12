encode:
addi  $sp, $sp, -16 #push stack for 4 variables
sw $ra, 12($sp)
sw $a2, 8($sp) # mantissa in $a2
sw $a1, 4($sp) # exponent in $a1
sw $a0, 0($sp) # sign in $a0

move $t0, $a0 # t0 has s (sign)
move $t1, $a1 # t1 has e (exponent)
move $t2, $a2 # t2 has m (mantissa) in 22-0 bit

sll $t3, $t0, 31 # t3 has s in 31 bit
sll $t4, $t1, 23 # t4 has e in 30:23 bit

or $t5, $t3, $t4 # t5 has t3 and t4 zipped together
or $t6, $t5, $t2 # t6 has t5 and t2 zipped together -> the whole number

move $v0, $t6 # return whole number

lw	$a0, 0($sp)
lw	$a1, 4($sp)
lw	$a2, 8($sp)
lw	$ra, 12($sp) #retrieve values from stack
addi	$sp, $sp, 16 #pop stack

jr $ra

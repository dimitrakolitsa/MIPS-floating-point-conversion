shift_exponentials:
lw $t0, 0($a0) 
lw $t1, 0($a1)
lw $t2, 0($a2)
lw $t3, 0($a3)

FIRST:
bge $t0, $t2, SECOND
addi $t0, $t0, 1
srl $t1, $t1, 1
j FIRST

SECOND:
bge $t2,  $t0, exit
addi $t2, $t2, 1
srl $t3, $t3, 1
j SECOND

exit:
sw $t0, 0($a0) 
sw $t1, 0($a1)
sw $t2, 0($a2)
sw $t3, 0($a3)

jr $ra 


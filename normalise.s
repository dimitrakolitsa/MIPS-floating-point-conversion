normalize:
lw $t0, 0($a0)
lw $t1, 0($a1)

FIRST:
and $t2, $t1, 0xFF000000
beq $t2, $zero, SECOND
srl $t1, $t1, 1
addi $t0, $t0, 1
j FIRST

SECOND:
and $t2, $t1, 0x00800000
bne $t2, $zero, exit
sll $t1, $t1, 1
addi $t0, $t0, -1
j SECOND

exit:
sw $t0, 0($a0)
sw $t1, 0($a1)

    jr      $ra     # return

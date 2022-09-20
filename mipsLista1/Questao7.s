bitparidade:
    move $t0, $a0
    
    move $t1, $zero
    addi $t2, $zero, 1

    move $t3, $zero

    addi $t4, $zero, 7

Loop:
    
    #i < 7?
    slt $t5, $t3, $t4
    beq $t5, $zero, Exit
    and $t5, $a0, $t2 

If:
    addi $t3, $t3, 1
    sll $t2, $t2, 1
    beq $t5, $zero, Loop
    addi $t1, $t1, 1
    j Loop

Exit:

    div $t6, $t1, 2
    mfhi    $t7

    beq $t7, $zero, Exit2
    addi $t8, $zero, 1
    j MainExit
Exit2:
    move $t8, $zero

MainExit:

    add $t9, $a0, $zero

    beq $t8, $zero, FinalExit
    ori $t9, $a0, 128

FinalExit: 

    move $v0, $t8
    move $v1, $t9

    jr $ra
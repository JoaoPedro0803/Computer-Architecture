.data
msg1: .asciiz " "
msg2: .asciiz "\n" 
msg3: .asciiz "*"
.text
main:



li      $v0, 5
syscall
move    $s0, $v0


add $s1, $zero, 1
add $s7, $s0, 1


for1:      
    slt $s2, $s1, $s7
    beq $s2, $zero, Exit2
    add $s3, $s0, $zero

for2:      
    slt $s2, $s1, $s3
    add $s4, $zero, $zero
    beq $s2, $zero, for3
    li          $v0, 4
    la          $a0, msg1
    syscall
    addi $s3, $s3, -1

    j for2
for3:
    add $s5, $s1, $zero
    sll    $s5, $s5, 1
    addi $s5, $s5, -1

    slt $s2, $s4, $s5
    beq $s2, $zero, Exit1
    li  $v0, 4
    la  $a0, msg3
    syscall 
    addi $s4, $s4, 1 
    j for3

Exit1:

    addi $s1, $s1, 1
    slt $s2, $s1, $s7
    beq $s2, $zero, Exit2
    li      $v0, 4
    la      $a0, msg2
    syscall
    j for1
Exit2: 


li      $v0, 10
syscall
#   float f2c (float fahr){
#       return ((5.0/9.0)*(fahr - 32.0));
#   }
#
    .data
    msg1:   .asciiz   "Digite a temperatura em Fahrenheit: "
    msg2:   .asciiz   "Temperatura em Celsius: "
    nl:     .asciiz   "\n"
    consts: .float  5.0, 9.0, 32.0
    .text
#.d para registradores pares, 
main:
    #printa msg1
    li      $v0, 4
    la      $a0, msg1
    syscall
    #le a temperatura em fahr e armazena em f0
    li      $v0, 6
    syscall
    
    jal f2c

    #imprime a ms2
    li      $v0, 4
    la      $a0, msg2 
    syscall

    #imprime a temperatura em celsius 
    li      $v0, 2
    mov.s   $f12, $f0
    syscall

    #encerra o programa
    li      $v0, 10
    syscall

f2c:
    #$f0: fahr
    la      $t0, consts
    lwc1    $f2, 0($t0) #f2 = 5
    lwc1    $f3, 4($t0) #f3 = 9
    lwc1    $f4, 8($t0) #f4 = 32

    div.s   $f1, $f2, $f3 #f1 = 5/9
    sub.s   $f0, $f0, $f4 #f0 = fahr -32
    mul.s   $f0, $f0, $f1

    jr $ra


    

#   float f2c (float fahr){
#       return ((5.0/9.0)*(fahr - 32.0));
#   }
#
    .data
    msg1:   .asciiz   "Digite a temperatura em Fahrenheit: "
    msg2:   .asciiz   "Temperatura em Celsius: "
    nl:     .asciiz   "\n"
    consts: .double  5.0, 9.0, 32.0
    .text
#.d para registradores pares, 
main:
    #printa msg1
    li      $v0, 4
    la      $a0, msg1
    syscall
    #le a temperatura em fahr e armazena em f0
    li      $v0, 7
    syscall
    
    jal f2c

    #imprime a ms2
    li      $v0, 4
    la      $a0, msg2 
    syscall

    #imprime a temperatura em celsius 
    li      $v0, 3
    mov.d   $f12, $f0
    syscall

    #encerra o programa
    li      $v0, 10
    syscall

f2c:
    #$f0: fahr
    la      $t0, consts
    ldc1    $f2, 0($t0) #f2 = 5
    ldc1    $f4, 4($t0) #f4 = 9
    ldc1    $f6, 8($t0) #f6 = 32

    div.d   $f8, $f2, $f4 #f1 = 5/9
    sub.d   $f0, $f0, $f6 #f0 = fahr -32
    mul.d   $f0, $f0, $f8

    jr $ra
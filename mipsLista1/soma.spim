        .data
#msg1:    .asciiz    "Digite a: "
#msg2:    .asciiz    "Digite b: " 
#result:  .asciiz    "Resultado: "
#nl:      .asciiz    "\n"

        .text
main:
    #printar a msg1
    #li      $v0, 4
    #la      $a0, msg1
    #syscall

    #ler um numero do teclado  a = $s0
    li      $v0, 5
    syscall
    move $s0, $v0

    #printar a msg2        
    #li      $v0, 4
    #la      $a0, msg2
    #syscall

    #ler um numero do teclado  b = $s1
    li      $v0, 5
    syscall
    move    $s1, $v0

    #soma dos dois numeros digitaos resultado = $t0
    add     $t0, $s0, $s1

    #printar a resultado       
    #li      $v0, 4
    #la      $a0, result
    #syscall

    #atribui e printa o resultado da soma em result
    li $v0, 1
    move $a0, $t0
    syscall

    #printar a nl        
    #li      $v0, 4
    #la      $a0, nl
    #syscall

    #sair do programa 
    li      $v0, 10
    syscall

     
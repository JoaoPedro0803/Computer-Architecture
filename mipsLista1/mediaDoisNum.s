        .data
msg1:   .asciiz "Digite o primeiro numero: "
msg2:   .asciiz "Digite o segundo numero: "
media:  .asciiz "Resultado da media: "

        .text
main:
    #printar a primeira mensagem
    li      $v0, 4
    la		$a0, msg1
    syscall

    #ler o primeiro numero a = $s0
    li      $v0, 5
    syscall
    move $s0, $v0

    #printar a segunda mensagem
    li      $v0, 4
    la      $s0, msg2
    syscall

    #ler o segundo numero b = $s1
    li $v0, 5
    syscall 
    move $s1, $v0

    #calcular a soma resultado em $t0
    add $t0, $s0, $s1

    #dividir o resultado por 2
    div $t1, $t0, 2

    #printar a resultado
    li      $v0, 4
    la      $s0, media
    syscall

    #associa o resultado ao media = $t2
    li      $v0 1
    move    $a0, $t1
    syscall

    #sair do programa 
    li      $v0, 10
    syscall 

    




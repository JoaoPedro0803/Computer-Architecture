# A primeira linha da entrada contem um inteiro C representando a capacidade da cabine. A segunda 
# linha da entrada contem um inteiro A representando o numero total de alunos na turma
# Seu programa deve imprimir uma linha contendo um numero inteiro, representando o numero
# minimo de viagens do teleferico para levar todos os alunos ate o pico da montanha.

        .data   
#msg1:   .asciiz     "Informe a capacidade da cabine: "
#msg2:   .asciiz     "Informe a quantidade de alunos: "
#result:   .asciiz     "Número minimo de viagens: "
        .text

main:

    #print msg1
    #li      $v0, 4
    #la      $a0, msg1
    #syscall

    #ler a capacidade: C ($t0)
    li      $v0, 5
    syscall
    move    $t0, $v0

    #tirar 1 da capacidade (c-1 = $t1)
    addi    $t1, $t0, -1

    #print quantidade de alunos
    #li      $v0, 4
    #la      $a0, msg2
    #syscall

    #ler a quantidade de alunos: A($t2)
    li      $v0, 5
    syscall
    move    $t2, $v0

    #resultado inteiro da divisão é o número mínimo de viagens
    div     $t3, $t2, $t1
    mfhi    $t4
    
    #se o resto ($t4) == 0, ok se n, soma 1 no resultado da divisao
    beq     $t4, $zero, r1 
    addi    $t5, $t3, 1 
    j r2
r1:
    #printar o resultado
    li      $v0, 1
    move    $a0, $t3
    syscall

    li      $v0, 10
    syscall
r2:
    #printar o resultado
    li      $v0, 1
    move    $a0, $t5
    syscall

    li      $v0, 10
    syscall








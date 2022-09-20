    .data
    msg1:   .asciiz     "Digite o primeiro caracter: "
    msg2:   .asciiz     "Digite o segundo caracter: "
    msg3:   .asciiz     "Digite a temperatura a ser convertida: "
    consts: .float      1.8, 32.0, 273.15, 5.0, 9.0, 459.67
    .text

main:
    #printa msg1
    #li          $v0, 4
    #la          $a0, msg1
    #syscall

    #printa msg2
    #li          $v0, 4
    #la          $a0, msg2
    #syscall

    #printa msg3
    #li          $v0, 4
    #la          $a0, msg3
    #syscall

    #le o primeiro caracter e armazena em $t4
    li          $v0, 12 
    syscall 
    move        $t4, $v0

    #le o segundo caracter e armazena em $t5
    li          $v0, 12 
    syscall 
    move        $t5, $v0

    #le a temperatura a ser convertida
    li          $v0, 6 
    syscall 

    li          $t6, 'C' # salva C em t6
    li          $t7, 'K' # salva K em t7
	li          $t8, 'F' # salva F em t8

    beq         $t4, $t6, primeiraC
    beq         $t4, $t7, primeiraK
    beq         $t4, $t7, primeiraF

     #imprime a temperatura em celsius 
    li      $v0, 2
    mov.s   $f19, $f0
    syscall

    #encerra o programa
    li      $v0, 10 
    syscall

primeiraC:
    beq         $t5, $t7, c2k
    beq         $t5, $t8, c2f 

primeiraK:
    beq         $t5, $t6, k2c
    beq         $t5, $t8, k2f

primeiraF:
    beq         $t5, $t6, f2c
    beq         $t5, $t7, f2k

c2f:
    la          $t0, consts
    lwc1        $f2, 0($t0) #f2 = 1.8
    lwc1        $f3, 4($t0) # f3 = 32
    #lwc1    $f4, 8($t0)
    #lwc1    $f5, 12($t0)
    #lwc1    $f6, 16($t0)
    #lwc1    $f7, 20($t0)

    # F = CEL * 1.8 + 32.0
    mul.s       $f0, $f0, $f2
    add.s       $f0, $f0, $f3

    #resultado armazenado em $f0
    
    jr $ra

c2k: 
    la          $t0, consts
    lwc1        $f4, 8($t0) # f4 = 273.15

    # K = Cel + 273.15

    add.s       $f0, $f0, $f4

    #resultado armazenado em $f0

    jr $ra

f2c:
    #Cel = 5/9 * (fahr - 32)
    #$f0: fahr
    la          $t0, consts
    lwc1        $f5, 12($t0) #f5 = 5
    lwc1        $f6, 16($t0) #f6 = 9
    lwc1        $f7, 4($t0) #f7 = 32

    div.s       $f1, $f5, $f6 #f1 = 5/9
    sub.s       $f0, $f0, $f7 #f0 = fahr -32
    mul.s       $f0, $f0, $f1

    #resultado armazenado em $f0

    jr $ra

f2k:
    #Kel = (fahr + 459.67) * 5/9
    la          $t0, consts
    lwc1        $f8, 12($t0) #f8 = 5
    lwc1        $f9, 16($t0) #f9 = 9
    lwc1        $f10, 20($t0) #f10 = 459.67

    div.s       $f11, $f8, $f9
    add.s       $f0, $f0, $f10
    mul.s       $f0, $f0, $f11

    #resultado armazenado em $f0
    
    jr $ra

k2c:
    #Cel = kel - 273.15
    la          $t0, consts
    lwc1        $f12, 8($t0) #f12 = 273.15

    sub.s       $f0, $f0, $f12

    #resultado armazenado em $f0 

    jr $ra

k2f:
    #Fahr = (kel - 273.15) * 1.8 + 32.0
    la          $t0, consts
    lwc1        $f13, 8($t0) #f13 = 273.15
    lwc1        $f14, 0($t0) #f14 = 1.8
    lwc1        $f15, 4($t0) #f15 = 32.0

    sub.s       $f0, $f0, $f13
    mul.s       $f0, $f0, $f14
    add.s       $f0, $f0, $f15

    #resultado armazenado em $t0 

    jr $ra






    









        .data

msg1:   .asciiz "Digite o primeiro numero: "
msg2:   .asciiz "Digite o segundo numero: "
msg3:   .asciiz "\nlo: "
msg4:   .asciiz "\nhi: "
msg5:   .asciiz "\nt0: "
msg6:   .asciiz "\nt1: "
msg7:   .asciiz "\nprimeiro numero nao eh positivo\n"
msg8:   .asciiz "\nsegundo numero nao eh positivo\n"
msg9:   .asciiz "\nt6: "
msg10:  .asciiz "\nt7: "

        .text
main:
        #Imprimindo a msg1 na tela
        li          $v0, 4
        la          $a0, msg1
        syscall
        
        #Lendo o primeiro numero e armazenando em s0
        li          $v0, 5
        syscall
        move        $s0, $v0

        #Imprimindo a msg2 na tela
        li          $v0, 4
        la          $a0, msg2
        syscall

        #Lendo o segundo numero e armazenando em s1
        li          $v0, 5
        syscall
        move        $s1, $v0

        #Salvando os valores nos argumentos
        move        $a0, $s0
        move        $a1, $s1

        #Chamando a função
        jal         multfac

        # (c) - salva o retorno da funcao
        mfhi        $s1
        mflo        $s0

        #Imprimindo msg3 na tela
        li          $v0, 4
        la          $a0, msg3
        syscall

        #Imprimindo lo na tela  
        li          $v0, 1
        move        $a0, $s0
        syscall

        #Imprimindo msg4 na tela
        li          $v0, 4
        la          $a0, msg4
        syscall

        #Imprimindo lo na tela  
        li          $v0, 1
        move        $a0, $s1
        syscall

        li          $v0, 10
        syscall

multfac:
        
        move        $t0, $a0 # t0 = M
        move        $t1, $a1 # inicializando o lo
        move        $t2, $zero # inicializando o hi
        move        $t3, $zero # t3 = contador começando as iterações em 0 até 31
        addi        $t4, $zero, 32 # t4 é o comparador para o contador
                                   # t5 armazenará resultado das condicionais
                                   # t6 e t7 verificar sinal das entradas
        slt         $t6, $zero, $t0 # verificar o sinal das entradas
                                    # se t6 = 1 (positivo) t6 = 0 (negativo)

        slt         $t7, $zero, $t1 # mesma coisa para a segunda entrada
                                    # se t6 != t7, então eles possuem sinais diferentes


        bne         $t6, $zero, FirstPositivo # transformar as entradas em inteiros sem sinal

        nor         $t0, $t0, $zero # invertendo os bits		
 
        addi        $t0, $t0, 1

FirstPositivo:
        bne         $t7, $zero, SecondPositivo

 
        nor         $t1, $t1, $zero # invertendo os bits de t1		

        addi        $t1, $t1, 1

SecondPositivo:
Loop1:  
        beq         $t3, $t4, Saida #verifica se contador = 32
       
        andi        $t5, $t1, 1 #verificar se na posicao do vetor é igual a 0 
        
        beq         $t5, $zero, difUm #verificar o retorno do and. se = 1, p[0] = 1 
      
        add         $t2, $t2, $t0 # hi = hi + t0
difUm:
        
        andi        $t5, $t2, 1 # verificar se o bit mais significativo é igual a 1
       
        srl         $t1, $t1, 1 # deslocamento a direita da multiplicacao
        srl         $t2, $t2, 1
        
        beq         $t5, $zero, dif1
        ori         $t1, $t1, -2147483648
dif1:
        addi        $t3, $t3, 1
        j Loop1
Saida:
        # caso as entradas possuam sinais diferentes
        beq         $t6, $t7, SaidaPrin

        nor         $t1, $t1, $zero #tornando oposto bit a bit de t1		
        
        addi        $t1, $t1, 1 # somando 1 ao t1

        #tornando oposto bit a bit de t2
        #somando 1 ao t2

        #verifica se hi é maior que 0
        #caso seja, fazer complemento a 2

        slt         $t5, $zero, $t2
        beq         $t5, $zero, HiNegativo

        nor		    $t2, $t2, $zero #tornando oposto bit a bit de t2		
      
        addi        $t2, $t2, 1 #somando 1 ao t2

HiNegativo:
        addi        $t2, $t2, -1

SaidaPrin:
        mthi $t2
        mtlo $t1

        jr $ra
.data 

overflowtxt: .asciiz "overflow"
        
.text

main: 

#le o primeiro numero, que indica a operação com ou sem sinal
li      $v0, 5 
syscall
move $t5, $v0

#le o segundo numero, primeiro operando da soma
li       $v0, 5 
syscall
move $t6, $v0

#le o terceiro numero, segundo operando da soma
li       $v0, 5 
syscall
move $t7, $v0


addu $t0,$t6,$t7 #faz a soma ignorando overflow


beq $t5,$zero,SemSinal #se o numero inserido for igual a 0,desvia para Semsinal

#Tratamento das operacoes com sinal
xor $t1,$t6,$t7

slt $t1,$t1,$zero
bne $t1,$zero,SemOverflow #caso exista diferenca,desvia para SemOverflow

xor $t1,$t0,$t6
slt $t1,$t1,$zero
bne $t1,$zero,Overflow #se o resultado for diferente ,desvia para Overflow
j SemOverflow
#Mensagem de overflow

Overflow:

li $v0,4
la $a0,overflowtxt
syscall

#encerra o programa
li      $v0,10
syscall

#printa o resultado da soma caso haja overflow
SemOverflow:

li   $v0, 1
move $a0, $t0
syscall

#encerra o programa
li      $v0,10
syscall


#Operacoes sem sinal
SemSinal:

nor $t1,$t6,$zero
sltu $t1,$t1,$t7
bne $t1,$zero,Overflow

j SemOverflow

#encerra o programa
#li      $v0,10
#syscall
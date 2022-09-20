.data 


const: .double 100.00

.text

main: 


#f1 custo
#f2  Lucro
#f0  imposto

#le o primeiro numero, que indica o valor do custo de fábrica
li      $v0, 7
syscall
mov.d   $f14,$f0
#le o segundo numero, que indica a porcentagem de lucro
li     $v0, 7 
syscall
mov.d   $f2,$f0

#le o segundo numero, que indica o valor da porcentagem de impostos
li     $v0, 7
syscall

la          $t0, const
ldc1        $f16, 0($t0)#carrega a constante

#Primeira procentagem
div.d $f2,$f2,$f16

#Segunda porcentagem
div.d $f0,$f0,$f16

#Lucro
mul.d $f18,$f2,$f14

#Impostos
mul.d $f4,$f0,$f14

#custo
add.d $f20,$f18,$f4
add.d $f6,$f20,$f14

#print custo

li         $v0, 3
mov.d      $f12, $f6
syscall

#encerra o programa
li      $v0,10
syscall
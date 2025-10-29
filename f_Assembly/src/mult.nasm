; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]




leaw $1, %A 
movw (%A), %D
leaw $2, %A
movw %D, (%A)


leaw $0, %A
movw %A, %D
leaw $1, %A
movw %D, (%A);zera o ram 1

SOMA:
leaw $0, %A 
movw (%A), %D; valor de 0 em D

leaw $1, %A
movw (%A), %A ; valor de 1 em A

addw %A, %D, %D; D= A+D

leaw $1 %A 
movw %D, (%A); RAM1 = soma


leaw $2, %A;
movw (%A), %D ; D = RAM2
decw %D;        D= D-1
movw %D,(%A);    RAM2 = D


leaw $SOMA, %A; A=SOMA
jg %D; Se D >0, ir para soma
nop

leaw $1, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)










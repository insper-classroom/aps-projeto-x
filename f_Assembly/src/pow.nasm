; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


leaw $1, %A 
movw (%A), %D
leaw $0, %A
movw %D, (%A)



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
leaw $0, %A
movw %D, (%A)















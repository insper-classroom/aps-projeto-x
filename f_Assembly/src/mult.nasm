leaw $1, %A 
movw (%A), %D
leaw $ELSE, %A
jl %D
nop
leaw $2, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
ELSE:
notw %D
leaw $2 %A
movw %D, (%A)
END:



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
jge %D; Se D >0, ir para soma
nop

leaw $1, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)



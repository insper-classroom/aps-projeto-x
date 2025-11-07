leaw $0, %A
movw %A, (%A)


leaw $1, %A
movw %A, %D


leaw $5, %A
movw (%A), %A

andw %A, %D, %D

;se impar D >0. Se par D = 0

leaw $FIM, %A ; SE D>0
jg %D
nop

;Só precisa fazer isso se D for Par
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D (%A)

FIM:


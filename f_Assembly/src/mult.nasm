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


SOMA:
leaw $0, %A 
movw (%A), %D
leaw $1, %A
movw (%A), %A
addw %A, %D, %D
leaw $0 %A
movw %D, (%A)


leaw $2, %A
movw (%A), %A
decw %A
movw %A, (%A)
movw %A, %D

leaw $SOMA, %A
jle %D
nop





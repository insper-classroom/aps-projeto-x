leaw $5, %A 
movw (%A), %D
leaw $ENDABS, %A
jg %D
nop

negw %D
leaw $5, %A
movw %D, (%A)

ENDABS:

;MOVENDO
leaw $2, %A
movw %A, %D
leaw $1, %A
movw %D, (%A); RAM 1 = 2


leaw $5, %A ; RAM 0 = RAM 5
movw (%A), %D
leaw $0, %A
movw %D, (%A)
;MOVENDO

SUB:
leaw $1, %A 
movw (%A), %D
leaw $0, %A
movw (%A), %A
subw %A, %D, %D
leaw $0 %A
movw %D, (%A)

leaw $CHECADOR, %A
jle %D
nop

leaw $SUB, %A
jmp
nop

CHECADOR:

leaw $0, %A
movw (%A), %D

leaw $PAR, %A
je %D
nop

leaw $0, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

leaw $GGG %A
jmp
nop

PAR:
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

GGG:

;CHECADOR


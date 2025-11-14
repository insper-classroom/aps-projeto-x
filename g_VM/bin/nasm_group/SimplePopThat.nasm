; 0 - POP that 0
leaw $0, %A
movw %A, %D
leaw $THAT, %A
movw (%A), %A
addw %D, %A, %D
leaw $R13, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 1 - POP that 1
leaw $1, %A
movw %A, %D
leaw $THAT, %A
movw (%A), %A
addw %D, %A, %D
leaw $R13, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 2 - POP that 2
leaw $2, %A
movw %A, %D
leaw $THAT, %A
movw (%A), %A
addw %D, %A, %D
leaw $R13, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; End

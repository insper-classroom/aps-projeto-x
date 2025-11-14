; 0 - POP local 0
leaw $0, %A
movw %A, %D
leaw $LCL, %A
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
; 1 - POP local 1
leaw $1, %A
movw %A, %D
leaw $LCL, %A
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
; 2 - POP local 2
leaw $2, %A
movw %A, %D
leaw $LCL, %A
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

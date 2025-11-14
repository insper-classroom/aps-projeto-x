; 0 - PUSH this 0
leaw $0, %A
movw %A, %D
leaw $THIS, %A
movw (%A), %A
addw %D, %A, %D
movw %D, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 1 - PUSH this 1
leaw $1, %A
movw %A, %D
leaw $THIS, %A
movw (%A), %A
addw %D, %A, %D
movw %D, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - PUSH this 2
leaw $2, %A
movw %A, %D
leaw $THIS, %A
movw (%A), %A
addw %D, %A, %D
movw %D, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End

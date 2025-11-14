; 0 - PUSH local 0
leaw $0, %A
movw %A, %D
leaw $LCL, %A
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
; 1 - PUSH local 1
leaw $1, %A
movw %A, %D
leaw $LCL, %A
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
; 2 - PUSH local 2
leaw $2, %A
movw %A, %D
leaw $LCL, %A
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

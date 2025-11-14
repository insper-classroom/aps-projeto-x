; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 6 - PUSH argument 0
leaw $0, %A
movw %A, %D
leaw $ARG, %A
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
; 7 - PUSH argument 1
leaw $1, %A
movw %A, %D
leaw $ARG, %A
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
; 8 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End

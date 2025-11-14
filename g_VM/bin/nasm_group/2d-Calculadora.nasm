; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 4 - POP temp 2
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $7, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 7 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 8 - POP local 0
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
; 9 - PUSH argument 1
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
; 10 - POP local 1
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
; 11 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 12 - PUSH local 1
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
; 13 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_14, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_15, %A
jmp
nop
TRUE_14:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_15:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 17 - PUSH local 0
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
; 18 - PUSH argument 0
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
; 19 - ADD
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
; 20 - POP local 0
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
; 21 - PUSH local 1
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
; 22 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 23 - SUB
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 24 - POP local 1
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
; 26 - PUSH local 0
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
; End

; 0 - PUSH constant 5
leaw $5, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 1 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 3 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_4, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_5, %A
jmp
nop
TRUE_4:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_5:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 7 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 8 - POP temp 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $5, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 9 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 10 - PUSH constant 9
leaw $9, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 11 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_12, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_13, %A
jmp
nop
TRUE_12:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_13:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 15 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 16 - POP temp 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $6, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; End

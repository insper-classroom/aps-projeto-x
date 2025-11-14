; 0 - PUSH constant 17
leaw $17, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 1 - PUSH constant 17
leaw $17, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_3, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_4, %A
jmp
nop
TRUE_3:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_4:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 5 - PUSH constant 17
leaw $17, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 6 - PUSH constant 16
leaw $16, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 7 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_8, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_9, %A
jmp
nop
TRUE_8:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_9:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 10 - PUSH constant 16
leaw $16, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 11 - PUSH constant 17
leaw $17, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 12 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_13, %A
jeqw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_14, %A
jmp
nop
TRUE_13:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_14:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 15 - PUSH constant 892
leaw $892, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 16 - PUSH constant 891
leaw $891, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 17 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_18, %A
jltw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_19, %A
jmp
nop
TRUE_18:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_19:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 20 - PUSH constant 891
leaw $891, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 21 - PUSH constant 892
leaw $892, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 22 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_23, %A
jltw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_24, %A
jmp
nop
TRUE_23:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_24:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 25 - PUSH constant 891
leaw $891, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 26 - PUSH constant 891
leaw $891, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 27 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_28, %A
jltw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_29, %A
jmp
nop
TRUE_28:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_29:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 30 - PUSH constant 32767
leaw $32767, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 31 - PUSH constant 32766
leaw $32766, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 32 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_33, %A
jgtw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_34, %A
jmp
nop
TRUE_33:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_34:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 35 - PUSH constant 32766
leaw $32766, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 36 - PUSH constant 32767
leaw $32767, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 37 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_38, %A
jgtw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_39, %A
jmp
nop
TRUE_38:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_39:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 40 - PUSH constant 32766
leaw $32766, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 41 - PUSH constant 32766
leaw $32766, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 42 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %D
leaw $TRUE_43, %A
jgtw %D, %A
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $END_44, %A
jmp
nop
TRUE_43:
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
leaw $0, %A
movw %A, %D
decw %D
movw %D, (%A)
END_44:
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 45 - PUSH constant 57
leaw $57, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 46 - PUSH constant 31
leaw $31, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 47 - PUSH constant 53
leaw $53, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 48 - ADD
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
; 49 - PUSH constant 112
leaw $112, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 50 - SUB
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
; 51 - NEG
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
negw %D
movw %D, (%A)
; 52 - AND
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
andw (%A), %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 53 - PUSH constant 82
leaw $82, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 54 - OR
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
orw (%A), %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 55 - NOT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
notw %D
movw %D, (%A)
; End

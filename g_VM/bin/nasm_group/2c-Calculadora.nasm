; Inicialização para VM
leaw $Main.main, %A
jmp
nop
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
; 2 - PUSH constant 5
leaw $5, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 4 - POP temp 1
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

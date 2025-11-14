; 0 - POP pointer 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THIS, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; 1 - POP pointer 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THAT, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %D
decw %D
leaw $SP, %A
movw %D, (%A)
; End

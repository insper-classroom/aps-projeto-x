; 0 - OR
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
; End

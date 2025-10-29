; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!



leaw $21185, %A

movw (%A), %D

leaw $7, %A

andw %A, %D, %D

notw %D

leaw $7, %A

andw %A, %D, %D

leaw $248, %A

orw %A, %D, %D

leaw $21184, %A

movw %D, (%A)

leaw $ENDLED, %A

jmp

ENDLED:

nop


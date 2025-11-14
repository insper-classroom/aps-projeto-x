; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos


leaw $FIM, %A
je %D
nop

SUB:
leaw $4, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)


leaw $1, %A 
movw (%A), %D
leaw $0, %A
movw (%A), %A
subw %A, %D, %D
leaw $0 %A
movw %D, (%A)

leaw $4, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $0 %A
movw (%A), %D
leaw $SUB, %A
jge %D
nop

;Multiplicar o inteiro pelo dividendo e subtrair do divisor
; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw %0, %A
movw %A, (%A)


leaw $2, %A
movw %A, %D
leaw %1, %A
movw %D, (%A)




leaw $1, %A

movw (%A), %D

leaw $FIM, %A
je %D
nop


SUB:
leaw $1, %A 
movw (%A), %D
leaw $5, %A
movw (%A), %A
subw %A, %D, %D
leaw $5 %A
movw %D, (%A)

leaw $5 %A
movw (%A), %D
leaw $SUB, %A
jg %D
nop


leaw %5, %A
movw (%A), %D
leaw $FIM, %A
jne %D
nop

leaw %1, %A;
movw %A, %D
leaw $0,%A
movw %D, (%A)



FIM:

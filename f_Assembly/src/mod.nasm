; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

leaw $0, %A
movw (%A), %D
leaw $5, %A
movw %D, (%A)

leaw $1, %A
movw (%A), %D
leaw $6, %A
movw %D, (%A)



leaw $1, %A

movw (%A), %D



leaw $FIM, %A
je %D
nop

SUB:
leaw $4, %A
movw (%A), %D
leaw $3, %A
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
nop ;AAAAAAAAAAAAAAAAAAAAAAAAAAAA


;Multiplicar o inteiro pelo dividendo e subtrair do divisor


leaw $3, %A 
movw (%A), %D
leaw $0, %A
movw %D, (%A)


leaw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A);zera o ram 1

SOMA:
leaw $6, %A 
movw (%A), %D; valor de 0 em D

leaw $3, %A
movw (%A), %A ; valor de 1 em A

addw %A, %D, %D; D= A+D

leaw $3 %A 
movw %D, (%A); RAM1 = soma


leaw $0, %A;
movw (%A), %D ; D = RAM2
decw %D;        D= D-1
movw %D,(%A);    RAM2 = D


leaw $SOMA, %A; A=SOMA
jg %D; Se D >0, ir para soma
nop

leaw $3, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)

leaw $4, %A 

movw (%A), %D

leaw $5, %A

movw (%A), %A

subw %A, %D, %D

leaw $2 %A

movw %D, (%A)







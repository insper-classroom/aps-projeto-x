; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


; Calcula o tamanho de uma string que começa em RAM[8]
; A string termina em NULL (valor 0)
; O resultado é armazenado em RAM[0]

        leaw $8, %A           ; endereço inicial da string
        movw %A, %S           ; %S = ponteiro para a string
        movw $0, %D           ; %D = contador = 0

LOOP:
        movw (%S), %A         ; %A = valor atual da string (caractere)
        jeq END               ; se %A == 0 (NULL), fim da string
        incw %D               ; incrementa o contador
        incw %S               ; avança para o próximo caractere
        jmp LOOP              ; repete o loop

END:
        leaw $0, %A           ; endereço onde salvar o resultado
        movw %D, (%A)         ; RAM[0] = contador (tamanho da string)
        nop

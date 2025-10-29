// mov.nasm
// Movimento de dados na memória RAM
// RAM[0] = RAM[1]
// RAM[1] = RAM[0]
// RAM[3] = 1


leaw $0, %A

movw (%A), %D

leaw $2, %A

movw %D, (%A)

leaw $1, %A

movw (%A), %D

leaw $0, %A

movw %D, (%A)

leaw $2, %A

movw (%A), %D

leaw $1, %A

movw %D, (%A)

leaw $1, %D

leaw $3, %A

movw %D, (%A)

leaw $END, %A

jmp

END:

nop





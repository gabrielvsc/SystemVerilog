# Roteiro 3

## Problema 1
Construir em SystemVerylog, utilizando o ambiente FPGA remoto, a ULA descrita a seguir.

**Código das operações**
F[1:0]	Operação
00	A + B
01	A - B
10	A AND B
11	A OR B

**Entradas**
Dois valores A e B (inteiros com sinal), com tamanho de 3 bits cada, são os operadores. Para A, usar as chaves SWI[7:5] e para B, as chaves SWI[2:0].

Um vetor F[1:0] de 2 bits, que representa o seletor das operações da ULA, conforme a tabela. Utilizar as SWI[4:3] para F.

**Saídas**

O resultado da operação Y, com 3 bits, deverá ser apresentado nos LED[2:0]. Visualizar o resultado também em base decimal no Display de 7 segmentos (SEG[7:0]).

Para as operações aritméticas, indicar a ocorrência de overflow ou underflow no LED[7]. No caso de overflow ou underflow não importa o que estiver no Display de 7 segmentos.

Você deverá usar a representação de complemento de 2.

# Correção

**NOTA: 10,0/10,0**
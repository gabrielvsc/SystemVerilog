# Roteiro 2

## Problema 1
Você precisa projetar um circuito para controlar um sistema de irrigação automático. Seu sistema possui dois sensores de umidade (SWI[1:0]), que avaliam a umidade do solo em duas áreas diferentes da área a ser irrigada e enviam sinais para o seu circuito, conforme a tabela a seguir.

Entradas (SWI[1:0])	Saídas
00	Áreas 1 e 0 com umidade adequada.
01	Área 1 com umidade adequada e Área 0 com baixa umidade.
10	Área 1 com baixa umidade e Área 0 com umidade adequada.
11	Áreas 1 e 0 com baixa umidade.


Você deve usar o display de 7 segmentos (SEG[7:0]) para indicar quais áreas estão com baixa umidade, de acordo com a codificação a seguir.

- Display apagado: as duas áreas com umidade adequada;
- Display mostrando 0: área 0 com baixa umidade;
- Display mostrando 1: área 1 com baixa umidade;
- Display mostrando 2: as duas áreas com baixa umidade.

## Problema 2
Construir, em FPGA, um circuito digital que faz o roteamento entre duas informações de 2 bits, A (SWI[7:6]) e B (SWI[5:4]) e transmite a informação selecionada (utilizando a variável de seleção, (SWI[3]) para um único canal de comunicação (LED[7:6]).

# Correção

**NOTA: 9,0/10,0**

Problema 1
O circuito definido no problema tem o comportamento definido pela tabela abaixo.

O circuito submetido está correto.

Área 1
SWI[1]	Área 0
SWI[0]	Display
SEG
0	0	apagado
0	1	0
1	0	1
1	1	2

Problema 2
O circuito definido no problema tem o comportamento definido pela tabela abaixo.

O circuito submetido está parcialmente correto. 

Usou o LED[1:0] em vez do LED[7:6].

A
SWI[7:6]	B
SWI[5:4]	S
SWI[3]	Saída
LED[7:6]
A	B	0	A
A	B	1	B
Codificação invertendo S foram aceitas (S=0 => Y=B e S=1 => Y=A).
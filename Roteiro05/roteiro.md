# Roteiro 5

Descrição
Construir, em FPGA, um circuito contendo um Contador Síncrono Hexadecimal de 4 bits e uma FSM que detecta uma sequência de pelo menos três bits 1 conforme a descrição a seguir.

Na descrição abaixo, observe que o reset deve afetar os dois circuitos simultaneamente.

## Contador Hexadecimal
Construir, em FPGA, um Contador Síncrono Hexadecimal de 4 bits, o qual poderá realizar a contagem crescente ou decrescente, conforme descrição a seguir.

1. Reset: SWI[0].
2. Entrada de Seleção da Contagem (Crescente (0) ou Decrescente (1)): SWI[1].
3. Entrada paralela: SWI[7:4] (opcional, se desejar usar uma entrada load, para variar o valor inicial). Nesse caso, usar SWI[2] (1 para habilitar load) para fazer o load do valor.
4. Clock (clk_2): LED[7].
5. Utilizar os o Display de Sete Segmentos (hexadecimal) para exibição das saídas.

## Detector de sequência
Construir, em FPGA, uma FSM para detectar uma sequência de três ou mais bits iguais a 1, conforme a descrição a seguir.

1. Reset: SWI[0].
2. Entrada serial: SWI[3].
3. Saída: LED[0] (1, se detectou a sequência e 0, se não detectou).

# Correção

**NOTA: 10,0/10,0**
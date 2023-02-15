# Roteiro 4

## Problema 1 - Registrador paralelo/serial de 4 bits
Implemente um registrador paralelo/serial de 4 bits. Esse registrador deverá realizar o armazenamento de forma serial ou paralela, conforme a descrição a seguir.

SWI[1]: switch de reset para "zerar" o registrador;
SWI[2]: seleção da entrada serial (0) ou paralela (1);
SWI[3]: entrada serial (caso a função entrada serial seja selecionada);
SWI[7:4]: entrada paralela;
LED[7:4]: exibição da saída.

## Problema 2 - Memória RAM R/W 4x4
Implemente uma memória RAM R/W 4x4. Esta memória deverá funcionar conforme a descrição a seguir.

SWI[1]: seleção de escrita (1) ou leitura (0);
SWI[3:2]: endereço de entrada;
SWI[7:4]: dados de entrada;
LED[7:4]: exibição da saída.

## Problema 3 - Memória RAM ROM 4x4
Implemente uma memória RAM ROM 4x4. Esta memória deverá funcionar conforme a descrição a seguir.

SWI[3:2]: endereço de entrada;
LED[7:4]: exibição da saída.
Os seguintes dados devem ser armazenados na memória.

Endereço	Dado armazenado
00	            0011
01	            0110
10	            1001
11	            1100

# Correção

**NOTA: 10,0/10,0**
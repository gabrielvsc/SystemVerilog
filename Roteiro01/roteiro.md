# Roteiro 1

## Problema 1 – Agência Bancária
Uma agência bancária possui um cofre que só pode ser aberto no horário do expediente do banco e este horário é controlado por um relógio eletrônico. Durante o expediente, um interruptor situado na mesa do gerente deve estar desligado para que o cofre possa ser aberto. Se as condições descritas não forem satisfeitas e, mesmo assim, o cofre for aberto, deve-se soar uma sirene de alarme, ou seja, para não soar o alarme na abertura do cofre, deve-se estar em horário de expediente e com o interruptor desligado.

**Entrada (Sensores)**

- **Porta do cofre**
cofre = 0 - porta aberta
cofre = 1 - porta fechada
chave SWI[0]
- **Relógio eletrônico**
relogio = 0 - fora do expediente
relogio = 1 - horário de expediente
chave SWI[1]
- **Interruptor na mesa do gerente**
gerente = 0 - alarme desativado
gerente = 1 - alarme ativado
chave SWI[2]

**Saída (Atuadores)**

- **Alarme**
0 – silencioso
1 – gerando sinal sonoro
sinal luminoso LED[1]

Construir, em FPGA, o circuito do alarme do cofre.

## Problema 2 - Estufa
Uma estufa deve manter a temperatura interna sempre na faixa entre 15°C e 20°C controlada automaticamente por um sistema de controle digital. Para tanto, foram instalados internamente dois sensores de temperatura que fornecem níveis lógicos 0 e 1 nas seguintes condições:

- T1 = 1 para temperatura ≥ 15°C: chave SWI[7]; e
- T2 = 1 para temperatura ≥ 20°C: chave SWI[6].
- 
Construir, em FPGA, o sistema de controle da temperatura desta estufa a partir do acionamento de um aquecedor A (LED[7]) ou um resfriador R (LED[6]) sempre que a temperatura interna cair abaixo de 15°C ou subir acima de 20°C, respectivamente. Em caso de inconsistência dos sinais dos sensores de temperatura, um sinal luminoso vermelho (SEG[7]) deve acender e, nem o resfriamento nem o aquecimento, devem ser acionados

# Correção

**NOTA: 8,5/10,0**

Problema 1
O circuito definido no problema tem o comportamento definido pela tabela verdade abaixo.

O circuito submetido contém erros. O significado do SWI[0] (da porta) está invertido.

porta	relogio	horario	alarme
SWI[0]	SWI[1]	SWI[2]	LED[1]
0	0	0	1
0	0	1	0
0	1	0	1
0	1	1	1
1	0	0	0
1	0	1	0
1	1	0	0
1	1	1	0
Problema 2
O circuito definido no problema tem o comportamento definido pela tabela verdade abaixo.

O circuito submetido está correto.

T1	T2	Aquec.	Resfr.	Alarme
SWI[7]	SWI[6]	LED[7]	LED[6]	SEG[7]
0	0	1	0	0	T < 15
0	1	0	0	1	erro nos sensores
1	0	0	0	0	15 < T < 20
1	1	0	1	0	T > 20

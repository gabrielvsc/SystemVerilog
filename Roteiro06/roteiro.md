# Roteiro 6

## Problema 1 - Código em Assembly
Implementar, a partir do arquivo inst.s, o trecho de código abaixo para RISC-V.

.text
main:
        addi a0, zero, 1
        add a1, a0, a0
        addi a2, zero, 5
loop:   
        beq a0, a2, fim
        slli a1, a1, 1
        addi a0, a0, 1
        j loop
fim:
        nop
Responda as perguntas a seguir (as respostas deverão ser enviadas em um arquivo PDF).

Qual é a operação realizada pelo código acima?
Qual é o conteúdo (em decimal) dos registradores a0, a1 e a2 ao final da execução do programa?
Quais são os valores de loop (na instrução j loop) e fim (na instrução beq a0, a2, fim)?
Adicione "prints" da tela do simulador ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina armazenado na memória, valores do pc e dos demais registradores envolvidos).

## Problema 2 - Código de Máquina
Implementar o trecho de código abaixo para RISC-V.

0x00200513
0x00400593
0x00b50663
0x00a50633
0x0080006f
0x00b58633
0x00000013
Responda as perguntas a seguir (as respostas deverão ser enviadas em um arquivo PDF).

Qual é o código em Assembly correspondente?
Qual é a operação realizada pelo código acima?
Quais são os registradores utilizados no código?
Quais são os conteúdos desses registradores ao final da execução do programa
Adicione "prints" da tela do simulador ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina armazenado na memória, valores do pc e dos demais registradores envolvidos).

# Correção

**NOTA: 6,5/10,0**

Problema 1
O programa calcula 2 elevado a 5.
Os valores em decimal são 5, 32 e 5, respectivamente.
loop e fim são endereços, com valores 0x0000000C e 0x0000001C, respectivamente. Outra resposta correta seria -12 e 16, considerando o deslocamento.
ok.
Problema 2
ok.
Soma a0 (x10, com valor 2)) com a0 e coloca em a2 (x12).
a0, a1 e a2.
a0 = 2, a1 = 4 e a2 = 4.
Sem os prints.
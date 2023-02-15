# Roteiro 8

## Execução de Instruções (paralelismo: pipeline)

Selecionar o processador RISC-V com pipeline: Menu horizontal -> “símbolo do processador ->Select Processor -> RISC-V –> 32-bit -> 5-stage processor w/o fo.... (A 5-Stage processor w/o forwarding unit) -> OK”.

Implementar dois códigos em Assembly – RISC-V, conforme descrição a seguir (Obs.: Procedimento para criar um novo código: “File -> New Program”)

Código 1:

        addi x10, x0, 4
        addi x11, x0, 3
        addi x12, x0, 7
        addi x13, x0, 5
        addi x14, x0, 6
        add x15, x10, x11

Código 2:

        addi x10, x0, 4
        add x11, x0, x10
        addi x12, x0, 7
        addi x13, x0, 5
        addi x14, x0, 6
        add x15, x10, x11

Para cada código, realizar as ações descritas a seguir. Exibir informações que comprovem a execução dessas ações . Você deverá enviar um único arquivo PDF contento a impressão da tela e uma breve descrição.
Observar o conteúdo da memória (“Instruction memory”) e dos registradores (“Registers”).
Executar o código passo a passo, para observar a passagem em cada estágio do Pipeline (Selecionar o ícone Processor”, em seguida, o botão “Show pipeline diagram”).
Verificar, ao final, o resultado da execução em Pipeline. Para tanto, selecionar e apresentar o “Pipeline Diagram” e “Execution info” e “Registers” (com destaque para os registradores envolvidos). Justificar os resultados apresentados.

Selecionar o processador RISC-V com outra opção de pipeline: Menu horizontal -> “símbolo do processador ->Select Processor -> RISC-V –> 32-bit -> 5-stage processor w/o for.... (5-stage processor w/o forwarding or hazard detection) -> OK”. Comente os resultados obtidos (observar “Pipeline Diagram” e “Execution info” e registradores envolvidos).

# Correção

**NOTA: 9,0/10,0**

CÓDIGO 1

Apresentou parte significativa das telas e comentou os resultados obtidos.

CÓDIGO 2

Apresentou parte significativa das telas e comentou os resultados obtidos.
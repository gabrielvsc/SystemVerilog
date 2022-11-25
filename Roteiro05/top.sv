// Gabriel Victor de Vasconcelos Cesário - 120210143
// Roteiro 05

parameter divide_by=100000000;  // divisor do clock de referência
// A frequencia do clock de referencia é 50 MHz.
// A frequencia de clk_2 será de  50 MHz / divide_by

parameter NBITS_INSTR = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32, NBITS_LCD = 64;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NBITS_LCD-1:0] lcd_a, lcd_b,
           output logic [NBITS_INSTR-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData, 
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);

  always_comb begin
    //SEG <= SWI;
    lcd_WriteData <= SWI;
    lcd_pc <= 'h12;
    lcd_instruction <= 'h34567890;
    lcd_SrcA <= 'hab;
    lcd_SrcB <= 'hcd;
    lcd_ALUResult <= 'hef;
    lcd_Result <= 'h11;
    lcd_ReadData <= 'h33;
    lcd_MemWrite <= SWI[0];
    lcd_Branch <= SWI[1];
    lcd_MemtoReg <= SWI[2];
    lcd_RegWrite <= SWI[3];
    for(int i=0; i<NREGS_TOP; i++)
       if(i != NREGS_TOP/2-1) lcd_registrador[i] <= i+i*16;
       else                   lcd_registrador[i] <= ~SWI;
    lcd_a <= {56'h1234567890ABCD, SWI};
    lcd_b <= {SWI, 56'hFEDCBA09876543};
  end

  // Problema - Contador Hexadecimal

  parameter NBITS_COUNT = 4;
  parameter NUM_0 = 'b00111111;
  parameter NUM_1 = 'b00000110;
  parameter NUM_2 = 'b01011011;
  parameter NUM_3 = 'b01001111;
  parameter NUM_4 = 'b01100110;
  parameter NUM_5 = 'b01101101;
  parameter NUM_6 = 'b01111101;
  parameter NUM_7 = 'b00000111;
  parameter NUM_8 = 'b01111111;
  parameter NUM_9 = 'b01101111;
  parameter NUM_A = 'b01110111;
  parameter NUM_B = 'b01111100;
  parameter NUM_C = 'b01011000;
  parameter NUM_D = 'b01011110;
  parameter NUM_E = 'b01111001;
  parameter NUM_F = 'b01110001;
 
  logic [NBITS_COUNT-1:0] Data_in, Count;
  logic reset, load, count_up, counter_on;

  always_comb reset <= SWI[0];
  always_comb count_up <= SWI[1];
  always_comb Data_in <= SWI[7:4];

  always_ff @(posedge reset or posedge clk_2) begin
    if(reset)
      Count <= 0;
    
    else if(!count_up)
        Count <= Count + 1;
    else Count <= Count -1;

    case(Count)
      0: SEG <= NUM_0;
      1: SEG <= NUM_1;
      2: SEG <= NUM_2;
      3: SEG <= NUM_3;
      4: SEG <= NUM_4;
      5: SEG <= NUM_5;
      6: SEG <= NUM_6;
      7: SEG <= NUM_7;
      8: SEG <= NUM_8;
      9: SEG <= NUM_9;
      10: SEG <= NUM_A;
      11: SEG <= NUM_B;
      12: SEG <= NUM_C;
      13: SEG <= NUM_D;
      14: SEG <= NUM_E;
      15: SEG <= NUM_F;
    endcase
  end

  always_comb LED[7] <= clk_2;

  // Problema - Detector de Sequência

  parameter size = 2;
  
  //Reset já está definido. SWI[0]
  logic in_bit, out_bit;

  always_comb in_bit <= SWI[3];

  enum logic [size-1:0] {A, B, C, D } state;

  always_ff @(posedge clk_2)
    if (reset) state <= A;
    else
      unique case (state)
        A:
          if(in_bit == 0)
            state <= A;
          else
            state <= B;
        B:
          if(in_bit == 0)
            state <= A;
          else
            state <= C;
        C:
          if(in_bit == 0)
            state <= A;
          else
            state <= D;
        D:
          if(in_bit == 0)
            state <= A;
          else
            state <= D;
      endcase

  always_comb out_bit <= (state == D);
  
  always_comb LED[0] <= out_bit;

endmodule
// Gabriel Victor de Vasconcelos Cesário - 120210143
// Roteiro 03
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

  parameter NBITS_OPERAND = 3; 
  parameter NBITS_OPERATION_RESULT = 7;
  parameter NBITS_OPERATION_RESULT_LED = 6;
  parameter NBITS_OPERATION_SELECT = 2;

  logic signed[NBITS_OPERAND - 1:0] A, B;
  logic [NBITS_OPERATION_SELECT - 1:0] F;

  logic signed[NBITS_OPERATION_RESULT - 1:0] result;
  logic signed[NBITS_OPERATION_RESULT_LED - 1:0] result_LED;
  logic overflow_underflow;

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
  parameter DOT = 'b10000000;

  always_comb begin
      F <= SWI[4:3];
      A <= SWI[7:5];
      B <= SWI[2:0];
  end

  always_comb begin
    LED[NBITS_OPERATION_RESULT_LED - 1: 0] <= result_LED; 
    LED[7] <= overflow_underflow;

    case (result) 
      -9: SEG <= NUM_9 + DOT;
      -8: SEG <= NUM_8 + DOT;
      -7: SEG <= NUM_7 + DOT;
      -6: SEG <= NUM_6 + DOT;
      -5: SEG <= NUM_5 + DOT;
      -4: SEG <= NUM_4 + DOT;
      -3: SEG <= NUM_3 + DOT;
      -2: SEG <= NUM_2 + DOT;
      -1: SEG <= NUM_1 + DOT;
    
      1: SEG <= NUM_1;
      2: SEG <= NUM_2;
      3: SEG <= NUM_3;
      4: SEG <= NUM_4;
      5: SEG <= NUM_5;
      6: SEG <= NUM_6;
      7: SEG <= NUM_7;
      8: SEG <= NUM_8;
      9: SEG <= NUM_9;
    
      default: SEG <= NUM_0;
    endcase    
  end

  always_comb begin 
    case(F)
      'b01: result <= A - B;  
      'b10: result <= A & B; 
      'b11: result <= A | B; 
      default: result <= A + B;
    endcase

    case(F)
      'b01: result_LED <= result[(NBITS_OPERATION_RESULT_LED / 2) - 1: 0];
      'b10: result_LED <= result[NBITS_OPERATION_RESULT_LED - 1: 0];
      'b11: result_LED <= result[NBITS_OPERATION_RESULT_LED - 1: 0]; 
      default: result_LED <= result[(NBITS_OPERATION_RESULT_LED / 2) - 1: 0];
    endcase

    overflow_underflow <= (result < -(2 ** (NBITS_OPERAND - 1))) || (result > (2 ** (NBITS_OPERAND - 1)) - 1); 
  end

endmodule
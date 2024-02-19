/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Sumio Morioka and Akashi Satoh
// Adapted by: 
// 
// Create Date: 08/2022
// Module Name: pprm_inverter
// Project Name: aes_sboxes
// Description: GF(2^8) inverter for the 3-Stage Positive-Polarity
//              Reed Muller S-box.
// 
// Dependencies: pprm_stage_1, pprm_stage_2, pprm_stage_3.
// 
// Additional Comments: Based on design from "An Optimized S-Box Circuit
//                      Architecture for Low Power AES Design".
// 
//////////////////////////////////////////////////////////////////////////////////

module pprm_inverter (
        input   wire    [7:0]   inverter_in,
        output  wire    [7:0]   inverter_out
    );
    
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [3:0] A,B,C,D;

    //----------------------------------------------------------------
    // Module instantiations
    //----------------------------------------------------------------
    // PPRM Inverter Stage 1
    pprm_stage_1 stage1(
        .X(inverter_in),
        .A(A),
        .B(B),
        .C(C)
    );

    // PPRM Inverter Stage 2
    pprm_stage_2 stage2(
        .C(C),
        .D(D)
    );

    // PPRM Inverter Stage 3
    pprm_stage_3 stage3(
       .A(A),
       .B(B),
       .D(D),
       .Y(inverter_out)
    );
    
endmodule // pprm_inverter
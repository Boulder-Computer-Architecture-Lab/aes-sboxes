/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Sumio Morioka & Akashi Satoh
// Editor: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: pprm_stage_2
// Project Name: aes-sboxes
// Description: Stage 2 of the 3-stage PPRM inverter.
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "An Optimized S-Box Circuit
//                      Architecture for Low Power AES Design".
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module pprm_stage_2 (
        input   wire    [3:0]   C,
        output  wire    [3:0]   D
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign D[3] = (C[3] & C[2] & C[1]) ^ (C[3] & C[0]) ^ C[3] ^ C[2];
    assign D[2] = (C[3] & C[2] & C[0]) ^ (C[3] & C[0]) ^ (C[3] & C[2] & C[1]) ^ (C[2] & C[1]) ^ C[2];
    assign D[1] = (C[3] & C[2] & C[1]) ^ (C[3] & C[1] & C[0]) ^ C[3] ^ (C[2] & C[0]) ^ C[2] ^ C[1];
    assign D[0] = (C[3] & C[2] & C[0]) ^ (C[3] & C[1] & C[0]) ^ (C[3] & C[2] & C[1]) ^ (C[3] & C[1]) ^
                  (C[3] & C[0]) ^ (C[2] & C[1] & C[0]) ^ C[2] ^ (C[2] & C[1]) ^ C[1] ^ C[0];

endmodule // pprm_stage_2
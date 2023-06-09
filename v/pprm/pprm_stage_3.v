/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Sumio Morioka & Akashi Satoh
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: pprm_stage_3
// Project Name: aes-sboxes
// Description: Stage 3 of the 3-stage PPRM inverter.
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

module pprm_stage_3(
        input   wire    [3:0]   A,
        input   wire    [3:0]   B,
        input   wire    [3:0]   D, 
        output  wire    [7:0]   Y
    );

    //----------------------------------------------------------------
    // Continuous assignments
    //----------------------------------------------------------------
    assign Y[7] = (D[3] & A[0]) ^ (D[2] & A[1]) ^ (D[1] & A[2]) ^ (D[0] & A[3]) ^ (A[0] & D[2]) ^ (A[2] & D[0]) ^ (A[1] & D[1]) ^ (A[0] & D[1]) ^ (A[1] & D[0]) ^
                  (B[1] & D[1]) ^ (B[0] & D[1]) ^ (B[1] & D[0]) ^ (B[2] & D[3]) ^ (B[3] & D[2]) ^ (B[2] & D[2]);
    assign Y[6] = (D[2] & A[2]) ^ (A[0] & D[2]) ^ (A[2] & D[0]) ^ (D[3] & A[3]) ^ (D[3] & A[1]) ^ (D[1] & A[3]) ^ (B[2] & D[2]) ^ (B[0] & D[2]) ^ (B[2] & D[0]) ^
                  (B[3] & D[3]) ^ (B[1] & D[3]) ^ (B[3] & D[1]);
    assign Y[5] = (A[0] & D[2]) ^ (A[2] & D[0]) ^ (D[3] & A[3]) ^ (D[3] & A[1]) ^ (D[1] & A[3]) ^ (A[1] & D[1]) ^ (A[0] & D[1]) ^ (A[1] & D[0]) ^ (D[3] & A[2]) ^
                  (D[2] & A[3]) ^ (B[1] & D[1]) ^ (B[0] & D[1]) ^ (B[1] & D[0]) ^ (B[2] & D[3]) ^ (B[3] & D[2]) ^ (B[2] & D[2]);
    assign Y[4] = (A[0] & D[2]) ^ (A[2] & D[0]) ^ (D[3] & A[1]) ^ (D[1] & A[3]) ^ (A[0] & D[1]) ^ (A[1] & D[0]) ^ (A[0] & D[0]) ^ (B[0] & D[2]) ^ (B[2] & D[0]) ^
                  (B[3] & D[3]) ^ (B[1] & D[3]) ^ (B[3] & D[1]) ^ (B[1] & D[1]) ^ (B[0] & D[1]) ^ (B[1] & D[0]) ^ (B[2] & D[3]) ^ (B[3] & D[2]);
    assign Y[3] = (A[0] & D[1]) ^ (A[1] & D[0]) ^ (D[2] & A[2]) ^ (A[0] & D[0]) ^ (D[3] & A[3]) ^ (B[0] & D[3]) ^ (B[1] & D[2]) ^ (B[2] & D[1]) ^ (B[3] & D[0]) ^
                  (B[0] & D[2]) ^ (B[2] & D[0]) ^ (B[1] & D[1]) ^ (B[0] & D[1]) ^ (B[1] & D[0]);
    assign Y[2] = (D[3] & A[1]) ^ (D[3] & A[0]) ^ (D[2] & A[1]) ^ (D[1] & A[3]) ^ (D[1] & A[2]) ^ (D[0] & A[3]) ^ (A[0] & D[0]) ^ (A[1] & D[1]) ^ (B[0] & D[3]) ^
                  (B[1] & D[2]) ^ (B[2] & D[1]) ^ (B[3] & D[0]) ^ (B[0] & D[2]) ^ (B[2] & D[0]) ^ (B[1] & D[1]) ^ (B[0] & D[1]) ^ (B[1] & D[0]);
    assign Y[1] = (A[0] & D[1]) ^ (A[1] & D[0]) ^ (D[2] & A[2]) ^ (A[0] & D[0]) ^ (D[3] & A[3]);
    assign Y[0] = (A[0] & D[2]) ^ (A[2] & D[0]) ^ (D[3] & A[1]) ^ (D[1] & A[3]) ^ (A[0] & D[1]) ^ (A[1] & D[0]) ^ (A[0] & D[0]) ^ (B[2] & D[2]) ^ (B[0] & D[2]) ^
                  (B[2] & D[0]) ^ (B[1] & D[3]) ^ (B[3] & D[1]) ^ (B[0] & D[0]) ^ (B[1] & D[1]) ^ (B[2] & D[3]) ^ (B[3] & D[2]);

endmodule // pprm_stage_3
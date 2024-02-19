/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Sumio Morioka & Akashi Satoh
// Adapted by:
// 
// Create Date: 10/2022
// Module Name: pprm_stage_1
// Project Name: aes_sboxes
// Description: Stage 1 of the 3-stage PPRM inverter.
// 
// Dependencies: None.
// 
// Additional Comments: Based on design from "An Optimized S-Box Circuit
//                      Architecture for Low Power AES Design".
// 
//////////////////////////////////////////////////////////////////////////////////

module pprm_stage_1 (
        input   wire    [7:0]   X,
        output  wire    [3:0]   A,
        output  wire    [3:0]   B,
        output  wire    [3:0]   C
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign A[3] = X[7] ^ X[5];
    assign A[2] = X[7] ^ X[6] ^ X[4] ^ X[3] ^ X[2] ^ X[1];
    assign A[1] = X[7] ^ X[5] ^ X[3] ^ X[2];
    assign A[0] = X[7] ^ X[5] ^ X[3] ^ X[2] ^ X[1];

    assign B[3] = X[5] ^ X[6] ^ X[2] ^ X[1];
    assign B[2] = X[6];
    assign B[1] = X[7] ^ X[5] ^ X[3] ^ X[2] ^ X[6] ^ X[4] ^ X[1];
    assign B[0] = X[7] ^ X[5] ^ X[3] ^ X[2] ^ X[6] ^ X[0];

    assign C[3] = (X[5] & X[1]) ^ (X[7] & X[1]) ^ (X[5] & X[2]) ^ (X[5] & X[6]) ^ (X[5] & X[7]) ^ (X[5] & X[4]) ^
                  (X[7] & X[4]) ^ (X[5] & X[0]) ^ (X[7] & X[0]) ^ (X[3] & X[1]) ^ (X[4] & X[1]) ^ (X[3] & X[2]) ^
                  (X[2] & X[4]) ^ (X[4] & X[6]) ^ (X[2] & X[1]) ^ (X[2] & X[6]) ^ (X[6] & X[1]);
    assign C[2] = (X[6] & X[1]) ^ (X[2] & X[6]) ^ (X[3] & X[6]) ^ (X[7] & X[6]) ^ (X[1] & X[0]) ^ (X[2] & X[0]) ^
                  (X[3] & X[0]) ^ (X[4] & X[0]) ^ (X[6] & X[0]) ^ (X[7] & X[0]) ^ (X[5] & X[2]) ^ (X[5] & X[3]) ^
                  (X[2] & X[4]) ^ (X[3] & X[4]) ^ (X[5] & X[7]) ^ (X[7] & X[2]) ^ (X[5] & X[6]) ^ (X[3] & X[2]) ^
                  (X[7] & X[3]);

    assign C[1] = (X[2] & X[1]) ^ (X[2] & X[4]) ^ (X[5] & X[4]) ^ (X[3] & X[6]) ^ (X[5] & X[6]) ^ (X[2] & X[0]) ^
                  (X[3] & X[0]) ^ (X[5] & X[0]) ^ (X[7] & X[0]) ^ X[1] ^ (X[5] & X[2]) ^ (X[7] & X[2]) ^ (X[5] & X[3]) ^ 
                  (X[5] & X[7]) ^ X[7] ^ X[2] ^ (X[3] & X[2]) ^ X[4] ^ X[5];
        
    assign C[0] = (X[1] & X[0]) ^ (X[2] & X[0]) ^ (X[3] & X[0]) ^ (X[5] & X[0]) ^ (X[7] & X[0]) ^ (X[3] & X[1]) ^
                  (X[6] & X[1]) ^ (X[3] & X[6]) ^ (X[5] & X[6]) ^ (X[7] & X[6]) ^ (X[3] & X[4]) ^ (X[7] & X[4]) ^
                  (X[5] & X[3]) ^ (X[4] & X[1]) ^ X[2] ^ (X[3] & X[2]) ^ (X[4] & X[6]) ^ X[6]^ X[5] ^ X[3] ^ X[0];

endmodule // pprm_stage_1
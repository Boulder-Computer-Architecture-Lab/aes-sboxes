/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: xor8_4
// Project Name: aes_sboxes
// Description: 8 XOR4 gates.
//              Adapted from Alexander Maximov and Patrik Ekdahl's 
//              "New Circuit Minimization Techniques 
//              for Smaller and Faster AES SBoxes"
// 
// Dependencies: None.
// 
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module xor8_4 (
        input   wire            K0, K1, K2, K3, K4, K5, K6, K7, K8, K9, K10, K11, K12, K13, K14, K15,
        input   wire            K16, K17, K18, K19, K20, K21, K22, K23, K24, K25, K26, K27, K28, K29, K30, K31,
        output  wire    [7:0]   R
    );

    //----------------------------------------------------------------
    // Continuous Assignments
    //----------------------------------------------------------------
    assign R[7] = (K0 ^ K1) ^ (K2 ^ K3);
    assign R[6] = (K4 ^ K5) ^ (K6 ^ K7);
    assign R[5] = (K8 ^ K9) ^ (K10 ^ K11);
    assign R[4] = (K12 ^ K13) ^ (K14 ^ K15);
    assign R[3] = (K16 ^ K17) ^ (K18 ^ K19);
    assign R[2] = (K20 ^ K21) ^ (K22 ^ K23);
    assign R[1] = (K24 ^ K25) ^ (K26 ^ K27);
    assign R[0] = (K28 ^ K29) ^ (K30 ^ K31);

endmodule // xor8_4
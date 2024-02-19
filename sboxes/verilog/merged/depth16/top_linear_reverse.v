/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by:
// 
// Create Date: 10/2022
// Module Name: top_linear_reverse
// Project Name: aes_sboxes
// Description: Top linear transform in reverse direction
// 
// Dependencies: None.
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box". Shifted values from original in paper for
//                      assign T[0]-T[26] to be represented as T0-T[25]
// 
//////////////////////////////////////////////////////////////////////////////////

module top_linear_reverse (
        input   wire    [7:0]   U,
        output  wire    [26:0]  T,
        output  wire            Y
    );
    
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [4:0] R;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign T[22] = U[0] ^ U[3];
    assign T[21] = U[1] ~^ U[3];
    assign T[1] = U[0] ~^ U[1];
    assign T[0] = U[3] ^ U[4];
    assign T[23] = U[4] ~^ U[7];
    assign R[0] = U[6] ^ U[7];
    assign T[7] = U[1] ~^ T[22];
    assign T[18] = T[21] ^ R[0];
    assign T[8] = U[7] ~^ T[0];
    assign T[9] = T[1] ^ T[23];
    assign T[12] = T[1] ^ R[0];
    assign T[2] = T[0] ^ R[0];
    assign T[24] = U[2] ~^ T[0];
    assign R[1] = U[1] ^ U[6];
    assign T[16] = U[2] ~^ T[18];
    assign T[19] = T[23] ^ R[1];
    assign T[3] = U[4] ^ T[7];
    assign R[2] = U[2] ~^ U[5];
    assign R[3] = U[5] ~^ U[6];
    assign R[4] = U[2] ~^ U[4];
    assign Y = U[0] ^ R[2];
    assign T[5] = T[21] ^ R[2];
    assign T[15] = R[1] ^ R[4];
    assign T[26] = T[0] ^ R[3];
    assign T[14] = T[9] ^ T[26];
    assign T[13] = T[9] ^ R[3];
    assign T[25] = T[2] ^ T[15];

    assign T[4] = 0;
    assign T[6] = 0;
    assign T[10] = 0;
    assign T[11] = 0; 
    assign T[17] = 0;
    assign T[20] = 0;

endmodule // top_linear_reverse
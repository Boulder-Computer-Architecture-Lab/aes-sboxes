/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by:
// 
// Create Date: 10/2022
// Module Name: bottom_linear_reverse
// Project Name: aes_sboxes
// Description: Bottom linear transform in reverse direction.
// 
// Dependencies: None.
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box". Shifted values from original in paper for
//                      M1-M63 to be represented as M0-M62
// 
//////////////////////////////////////////////////////////////////////////////////

module bottom_linear_reverse (
        input   wire    [62:0]  M,
        output  wire    [7:0]   W
    ); 
    
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [28:0] P;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign P[0] = M[51] + M[60]; // P0 = M52 + M61
    assign P[1] = M[57] + M[58]; // P1 = M58 + M59
    assign P[2] = M[53] + M[61]; // P2 = M54 + M62
    assign P[3] = M[46] + M[49]; // P3 = M47 + M50
    assign P[4] = M[47] + M[55]; // P4 = M48 + M56
    assign P[5] = M[45] + M[50]; // P5 = M46 + M51
    assign P[6] = M[48] + M[59]; // P6 = M49 + M60
    assign P[7] = P[0] + P[1]; // P7 = P0 + P1
    assign P[8] = M[49] + M[52]; // P8 = M50 + M53
    assign P[9] = M[54] + M[62]; // P9 = M55 + M63
    assign P[10] = M[56] + P[4]; // P10 = M57 + P4
    assign P[11] = P[0] + P[3]; // P11 = P0 + P3
    assign P[12] = M[45] + M[47]; // P12 = M46 + M48
    assign P[13] = M[48] + M[50]; // P13 = M49 + M51
    assign P[14] = M[48] + M[61]; // P14 = M49 + M62
    assign P[15] = M[53] + M[58]; // P15 = M54 + M59
    assign P[16] = M[56] + M[60]; // P16 = M57 + M61
    assign P[17] = M[57] + P[2]; // P17 = M58 + P2
    assign P[18] = M[62] + P[5]; // P18 = M63 + P5
    assign P[19] = P[2] + P[3]; // P19 = P2 + P3
    assign P[20] = P[4] + P[6]; // P20 = P4 + P6
    assign P[21] = P[2] + P[7]; // P22 = P2 + P7
    assign P[22] = P[7] + P[8]; // P23 = P7 + P8
    assign P[23] = P[5] + P[7]; // P24 = P5 + P7
    assign P[24] = P[6] + P[10]; // P25 = P6 + P10
    assign P[25] = P[9] + P[11]; // P26 = P9 + P11
    assign P[26] = P[10] + P[18]; // P27 = P10 + P18
    assign P[27] = P[11] + P[24]; // P28 = P11 + P25 
    assign P[28] = P[15] + P[20]; // P29 = P15 + P20
    assign W[7] = P[13] + P[21]; // W0 = P13 + P22
    assign W[6] = P[25] + P[28]; // W1 = P26 + P29
    assign W[5] = P[17] + P[27]; // W2 = P17 + P28
    assign W[4] = P[12] + P[21]; // W3 = P12 + P22
    assign W[3] = P[22] + P[26]; // W4 = P23 + P27
    assign W[2] = P[19] + P[23]; // W5 = P19 + P24
    assign W[1] = P[14] + P[22]; // W6 = P14 + P23
    assign W[0] = P[9] + P[16]; // W7 = P9 + P16

endmodule // bottom_linear_reverse
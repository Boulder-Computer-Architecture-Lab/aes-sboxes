/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: bottom_linear_forward
// Project Name: aes-v
// Description: Bottom linear transform in forward direction.
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box". Shifted values from original in paper for
//                      M1-M63 to be represented as M0-M62
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

module bottom_linear_forward (
        input   wire    [62:0]  M,
        output  wire    [7:0]   S
    ); 
    
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [29:0] L; 

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign L[0] = M[60] ^ M[61]; // L0 = M61 + M62
    assign L[1] = M[49] ^ M[55]; // L1 = M50 + M56
    assign L[2] = M[45] ^ M[47]; // L2 = M46 + M48
    assign L[3] = M[46] ^ M[54]; // L3 = M47 + M55
    assign L[4] = M[53] ^ M[57]; // L4 = M54 + M58
    assign L[5] = M[48] ^ M[60]; // L5 = M49 + M61
    assign L[6] = M[61] ^ L[5]; // L6 = M62 + L5
    assign L[7] = M[45] ^ L[3]; // L7 = M46 + L3
    assign L[8] = M[50] ^ M[58]; // L8 = M51 + M59
    assign L[9] = M[51] ^ M[52]; // L9 = M52 + M53
    assign L[10] = M[52] ^ L[4]; // L10 = M53 + L4
    assign L[11] = M[59] ^ L[2]; // L11 = M60 + L2
    assign L[12] = M[47] ^ M[50]; // L12 = M48 + M51
    assign L[13] = M[49] ^ L[0]; // L13 = M50 + L0
    assign L[14] = M[51] ^ M[60]; // L14 = M52 + M61
    assign L[15] = M[54] ^ L[1]; // L15 = M55 + L1
    assign L[16] = M[55] ^ L[0]; // L16 = M56 + L0
    assign L[17] = M[56] ^ L[1]; // L17 = M57 + L1
    assign L[18] = M[57] ^ L[8]; // L18 = M58 + L8
    assign L[19] = M[62] ^ L[4]; // L19 = M63 + L4
    assign L[20] = L[0] ^ L[1]; // L20 = L0 + L1
    assign L[21] = L[1] ^ L[7]; // L21 = L1 + L7
    assign L[22] = L[3] ^ L[12]; // L22 = L3 + L12
    assign L[23] = L[18] ^ L[2]; // L23 = L18 + L2
    assign L[24] = L[15] ^ L[9]; // L24 = L15 + L9
    assign L[25] = L[6] ^ L[10]; // L25 = L6 + L10
    assign L[26] = L[7] ^ L[9]; // L26 = L7 + L9
    assign L[27] = L[8] ^ L[10]; // L27 = L8 + L10
    assign L[28] = L[11] ^ L[14]; // L28 = L11 + L14
    assign L[29] = L[11] ^ L[17]; // L29 = L11 + L17

    assign S[7]= L[6] ^ L[24]; // S0 = L6 + L24
    assign S[6]= L[16] ~^ L[26]; // S1 = L16 # L26
    assign S[5]= L[19] ~^ L[28]; // S2 = L19 # L28
    assign S[4]= L[6] ^ L[21]; // S3 = L6 + L21
    assign S[3]= L[20] ^ L[22]; // S4 = L20 + L22
    assign S[2]= L[25]^L[29]; // S5 = L25 + L29
    assign S[1]= L[13] ~^ L[27]; // S6 = L13 # L27
    assign S[0]= L[6] ~^ L[23]; // S7 = L6 # L23

endmodule // bottom_linear_forward
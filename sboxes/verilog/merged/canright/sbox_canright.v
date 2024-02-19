/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: sbox_canright
// Project Name: aes_sboxes
// Description: Find either Sbox or its inverse in GF(2^8), by Canright Algorithm.
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: select_not_8, gf_inv_8.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_canright (
        input   wire    [7:0]   byte_in,
        input   wire            encrypt,
        output  wire    [7:0]   byte_out
    );

    wire [7:0] B, C, D, X, Y, Z;
    wire R1, R2, R3, R4, R5, R6, R7, R8, R9;
    wire T1, T2, T3, T4, T5, T6, T7, T8, T9, T10;

    assign R1 = byte_in[7] ^ byte_in[5];
    assign R2 = byte_in[7] ~^ byte_in[4];
    assign R3 = byte_in[6] ^ byte_in[0];
    assign R4 = byte_in[5] ~^ R3;
    assign R5 = byte_in[4] ^ R4;
    assign R6 = byte_in[3] ^ byte_in[0];
    assign R7 = byte_in[2] ^ R1;
    assign R8 = byte_in[1] ^ R3;
    assign R9 = byte_in[3] ^ R8;
    assign B[7] = R7 ~^ R8;
    assign B[6] = R5;
    assign B[5] = byte_in[1] ^ R4;
    assign B[4] = R1 ~^ R3;
    assign B[3] = byte_in[1] ^ R2 ^ R6;
    assign B[2] = ~ byte_in[0];
    assign B[1] = R4;
    assign B[0] = byte_in[2] ~^ R9;
    assign Y[7] = R2;
    assign Y[6] = byte_in[4] ^ R8;
    assign Y[5] = byte_in[6] ^ byte_in[4];
    assign Y[4] = R9;
    assign Y[3] = byte_in[6] ~^ R2;
    assign Y[2] = R7;
    assign Y[1] = byte_in[4] ^ R6;
    assign Y[0] = byte_in[1] ^ R5;
    assign Z = ~(encrypt? B : Y);
    gf_inv_8 inv( Z, C );

    assign T1 = C[7] ^ C[3];
    assign T2 = C[6] ^ C[4];
    assign T3 = C[6] ^ C[0];
    assign T4 = C[5] ~^ C[3];
    assign T5 = C[5] ~^ T1;
    assign T6 = C[5] ~^ C[1];
    assign T7 = C[4] ~^ T6;
    assign T8 = C[2] ^ T4;
    assign T9 = C[1] ^ T2;
    assign T10 = T3 ^ T5;
    assign D[7] = T4;
    assign D[6] = T1;
    assign D[5] = T3;
    assign D[4] = T5;
    assign D[3] = T2 ^ T5;
    assign D[2] = T3 ^ T8;
    assign D[1] = T7;
    assign D[0] = T9;
    assign X[7] = C[4] ~^ C[1];
    assign X[6] = C[1] ^ T10;
    assign X[5] = C[2] ^ T10;
    assign X[4] = C[6] ~^ C[1];
    assign X[3] = T8 ^ T9;
    assign X[2] = C[7] ~^ T7;
    assign X[1] = T6;
    assign X[0] = ~ C[2];
    assign byte_out = ~(encrypt? D : X);
    
endmodule // sbox_canright
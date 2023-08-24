/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Cagdas Calik
// Editor: Phaedra Curlin
// 
// Create Date: 08/2023
// Module Name: sbox_calik
// Project Name: aes-sboxes
// Description: 113 gate S-box with depth 27. Adapted from
//              https://www.cs.yale.edu/homes/peralta/CircuitStuff/SLP_AES_113.txt
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module sbox_calik (
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    wire [21:0] y;
    wire [45:0] t;
    wire [26:0] tc;
    wire [17:0] z;

    assign y[14] = byte_in[4] ^ byte_in[2];
    assign y[13] = byte_in[7] ^ byte_in[1];
    assign y[9] = byte_in[7] ^ byte_in[4];
    assign y[8] = byte_in[7] ^ byte_in[2];
    assign t[0] = byte_in[6] ^ byte_in[5];
    assign y[1] = t[0] ^ byte_in[0];
    assign y[4] = y[1] ^ byte_in[4];
    assign y[12] = y[13] ^ y[14];
    assign y[2] = y[1] ^ byte_in[7];
    assign y[5] = y[1] ^ byte_in[1];
    assign y[3] = y[5] ^ y[8];
    assign t[1] = byte_in[3] ^ y[12];
    assign y[15] = t[1] ^ byte_in[2];
    assign y[20] = t[1] ^ byte_in[6];
    assign y[6] = y[15] ^ byte_in[0];
    assign y[10] = y[15] ^ t[0];
    assign y[11] = y[20] ^ y[9];
    assign y[7] = byte_in[0] ^ y[11];
    assign y[17] = y[10] ^ y[11];
    assign y[19] = y[10] ^ y[8];
    assign y[16] = t[0] ^ y[11];
    assign y[21] = y[13] ^ y[16];
    assign y[18] = byte_in[7] ^ y[16];
    assign t[2] = y[12] & y[15];
    assign t[3] = y[3] & y[6];
    assign t[4] = t[3] ^ t[2];
    assign t[5] = y[4] & byte_in[0];
    assign t[6] = t[5] ^ t[2];
    assign t[7] = y[13] & y[16];
    assign t[8] = y[5] & y[1];
    assign t[9] = t[8] ^ t[7];
    assign t[10] = y[2] & y[7];
    assign t[11] = t[10] ^ t[7];
    assign t[12] = y[9] & y[11];
    assign t[13] = y[14] & y[17];
    assign t[14] = t[13] ^ t[12];
    assign t[15] = y[8] & y[10];
    assign t[16] = t[15] ^ t[12];
    assign t[17] = t[4] ^ y[20];
    assign t[18] = t[6] ^ t[16];
    assign t[19] = t[9] ^ t[14];
    assign t[20] = t[11] ^ t[16];
    assign t[21] = t[17] ^ t[14];
    assign t[22] = t[18] ^ y[19];
    assign t[23] = t[19] ^ y[21];
    assign t[24] = t[20] ^ y[18];
    assign t[25] = t[21] ^ t[22];
    assign t[26] = t[21] & t[23];
    assign t[27] = t[24] ^ t[26];
    assign t[28] = t[25] & t[27];
    assign t[29] = t[28] ^ t[22];
    assign t[30] = t[23] ^ t[24];
    assign t[31] = t[22] ^ t[26];
    assign t[32] = t[31] & t[30];
    assign t[33] = t[32] ^ t[24];
    assign t[34] = t[23] ^ t[33];
    assign t[35] = t[27] ^ t[33];
    assign t[36] = t[24] & t[35];
    assign t[37] = t[36] ^ t[34];
    assign t[38] = t[27] ^ t[36];
    assign t[39] = t[29] & t[38];
    assign t[40] = t[25] ^ t[39];
    assign t[41] = t[40] ^ t[37];
    assign t[42] = t[29] ^ t[33];
    assign t[43] = t[29] ^ t[40];
    assign t[44] = t[33] ^ t[37];
    assign t[45] = t[42] ^ t[41];
    assign z[0] = t[44] & y[15];
    assign z[1] = t[37] & y[6];
    assign z[2] = t[33] & byte_in[0];
    assign z[3] = t[43] & y[16];
    assign z[4] = t[40] & y[1];
    assign z[5] = t[29] & y[7];
    assign z[6] = t[42] & y[11];
    assign z[7] = t[45] & y[17];
    assign z[8] = t[41] & y[10];
    assign z[9] = t[44] & y[12];
    assign z[10] = t[37] & y[3];
    assign z[11] = t[33] & y[4];
    assign z[12] = t[43] & y[13];
    assign z[13] = t[40] & y[5];
    assign z[14] = t[29] & y[2];
    assign z[15] = t[42] & y[9];
    assign z[16] = t[45] & y[14];
    assign z[17] = t[41] & y[8];
    assign tc[1] = z[15] ^ z[16];
    assign tc[2] = z[10] ^ tc[1];
    assign tc[3] = z[9] ^ tc[2];
    assign tc[4] = z[0] ^ z[2];
    assign tc[5] = z[1] ^ z[0];
    assign tc[6] = z[3] ^ z[4];
    assign tc[7] = z[12] ^ tc[4];
    assign tc[8] = z[7] ^ tc[6];
    assign tc[9] = z[8] ^ tc[7];
    assign tc[10] = tc[8] ^ tc[9];
    assign tc[11] = tc[6] ^ tc[5];
    assign tc[12] = z[3] ^ z[5];
    assign tc[13] = z[13] ^ tc[1];
    assign tc[14] = tc[4] ^ tc[12];
    assign byte_out[4] = tc[3] ^ tc[11];
    assign tc[16] = z[6] ^ tc[8];
    assign tc[17] = z[14] ^ tc[10];
    assign tc[18] = tc[13] ^ tc[14];
    assign byte_out[0] = z[12] ~^ tc[18];
    assign tc[20] = z[15] ^ tc[16];
    assign tc[21] = tc[2] ^ z[11];
    assign byte_out[7] = tc[3] ^ tc[16];
    assign byte_out[1] = tc[10] ~^ tc[18];
    assign byte_out[3] = tc[14] ^ byte_out[4];
    assign byte_out[6] = byte_out[4] ~^ tc[16];
    assign tc[26] = tc[17] ^ tc[20];
    assign byte_out[5] = tc[26] ~^ z[17];
    assign byte_out[2] = tc[21] ^ tc[17];

endmodule // sbox_calik
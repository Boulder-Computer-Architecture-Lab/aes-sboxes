/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: middle_nonlinear_shared
// Project Name: aes-sboxes
// Description:  Shared part of AES S-box circuit
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box". Shifted values from original in paper for
//                      T1-T27 to be represented as T0-T26. Same goes with 
//                      M1-M63 which is shifted to M0-M62.
// 
//////////////////////////////////////////////////////////////////////////////////

module middle_nonlinear_shared (
        input   wire    [26:0]  T,
        input   wire            D, 
        output  wire    [62:0]  M
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign M[0] = T[12] & T[5];
    assign M[1] = T[22] & T[7];
    assign M[2] = T[13] ^ M[0];
    assign M[3] = T[18] & D;
    assign M[4] = M[3] ^ M[0];
    assign M[5] = T[2] & T[15];
    assign M[6] = T[21] & T[8];
    assign M[7] = T[25] ^ M[5];
    assign M[8] = T[19] & T[16];
    assign M[9] = M[8] ^ M[5];
    assign M[10] = T[0] & T[14];
    assign M[11] = T[3] & T[26];
    assign M[12] = M[11] ^ M[10];
    assign M[13] = T[1] & T[9];
    assign M[14] = M[13] ^ M[10];
    assign M[15] = M[2] ^ M[1];
    assign M[16] = M[4] ^ T[23];
    assign M[17] = M[7] ^ M[6];
    assign M[18] = M[9] ^ M[14];
    assign M[19] = M[15] ^ M[12];
    assign M[20] = M[16] ^ M[14];
    assign M[21] = M[17] ^ M[12];
    assign M[22] = M[18] ^ T[24];
    assign M[23] = M[21] ^ M[22];
    assign M[24] = M[21] & M[19];
    assign M[25] = M[20] ^ M[24];
    assign M[26] = M[19] ^ M[20];
    assign M[27] = M[22] ^ M[24];
    assign M[28] = M[27] & M[26];
    assign M[29] = M[25] & M[23];
    assign M[30] = M[19] & M[22];
    assign M[31] = M[26] & M[30];
    assign M[32] = M[26] ^ M[24];
    assign M[33] = M[20] & M[21];
    assign M[34] = M[23] & M[33];
    assign M[35] = M[23] ^ M[24];
    assign M[36] = M[20] ^ M[28];
    assign M[37] = M[31] ^ M[32];
    assign M[38] = M[22] ^ M[29];
    assign M[39] = M[34] ^ M[35];
    assign M[40] = M[37] ^ M[39];
    assign M[41] = M[36] ^ M[38];
    assign M[42] = M[36] ^ M[37];
    assign M[43] = M[38] ^ M[39];
    assign M[44] = M[41] ^ M[40];
    assign M[45] = M[43] & T[5];
    assign M[46] = M[39] & T[7];
    assign M[47] = M[38] & D; 
    assign M[48] = M[42] & T[15];
    assign M[49] = M[37] & T[8];
    assign M[50] = M[36] & T[16];
    assign M[51] = M[41] & T[14];
    assign M[52] = M[44] & T[26];
    assign M[53] = M[40] & T[9];
    assign M[54] = M[43] & T[12];
    assign M[55] = M[39] & T[22];
    assign M[56] = M[38] & T[18];
    assign M[57] = M[42] & T[2];
    assign M[58] = M[37] & T[21];
    assign M[59] = M[36] & T[19];
    assign M[60] = M[41] & T[0];
    assign M[61] = M[44] & T[3];
    assign M[62] = M[40] & T[1];

endmodule // middle_nonlinear_shared
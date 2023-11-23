/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: top_linear_forward
// Project Name: aes-sboxes
// Description: Top linear transform in forward direction
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box". Shifted values from original in paper for
//                      T1-T27 to be represented as T0-T26
// 
//////////////////////////////////////////////////////////////////////////////////

module top_linear_forward (
        input   wire    [7:0]   U,
        output  wire    [26:0]  T
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign T[0] = U[0] ^ U[3]; // T1 = U0 + U3
    assign T[1] = U[0] ^ U[5]; // T2 = U0 + U5
    assign T[2] = U[0] ^ U[6]; // T3 = U0 + U6
    assign T[3] = U[3] ^ U[5]; // T4 = U3 + U5
    assign T[4] = U[4] ^ U[6]; // T5 = U4 + U6
    assign T[5] = T[0] ^ T[4]; // T6 = T1 + T5
    assign T[6] = U[1] ^ U[2]; // T7 = U1 + U2
    assign T[7] = U[7] ^ T[5]; // T8 = U7 + T6
    assign T[8] = U[7] ^ T[6]; // T9 = U7 + T7
    assign T[9] = T[5] ^ T[6]; // T10 = T6 + T7
    assign T[10] = U[1] ^ U[5]; // T11 = U1 + U5
    assign T[11] = U[2] ^ U[5]; // T12 = U2 + U5
    assign T[12] = T[2] ^ T[3]; // T13 = T3 + T4
    assign T[13] = T[5] ^ T[10]; // T14 = T6 + T11
    assign T[14] = T[4] ^ T[10]; // T15 = T5 + T11
    assign T[15] = T[4] ^ T[11]; // T16 = T5 + T12
    assign T[16] = T[8] ^ T[15]; // T17 = T9 + T16
    assign T[17] = U[3] ^ U[7]; // T18 = U3 + U7
    assign T[18] = T[6] ^ T[17]; // T19 = T7 + T18
    assign T[19] = T[0] ^ T[18]; // T20 = T1 + T19
    assign T[20] = U[6] ^ U[7]; // T21 = U6 + U7
    assign T[21] = T[6] ^ T[20]; // T22 = T7 + T21
    assign T[22] = T[1] ^ T[21]; // T23 = T2 + T22
    assign T[23] = T[1] ^ T[9]; // T24 = T2 + T10
    assign T[24] = T[19] ^ T[16]; // T25 = T20 + T17
    assign T[25] = T[2] ^ T[15]; // T26 = T3 + T16
    assign T[26] = T[0] ^ T[11]; // T27 = T1 + T12

endmodule // top_linear_forward
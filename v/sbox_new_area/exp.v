/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: exp
// Project Name: aes-sboxes
// Description: Exponentiation.
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box"
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module exp (
        input wire  [3:0]   A,
        input wire  [3:0]   B,
        output wire [3:0]   D,
        output wire         Ap,
        output wire         Bp
    );

    assign Ap = (A[0] ^ A[2]) ^ (A[1] ^ A[3]);
    assign Bp = (B[0] ^ B[2]) ^ (B[1] ^ B[3]);

    assign D[0] = (((A[0] ^ A[1]) & (B[0] ^ B[1])) ^ (A[0] ^ A[2]) & (B[0] ^ B[2]) ^ (A[0] & B[0]) ^ ((A[1] ^ A[3]) | (B[1] ^ B[3])));
    assign D[1] = (((A[0] ^ A[1]) & (B[0] ^ B[1])) ^ ((A[0] ^ A[2]) | (B[0] ^ B[2])) ^ (A[1] & B[1]) ^ (Ap & Bp));
    assign D[2] = ((A[2] | B[2]) ^ ((A[1] ^ A[3]) & (B[1] ^ B[3])) ^ ((A[2] ^ A[3]) & (B[2] ^ B[3])) ^ ((A[0] ^ A[2]) & (B[0] ^ B[2])));
    assign D[3] = ((A[3] & B[3]) ^ (Ap & Bp) ^ ((A[2] ^ A[3]) | (B[2] ^ B[3])) ^ ((A[0] ^ A[2]) & (B[0] ^ B[2])));

endmodule // exp
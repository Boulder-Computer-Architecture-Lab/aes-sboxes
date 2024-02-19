/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: out_mult
// Project Name: aes_sboxes
// Description: Output multiplier.
// 
// Dependencies: None.
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box".
// 
//////////////////////////////////////////////////////////////////////////////////

module out_mult (
        input wire  [3:0]   A,
        input wire  [3:0]   B,
        input wire  [3:0]   E,
        input wire          Ap,
        input wire          Bp,
        output wire [3:0]   Z,
        output wire [3:0]   W
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire W4, W5, Z4, Z5;

    //----------------------------------------------------------------
    // Continuous assignments
    //----------------------------------------------------------------
    assign W[0] = (B[1] & E[0]) ^ ((B[0] ^ B[1]) & E[1]) ^ W4;
    assign W[1] = (B[0] & E[1]) ^ ((B[0] ^ B[1]) & E[0]) ^ W5;
    assign W[2] = (B[3] & E[2]) ^ ((B[2] ^ B[3]) & E[3]) ^ W4;
    assign W[3] = (B[2] & E[3]) ^ ((B[2] ^ B[3]) & E[2]) ^ W5;
    assign W4 = ((B[1] ^ B[3]) & (E[1] ^ E[3])) ^ ((B[0] ^ B[2]) & (E[0] ^ E[2]));
    assign W5 = (Bp & (E[1] ^ E[3])) ^ ((B[1] ^ B[3]) & (E[0] ^ E[2]));

    assign Z[0] = (A[1]&E[0]) ^ ((A[0] ^ A[1]) & E[1]) ^ Z4;
    assign Z[1] = (A[0]&E[1]) ^ ((A[0] ^ A[1]) & E[0]) ^ Z5;
    assign Z[2] = (A[3]&E[2]) ^ ((A[2] ^ A[3]) & E[3]) ^ Z4;
    assign Z[3] = (A[2]&E[3]) ^ ((A[2] ^ A[3]) & E[2]) ^ Z5;
    assign Z4 = ((A[1] ^ A[3]) & (E[1] ^ E[3])) ^ ((A[0] ^ A[2]) & (E[0] ^ E[2]));
    assign Z5 = (Ap & (E[1] ^ E[3])) ^ ((A[1] ^ A[3]) & (E[0] ^ E[2]));
    
endmodule // out_mult
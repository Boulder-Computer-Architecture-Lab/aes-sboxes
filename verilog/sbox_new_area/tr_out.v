/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: tr_out
// Project Name: aes-sboxes
// Description: Transform out.
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

module tr_out (
        input wire [3:0] W,
        input wire [3:0] Z,
        input encrypt,
        output [7:0] S
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [7:0] J,L;

    wire TT0, TT1;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign TT0 = ~(J[7] ^ Z[0]);
    assign TT1 = ~(J[4] ^ Z[3]);

    // S-box
    assign J[7] = ~(W[3] ^ Z[1]);
    assign J[6] = W[1] ^ Z[1];
    assign J[5] = W[0] ^ Z[2];
    assign J[4] = J[7] ^ W[1];
    assign J[3] = ~(J[0] ^ TT1);
    assign J[2] = ~(J[5] ^ TT0);
    assign J[1] = ~(L[7] ^ W[3]);
    assign J[0] = ~(L[7] ^ W[0]);

    // Inv-Sbox
    assign L[7] = W[2] ~^ Z[3];
    assign L[6] = J[5] ~^ TT1;
    assign L[5] = J[2] ^ W[1];
    assign L[4] = W[0] ~^ Z[3];
    assign L[3] = J[0] ~^ TT0;
    assign L[2] = J[1] ~^ W[1];
    assign L[1] = W[3] ~^ Z[3];
    assign L[0] = ~Z[0];

    assign S = ~(encrypt? J : L);
    
endmodule // tr_out
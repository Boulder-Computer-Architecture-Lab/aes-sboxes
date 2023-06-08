/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: subfield_inv
// Project Name: aes-v
// Description: Subfield inversion in GF((2^2)^2)
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

`default_nettype none

module subfield_inv(
        input   wire    [3:0]   D,
        output  wire    [3:0]   E
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign E[0] = D[3] & (D[0] ^ D[1]) | D[2] & (~D[0] | D[3]);
    assign E[1] = (~D[2]) & D[3] & (~(D[0] ^ D[1])) | D[2] & (D[1] | (~D[3]));
    assign E[2] = D[1] & (D[2] ^ D[3]) | D[0] & ((~D[2]) | D[1]);
    assign E[3] = (~D[0]) & D[1] & (~(D[2] ^ D[3])) | (D[0] & (D[3] | (~D[1])));

endmodule // subfield_inv
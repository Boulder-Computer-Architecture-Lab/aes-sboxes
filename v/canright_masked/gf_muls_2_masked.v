/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: gf_muls_2_masked
// Project Name: aes-v
// Description: multiply in GF(2^2), shared factors, using normal
//              basis [Omega^2,Omega].
//              Adapted from D. Canright's Very Compact S-Box.
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

`default_nettype none

module gf_muls_2_masked (
        input   wire    [2:0]   A, /* shared factors include bit sum: sum hi lo */
        input   wire    [2:0]   B,
        output  wire    [1:0]   Q
    );

    wire   abcd, p, q;
    
    assign abcd = ~(A[2] & B[2]);  /* note: ~& syntax for NAND won't compile */
    assign p = (~(A[1] & B[1])) ^ abcd;
    assign q = (~(A[0] & B[0])) ^ abcd;
    assign Q = { p, q };

endmodule // gf_muls_2_masked
/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: gf_muls_2
// Project Name: aes-v
// Description: Multiply in GF(2^2), shared factors, using normal basis 
//              [Omega^2,Omega]. Adapted from D. Canright's Very Compact S-Box.
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

module gf_muls_2 (
        input   wire    [1:0]   A,
        input   wire            ab,
        input   wire    [1:0]   B,
        input   wire            cd,
        output  wire    [1:0]   Q
    );

    wire abcd, p, q;
    
    assign abcd = ~(ab & cd); /* note: ~& syntax for NAND won’t compile */
    assign p = (~(A[1] & B[1])) ^ abcd;
    assign q = (~(A[0] & B[0])) ^ abcd;
    assign Q = { p, q };

endmodule // gf_muls_2

`default_nettype wire
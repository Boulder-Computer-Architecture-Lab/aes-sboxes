/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: gf_sclw_2
// Project Name: aes-v
// Description: Scale by w = Omega in GF(2^2), using normal basis [Omega^2,Omega]. 
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

module gf_sclw_2 (
        input   wire    [1:0]   A,
        output  wire    [1:0]   Q
    );

    assign Q = {(A[1] ^ A[0]), A[1]};

endmodule // gf_sclw_2

`default_nettype wire
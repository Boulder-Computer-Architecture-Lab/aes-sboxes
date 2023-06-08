/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: fac_2
// Project Name: aes-v
// Description: Sums for shared factors, 2-bit -> 3.
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

module fac_2 (
        input   wire    [1:0]   a,
        output  wire    [2:0]   Q
    );
    
    wire   sa;
    assign sa = a[1] ^ a[0];
    /* output is three 1-bit shared factors: sum hi lo */
    assign Q = { sa, a };

endmodule // fac_2
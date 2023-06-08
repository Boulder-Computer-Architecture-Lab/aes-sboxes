/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: fac_4
// Project Name: aes-v
// Description: Sums for shared factors, 4-bit -> 9.
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

module fac_4 (
        input   wire    [3:0]   a,
        output  wire    [8:0]   Q
    );

    wire   [1:0] sa;
    wire al, ah, aa;
    
    assign sa = a[3:2] ^ a[1:0];
    assign al = a[1] ^ a[0];
    assign ah = a[3] ^ a[2];
    assign aa = sa[1] ^ sa[0];
    /* output is three 3-bit shared factors: sum hi lo */
    assign Q = { aa, sa, ah, a[3:2], al, a[1:0] };

endmodule // fac_4
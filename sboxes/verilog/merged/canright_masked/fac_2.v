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

module fac_2 (
        input   wire    [1:0]   a,
        output  wire    [2:0]   Q
    );
    
    wire   sa;
    assign sa = a[1] ^ a[0];
    /* output is three 1-bit shared factors: sum hi lo */
    assign Q = { sa, a };

endmodule // fac_2
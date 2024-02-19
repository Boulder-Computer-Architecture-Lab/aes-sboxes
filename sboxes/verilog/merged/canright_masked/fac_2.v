/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: fac_2
// Project Name: aes_sboxes
// Description: Sums for shared factors, 2-bit -> 3.
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None. 
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
    assign Q = { sa, a };

endmodule // fac_2
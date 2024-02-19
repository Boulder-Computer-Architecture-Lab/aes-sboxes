/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: fac_4
// Project Name: aes_sboxes
// Description: Sums for shared factors, 4-bit -> 9.
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module fac_4 (
        input   wire    [3:0]   a,
        output  wire    [8:0]   Q
    );

    wire [1:0] sa;
    wire al, ah, aa;
    
    assign sa = a[3:2] ^ a[1:0];
    assign al = a[1] ^ a[0];
    assign ah = a[3] ^ a[2];
    assign aa = sa[1] ^ sa[0];

    assign Q = { aa, sa, ah, a[3:2], al, a[1:0] };

endmodule // fac_4
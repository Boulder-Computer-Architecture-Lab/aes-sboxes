/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: gf_inv_4
// Project Name: aes_sboxes
// Description: Inverse in GF(2^4)/GF(2^2), using normal basis [alpha^8, alpha^2]
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: gf_sq_2, gf_muls_2.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_4 (
        input   wire    [3:0]   A,
        output  wire    [3:0]   Q
    );
    
    wire [1:0] a, b, c, d, p, q;
    wire sa, sb, sd;
    
    assign a = A[3:2];
    assign b = A[1:0];
    assign sa = a[1] ^ a[0];
    assign sb = b[1] ^ b[0];
    assign c = {~(a[1] | b[1]) ^ (~(sa & sb)),
                ~(sa | sb) ^ (~(a[0] & b[0]))};
    gf_sq_2 dinv(c, d);
    assign sd = d[1] ^ d[0];
    gf_muls_2 pmul(d, sd, b, sb, p);
    gf_muls_2 qmul(d, sd, a, sa, q);
    assign Q = {p, q};

endmodule // gf_inv_4
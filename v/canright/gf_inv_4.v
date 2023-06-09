/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: gf_inv_4
// Project Name: aes-sboxes
// Description: Inverse in GF(2^4)/GF(2^2), using normal basis [alpha^8, alpha^2]
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: gf_sq_2, gf_muls_2.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module gf_inv_4 (
        input   wire    [3:0]   A,
        output  wire    [3:0]   Q
    );
    
    wire [1:0] a, b, c, d, p, q;
    wire sa, sb, sd; /* for shared factors in multipliers */
    
    assign a = A[3:2];
    assign b = A[1:0];
    assign sa = a[1] ^ a[0];
    assign sb = b[1] ^ b[0];
    assign c = { /* note: ~| syntax for NOR won’t compile */
        ~(a[1] | b[1]) ^ (~(sa & sb)),
        ~(sa | sb) ^ (~(a[0] & b[0]))
    };
    gf_sq_2 dinv(c, d);
    assign sd = d[1] ^ d[0];
    gf_muls_2 pmul(d, sd, b, sb, p);
    gf_muls_2 qmul(d, sd, a, sa, q);
    assign Q = {p, q};

endmodule // gf_inv_4
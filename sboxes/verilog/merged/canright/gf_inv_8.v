/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: gf_inv_8
// Project Name: aes-sboxes
// Description: Inverse in GF(2^8)/GF(2^4), using normal basis [d^16, d]
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: gf_inv_4, gf_muls_4.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_8 (
        input   wire    [7:0]   A,
        output  wire    [7:0]   Q
    );

    wire [3:0] a, b, c, d, p, q;
    wire [1:0] sa, sb, sd, t; /* for shared factors in multipliers */
    wire al, ah, aa, bl, bh, bb, dl, dh, dd; /* for shared factors */
    wire c1, c2, c3; /* for temp var */
    
    assign a = A[7:4];
    assign b = A[3:0];
    assign sa = a[3:2] ^ a[1:0];
    assign sb = b[3:2] ^ b[1:0];
    assign al = a[1] ^ a[0];
    assign ah = a[3] ^ a[2];
    assign aa = sa[1] ^ sa[0];
    assign bl = b[1] ^ b[0];
    assign bh = b[3] ^ b[2];
    assign bb = sb[1] ^ sb[0];
    assign c1 = ~(ah & bh);
    assign c2 = ~(sa[0] & sb[0]);
    assign c3 = ~(aa & bb);
    assign c = { /* note: ~| syntax for NOR won’t compile */
        (~(sa[0] | sb[0]) ^ (~(a[3] & b[3]))) ^ c1 ^ c3,
        (~(sa[1] | sb[1]) ^ (~(a[2] & b[2]))) ^ c1 ^ c2,
        (~(al | bl) ^ (~(a[1] & b[1]))) ^ c2 ^ c3,
        (~(a[0] | b[0]) ^ (~(al & bl))) ^ (~(sa[1] & sb[1])) ^ c2
    };
    gf_inv_4 dinv(c, d);
    assign sd = d[3:2] ^ d[1:0];
    assign dl = d[1] ^ d[0];
    assign dh = d[3] ^ d[2];
    assign dd = sd[1] ^ sd[0];
    gf_muls_4 pmul(d, sd, dl, dh, dd, b, sb, bl, bh, bb, p);
    gf_muls_4 qmul(d, sd, dl, dh, dd, a, sa, al, ah, aa, q);
    assign Q = { p, q };

endmodule // gf_inv_8
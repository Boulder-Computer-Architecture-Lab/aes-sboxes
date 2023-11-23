/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: gf_muls_4
// Project Name: aes-sboxes
// Description: Multiply in GF(2^4)/GF(2^2), shared factors, basis
//              [alpha^8, alpha^2]. Adapted from D. Canright's Very Compact
//              S-Box.
// 
// Dependencies: gf_muls_2, gf_muls_scl_2.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_4 (
        input   wire    [3:0]   A,
        input   wire    [1:0]   a,
        input   wire            Al,
        input   wire            Ah,
        input   wire            aa,
        input   wire    [3:0]   B,
        input   wire    [1:0]   b,
        input   wire            Bl,
        input   wire            Bh,
        input   wire            bb,
        output  wire    [3:0]   Q
    );

    wire [1:0] ph, pl, ps, p;
    wire t;

    gf_muls_2 himul(A[3:2], Ah, B[3:2], Bh, ph);
    gf_muls_2 lomul(A[1:0], Al, B[1:0], Bl, pl);
    gf_muls_scl_2 summul(a, aa, b, bb, p);
    
    assign Q = {(ph ^ p), (pl ^ p)};

endmodule // gf_muls_4
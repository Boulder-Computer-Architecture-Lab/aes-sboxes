/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: gf_muls_4_masked
// Project Name: aes-sboxes
// Description: Multiply in GF(2^4)/GF(2^2), shared factors, 
//              basis [alpha^8, alpha^2].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: gf_muls_scl_2_masked, gf_muls_2_masked.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_4_masked (
        input  [8:0] A,     /* shared factors include bit sums: sum hi lo */
        input  [8:0] B,
        output [3:0] Q
    );

    wire   [1:0] ph, pl, p;
    
    gf_muls_scl_2_masked summul( A[8:6], B[8:6], p);
    gf_muls_2_masked himul(A[5:3], B[5:3], ph);
    gf_muls_2_masked lomul(A[2:0], B[2:0], pl);
    assign Q = { (ph ^ p), (pl ^ p) };
    
endmodule // gf_muls_4_masked
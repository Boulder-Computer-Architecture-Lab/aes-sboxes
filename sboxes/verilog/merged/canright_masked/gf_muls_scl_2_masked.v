/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: gf_muls_scl_2_masked
// Project Name: aes_sboxes
// Description: Multiply & scale by N in GF(2^2), shared factors,
//              basis [Omega^2,Omega].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_scl_2_masked (
        input   wire    [2:0]   A,
        input   wire    [2:0]   B,
        output  wire    [1:0]   Q
    );
    
    wire   t, p, q;
    
    assign t = ~(A[0] & B[0]);
    assign p = (~(A[2] & B[2])) ^ t;
    assign q = (~(A[1] & B[1])) ^ t;
    assign Q = { p, q };

endmodule // gf_muls_scl_2_masked
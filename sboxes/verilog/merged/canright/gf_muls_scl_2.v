/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: gf_muls_scl_2
// Project Name: aes_sboxes
// Description: Multiply & scale by N in GF(2^2), shared factors, basis 
//              [Omega^2,Omega]. Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_scl_2 (
        input   wire    [1:0]   A,
        input   wire            ab,
        input   wire    [1:0]   B,
        input   wire            cd,
        output  wire    [1:0]   Q
    );
    
    wire t, p, q;
    
    assign t = ~(A[0] & B[0]); 
    assign p = (~(ab & cd)) ^ t;
    assign q = (~(A[1] & B[1])) ^ t;
    assign Q = {p, q};

endmodule // gf_muls_scl_2
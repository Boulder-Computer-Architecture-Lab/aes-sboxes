/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: gf_muls_2_masked
// Project Name: aes_sboxes
// Description: multiply in GF(2^2), shared factors, using normal
//              basis [Omega^2,Omega].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_2_masked (
        input   wire    [2:0]   A,
        input   wire    [2:0]   B,
        output  wire    [1:0]   Q
    );

    wire   abcd, p, q;
    
    assign abcd = ~(A[2] & B[2]);
    assign p = (~(A[1] & B[1])) ^ abcd;
    assign q = (~(A[0] & B[0])) ^ abcd;
    assign Q = {p, q};

endmodule // gf_muls_2_masked
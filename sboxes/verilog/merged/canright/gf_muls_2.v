/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: gf_muls_2
// Project Name: aes_sboxes
// Description: Multiply in GF(2^2), shared factors, using normal basis 
//              [Omega^2,Omega]. Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_muls_2 (
        input   wire    [1:0]   A,
        input   wire            ab,
        input   wire    [1:0]   B,
        input   wire            cd,
        output  wire    [1:0]   Q
    );

    wire abcd, p, q;
    
    assign abcd = ~(ab & cd);
    assign p = (~(A[1] & B[1])) ^ abcd;
    assign q = (~(A[0] & B[0])) ^ abcd;
    assign Q = {p, q};

endmodule // gf_muls_2
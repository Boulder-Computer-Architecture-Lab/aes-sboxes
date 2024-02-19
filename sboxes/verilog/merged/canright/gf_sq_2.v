/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: gf_sq_2
// Project Name: aes_sboxes
// Description: Square in GF(2^2), using normal basis [Omega^2,Omega]. Inverse
//              is the same as square in GF(2^2), using any normal basis.
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_sq_2 (
        input   wire    [1:0]   A,
        output  wire    [1:0]   Q
    );

    assign Q = {A[0], A[1]};

endmodule // gf_sq_2
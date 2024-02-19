/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: subfield_inv
// Project Name: aes_sboxes
// Description: Subfield inversion in GF((2^2)^2)
// 
// Dependencies: None.
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box"
// 
//////////////////////////////////////////////////////////////////////////////////

module subfield_inv (
        input   wire    [3:0]   D,
        output  wire    [3:0]   E
    );

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign E[0] = (D[3] & (D[0] ^ D[1])) | (D[2] & ((~D[0]) | D[3]));
    assign E[1] = (((~D[2]) & D[3]) & (~(D[0] ^ D[1]))) | (D[2] & (D[1] | (~D[3])));
    assign E[2] = (D[1] & (D[2] ^ D[3])) | (D[0] & ((~D[2]) | D[1]));
    assign E[3] = ((~D[0]) & D[1] & (~(D[2] ^ D[3]))) | ((D[0] & (D[3] | (~D[1]))));

endmodule // subfield_inv
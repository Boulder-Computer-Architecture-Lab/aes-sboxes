//////////////////////////////////////////////////////////////////////////////////
//
// Author:
// 
// Create Date: 10/2022
// Module Name: affine_transform
// Project Name: aes_sboxes
// Description: Affine transform for the S-box.
//              Effectively computes:
//                  for (i=0;i<8;i++){
//                    b'[i] = b[i] ^ b[(i+4)%8] ^ b[(i+5)%8] ^ b[(i+6)%8] ^ b[(i+7)%8];
//                  }                            
//                  b' = b' ^ 0x63;
//
// Dependencies: None.
// 
// Additional Comments: Calculations defined in the FIPS 197 standard.
// 
//////////////////////////////////////////////////////////////////////////////////

module affine_transform (
        input   wire    [7:0]   byte_in,
        input   wire            encrypt,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [7:0] A;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    // Matrix multiplication
    assign A[0] = byte_in[0] ^ byte_in[4] ^ byte_in[5] ^ byte_in[6] ^ byte_in[7];
    assign A[1] = byte_in[1] ^ byte_in[5] ^ byte_in[6] ^ byte_in[7] ^ byte_in[0];
    assign A[2] = byte_in[2] ^ byte_in[6] ^ byte_in[7] ^ byte_in[0] ^ byte_in[1];
    assign A[3] = byte_in[3] ^ byte_in[7] ^ byte_in[0] ^ byte_in[1] ^ byte_in[2];
    assign A[4] = byte_in[4] ^ byte_in[0] ^ byte_in[1] ^ byte_in[2] ^ byte_in[3];
    assign A[5] = byte_in[5] ^ byte_in[1] ^ byte_in[2] ^ byte_in[3] ^ byte_in[4];
    assign A[6] = byte_in[6] ^ byte_in[2] ^ byte_in[3] ^ byte_in[4] ^ byte_in[5];
    assign A[7] = byte_in[7] ^ byte_in[3] ^ byte_in[4] ^ byte_in[5] ^ byte_in[6];    

    // Vector addition
    assign byte_out = encrypt? (A ^ 8'h63) : 0;

endmodule // affine_transform
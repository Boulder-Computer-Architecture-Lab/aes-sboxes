//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: invaffine_transform
// Project Name: aes-v
// Description: Inverse affine transform for the S-box.
//              Effectively computes:
//                  for (i=0;i<8;i++){
//                      b'[i] = b[(i+2)%8] ^ b[(i+5)%8] ^ b[(i+7)%8]
//                  }           
//                  b' = b' ^ 0x05;
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Calculations defined in the FIPS 197 standard.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

module invaffine_transform(
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
    assign A[0] = byte_in[2] ^ byte_in[5] ^ byte_in[7];
    assign A[1] = byte_in[3] ^ byte_in[6] ^ byte_in[0];
    assign A[2] = byte_in[4] ^ byte_in[7] ^ byte_in[1];
    assign A[3] = byte_in[5] ^ byte_in[0] ^ byte_in[2];
    assign A[4] = byte_in[6] ^ byte_in[1] ^ byte_in[3];
    assign A[5] = byte_in[7] ^ byte_in[2] ^ byte_in[4];
    assign A[6] = byte_in[0] ^ byte_in[3] ^ byte_in[5];
    assign A[7] = byte_in[1] ^ byte_in[4] ^ byte_in[6];    

    // Vector addition
    assign byte_out = (~encrypt)? (A ^ 8'h05) : 0;

endmodule //invaffine_transform
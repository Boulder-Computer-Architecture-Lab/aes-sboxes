/////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: sbox_log_lut
// Project Name: aes-sboxes
// Description: Log and Exp LUT based S-box.
// 
// Dependencies: affine_transform, log_inverter, invaffine_transform.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module sbox_log_lut(
        input   wire    [7:0]   byte_in,
        input   wire            encrypt,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------  
    wire [7:0] affine_in, invaffine_in, inverter_in;
    wire [7:0] affine_out, invaffine_out, inverter_out;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign affine_in = encrypt? inverter_out : 8'h0;
    assign inverter_in = encrypt? byte_in : invaffine_out;
    assign invaffine_in = encrypt? 8'h0 : byte_in;

    assign byte_out = encrypt? affine_out : inverter_out;
    //----------------------------------------------------------------
    // Module instantiation
    //----------------------------------------------------------------
    // Affine transformation
    affine_transform affine_transform(
        .byte_in(affine_in),
        .encrypt(encrypt),
        .byte_out(affine_out)
    );

    // Log-based inverter
    log_inverter inverter(
        .byte_in(inverter_in),
        .byte_out(inverter_out)
    );

    // Inverse affine transformation
    invaffine_transform invaffine_transform(
        .byte_in(invaffine_in),
        .encrypt(encrypt),
        .byte_out(invaffine_out)
    );

endmodule // sbox_log_lut
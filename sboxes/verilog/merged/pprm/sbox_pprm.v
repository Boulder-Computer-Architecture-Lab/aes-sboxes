/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Sumio Morioka and Akashi Satoh
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: sbox_pprm
// Project Name: aes-sboxes
// Description: 3-stage Positive-Polarity Reed Muller S-box.
// 
// Dependencies: affine_transform, pprm_inverter, invaffine_transform.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "An Optimized S-Box Circuit
//                      Architecture for Low Power AES Design".
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_pprm (
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

    // 3-stage PPRM inverter
    pprm_inverter inverter(
        .inverter_in(inverter_in),
        .inverter_out(inverter_out)
    );

    // Inverse affine transformation
    invaffine_transform invaffine_transform(
        .byte_in(invaffine_in),
        .encrypt(encrypt),
        .byte_out(invaffine_out)
    );

endmodule // sbox_pprm
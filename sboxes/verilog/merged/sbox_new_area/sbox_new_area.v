/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: sbox_new_area
// Project Name: aes_sboxes
// Description: New Area S-box
// 
// Dependencies: tr_in, expo, subfield_inv, out_mult, tr_out.
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box".
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_new_area (
        input   wire            encrypt,
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [3:0] A, B, D, E, W, Z;
    wire Ap, Bp;

    //----------------------------------------------------------------
    // Module instantiations
    //----------------------------------------------------------------
    tr_in tr_in(
        .G(byte_in),
        .encrypt(encrypt),
        .A(A),
        .B(B)
    );

    exp exp(
        .A(A),
        .B(B),
        .D(D),
        .Ap(Ap),
        .Bp(Bp)
    );


    subfield_inv subfield_inv(
        .D(D),
        .E(E)
    );

    out_mult out_mult(
        .A(A),
        .B(B),
        .E(E),
        .Ap(Ap),
        .Bp(Bp),
        .Z(Z),
        .W(W)
    );

    tr_out tr_out(
        .W(W),
        .Z(Z),
        .encrypt(encrypt),
        .S(byte_out)
    );

endmodule // sbox_new_area
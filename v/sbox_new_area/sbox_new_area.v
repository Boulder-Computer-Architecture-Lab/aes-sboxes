/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: subfield_inv
// Project Name: aes-v
// Description: Subfield inversion in GF((2^2)^2)
// 
// Dependencies: tr_in, expo, subfield_inv, out_mult, tr_out.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box".
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

module sbox_new_area(
        input   wire            encrypt,
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [3:0] A,B,D,E,W,Z;
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
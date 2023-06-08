/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Boyar and Peralta
// Adapted by: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: sbox_depth16
// Project Name: aes-v
// Description: A depth-16, bitsliced S-box.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "A depth-16 circuit for the
//                      AES S-box".
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

module sbox_depth16(
        input   wire    [7:0]   byte_in,
        input   wire            encrypt,
        output  wire    [7:0]   byte_out
    );
    
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [26:0] T_fwd, T_rev, T_mid;
    wire [62:0] M_fwd, M_rev, M_mid;
    wire [7:0] U,S,W;
    wire D, Y;

    //----------------------------------------------------------------
    // Continuous assigments
    //----------------------------------------------------------------
    // Need to reverse bytes due to different endiannes in original paper
    assign U = {byte_in[0], byte_in[1], byte_in[2], byte_in[3], byte_in[4], byte_in[5], byte_in[6], byte_in[7]};

    assign byte_out = encrypt? S : W;
    assign T_mid = encrypt? T_fwd : T_rev;
    assign D = encrypt? U[7] : Y;

    assign M_fwd = M_mid;
    assign M_rev = M_mid;

    //----------------------------------------------------------------
    // Module instantiations
    //----------------------------------------------------------------
    top_linear_forward top_fwd(
        .U(U),
        .T(T_fwd)
    );

    top_linear_reverse top_rev(
        .U(U),
        .T(T_rev),
        .Y(Y)
    );

    middle_nonlinear_shared mid(
        .T(T_mid),
        .D(D),
        .M(M_mid)
    );

    bottom_linear_forward bot_fwd(
        .M(M_fwd),
        .S(S)
    );

    bottom_linear_reverse bot_rev(
        .M(M_rev),
        .W(W)
    );
    
endmodule // sbox_depth16
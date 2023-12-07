/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Editor: Phaedra Curlin
// 
// Create Date: 12/2023
// Module Name: inv
// Project Name: aes-sboxes
// Description: Inversion in GF(2^4).
//              Adapted from Alexander Maximov and Patrik Ekdahl.
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module inv (
    input wire X0, X1, X2, X3,
    output wire Y0, Y1, Y2, Y3
);
    wire T0, T1, T2, T3, T4;

    assign T0 = ~(X0 & X2); // NAND
    assign T1 = ~(X1 | X3); // NOR
    assign T2 = T0 ^ ~T1; // XNOR
    assign Y0 = X2 ? T2 : X3; // MUX
    assign Y2 = X0 ? T2 : X1; // MUX
    assign T3 = X1 ? X2 : 1; // MUX
    assign Y1 = T2 ? X3 : T3; // MUX
    assign T4 = X3 ? X0 : 1; // MUX
    assign Y3 = T2 ? X1 : T4; // MUX

endmodule // inv
/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Editor: Phaedra Curlin
// 
// Create Date: 12/2023
// Module Name: mullc
// Project Name: aes-sboxes
// Description: Adapted from Alexander Maximov and Patrik Ekdahl.
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

module mullc (
    input wire ZF,
    input wire Y0,
    input wire L4, L8, L24, L28, 
    output wire K4, K8, K24, K28
);
    assign K4  = ~(Y0 & L4) ^ ZF;  // NAND with XOR
    assign K8  = ~(Y0 & L8) ^ ZF;  // NAND with XOR
    assign K24 = ~(Y0 & L24) ^ ZF; // NAND with XOR
    assign K28 = ~(Y0 & L28) ^ ZF; // NAND with XOR

endmodule // mulli
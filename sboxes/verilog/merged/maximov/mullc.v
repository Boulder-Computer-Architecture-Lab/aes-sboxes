/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: mullc
// Project Name: aes_sboxes
// Description: Adapted from Alexander Maximov and Patrik Ekdahl's 
//              "New Circuit Minimization Techniques 
//              for Smaller and Faster AES SBoxes"
// 
// Dependencies: None.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module mullc (
    input wire ZF,
    input wire Y0,
    input wire L4, L8, L24, L28, 
    output wire K4, K8, K24, K28
);
    //----------------------------------------------------------------
    // Continuous Assignments
    //----------------------------------------------------------------
    assign K4  = ~(Y0 & L4) ^ ZF;  // NAND with XOR
    assign K8  = ~(Y0 & L8) ^ ZF;  // NAND with XOR
    assign K24 = ~(Y0 & L24) ^ ZF; // NAND with XOR
    assign K28 = ~(Y0 & L28) ^ ZF; // NAND with XOR

endmodule // mullc
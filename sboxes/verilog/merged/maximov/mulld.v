/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: mulld
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

module mulld (
        input   wire    Y0, Y1, Y2, Y3,
        input   wire    L0, L12, L16, L20, L1, L5, L9, L13, L17, L21, L25, L29, L2, L6, L10, L14, L18, L22, L26, L30, L3, L7, L11, L15, L19, L23, L27, L31,
        output  wire    K0, K12, K16, K20, K1, K5, K9, K13, K17, K21, K25, K29, K2, K6, K10, K14, K18, K22, K26, K30, K3, K7, K11, K15, K19, K23, K27, K31
    );
    
    //----------------------------------------------------------------
    // Continuous Assignments
    //----------------------------------------------------------------
    assign K0  = ~(Y0 & L0 ); // NAND
    assign K12 = ~(Y0 & L12); // NAND
    assign K16 = ~(Y0 & L16); // NAND
    assign K20 = ~(Y0 & L20); // NAND
    assign K1  = ~(Y1 & L1 ); // NAND
    assign K5  = ~(Y1 & L5 ); // NAND
    assign K9  = ~(Y1 & L9 ); // NAND
    assign K13 = ~(Y1 & L13); // NAND
    assign K17 = ~(Y1 & L17); // NAND
    assign K21 = ~(Y1 & L21); // NAND
    assign K25 = ~(Y1 & L25); // NAND
    assign K29 = ~(Y1 & L29); // NAND
    assign K2  = ~(Y2 & L2 ); // NAND
    assign K6  = ~(Y2 & L6 ); // NAND
    assign K10 = ~(Y2 & L10); // NAND
    assign K14 = ~(Y2 & L14); // NAND
    assign K18 = ~(Y2 & L18); // NAND
    assign K22 = ~(Y2 & L22); // NAND
    assign K26 = ~(Y2 & L26); // NAND
    assign K30 = ~(Y2 & L30); // NAND
    assign K3  = ~(Y3 & L3 ); // NAND
    assign K7  = ~(Y3 & L7 ); // NAND
    assign K11 = ~(Y3 & L11); // NAND
    assign K15 = ~(Y3 & L15); // NAND
    assign K19 = ~(Y3 & L19); // NAND
    assign K23 = ~(Y3 & L23); // NAND
    assign K27 = ~(Y3 & L27); // NAND
    assign K31 = ~(Y3 & L31); // NAND

endmodule // mulld
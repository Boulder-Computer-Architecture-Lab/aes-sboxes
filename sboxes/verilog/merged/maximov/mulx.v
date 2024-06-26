/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: mulx
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

module mulx(
    input wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17,
    output wire X0, X1, X2, X3
    
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire T20, T21, T22, T10, T11, T12, T13;

    //----------------------------------------------------------------
    // Continuous Assignments
    //----------------------------------------------------------------
    assign T20 = ~(Q6 & Q12);
    assign T21 = ~(Q3 & Q14);
    assign T22 = ~(Q1 & Q16);
    assign T10 = ~((Q3 | Q14) ^ ~(Q0 & Q7));
    assign T11 = ~((Q4 | Q13) ^ ~(Q10 & Q11));
    assign T12 = ~((Q2 | Q17) ^ ~(Q5 & Q9));
    assign T13 = ~((Q8 | Q15) ^ ~(Q2 & Q17));

    assign X0 = T10 ^ (T20 ^ T22);
    assign X1 = T11 ^ (T21 ^ T20);
    assign X2 = T12 ^ (T21 ^ T22);
    assign X3 = T13 ^ (T21 ^ ~(Q4 & Q13));

endmodule // mulx
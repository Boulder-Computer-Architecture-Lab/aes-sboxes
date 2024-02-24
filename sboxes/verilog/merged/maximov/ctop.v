/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: ctop
// Project Name: aes_sboxes
// Description: Top layer.
//              Adapted from Alexander Maximov and Patrik Ekdahl's 
//              "New Circuit Minimization Techniques 
//               for Smaller and Faster AES SBoxes"
// 
// Dependencies: None.
//
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module ctop (
        input   wire    [7:0]   U,
        input   wire            ZF,
        output  wire            Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9,
        output  wire            Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17,
        output  wire            L0, L1, L2, L3, L4, L5, L6, L7, L8, L9,
        output  wire            L10, L11, L12, L13, L14, L15, L16, L17,
        output  wire            L18, L19, L20, L21, L22, L23, L24, L25,
        output  wire            L26, L27, L28, L29, L30, L31
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9;
    wire A10, A11, A12, A13, A14, A15, A16, A17, A18, A19;
    wire A20, A21, A22, A23, A24, A25, A26, A27, A28, A29;
    wire A30, A31, A32, A33, A34, A35, A36, A37;
    wire K0, K1, K2, K3, K4, K5, K6, K7, K8, K9;
    wire K10, K11, K12, K13, K14, K15, K16, K17, K18, K19;
    wire K20, K21, K22, K23, K24, K25, K26, K27, K28, K29;
    wire K30, K31;
    
    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign A0  = ~(U[5] ^ U[3]); // XNOR
    assign A1  = ~(U[6] ^ A0); // XNOR
    assign A2  = ~(U[2] ^ U[0]); // XNOR
    assign A3  = U[7] ^ U[2];    // XOR
    assign A4  = ~(U[4] ^ U[1]); // XNOR
    assign A5  = U[5] ^ U[1];    // XOR
    assign A6  = ~(ZF ? A4 : U[6]); // NMUX
    assign Q11 = A5 ^ A6;    // XOR
    assign Q16 = U[7] ^ Q11;   // XOR
    assign A7  = U[4] ^ A1;    // XOR
    assign L24 = ZF ? Q16 : A7; // MUX
    assign A8  = ~(ZF ? A3 : U[1]); // NMUX
    assign L5  = A0 ^ A8; // XOR
    assign L11 = Q16 ^ L5; // XOR
    assign A9  = ZF ? U[5] : U[1]; // MUX
    assign A10 = ~(A2 ^ A9); // XNOR
    assign Q5  = A1 ^ A10; // XOR
    assign Q15 = U[7] ^ Q5; // XOR
    assign A11 = U[5] ^ U[4]; // XOR
    assign A12 = ~(ZF ? A2 : A11); // NMUX
    assign Q13 = A6 ^ A12; // XOR
    assign Q12 = Q5 ^ Q13; // XOR
    assign A13 = A5 ^ A12; // XOR
    assign Q0  = Q5 ^ A13; // XOR
    assign Q14 = U[7] ^ A13; // XOR
    assign A14 = ~(U[4] ^ A3); // XNOR
    assign A15 = ~(ZF ? A0 : U[4]); // NMUX
    assign A16 = ~(U[2] ^ A15); // XNOR
    assign Q3  = A4 ^ A16; // XOR
    assign L6  = Q11 ^ Q3; // XOR
    assign A17 = U[5] ^ A10; // XOR
    assign Q7  = ~(A8 ^ A17); // XNOR
    assign A18 = ~(ZF ? A14 : A2); // NMUX
    assign Q1  = ~(A4 ^ A18); // XNOR
    assign Q4  = ~(A16 ^ A18); // XNOR
    assign L7  = Q12 ^ Q1; // XOR
    assign L8  = Q7 ^ L7; // XOR
    assign A19 = ~(ZF ? U[6] : A4); // NMUX
    assign A20 = ~(U[1] ^ A19); // XNOR
    assign Q9  = ~(A16 ^ A20); // XNOR
    assign Q10 = A18 ^ A20; // XOR
    assign L9  = Q0 ^ Q9; // XOR
    assign A21 = U[6] ^ A2; // XOR
    assign A22 = ~(ZF ? A21 : A5); // NMUX
    assign Q2  = A20 ^ A22; // XOR
    assign Q6  = ~(A4 ^ A22); // XNOR
    assign Q8  = ~(A16 ^ A22); // XNOR
    assign A23 = ~(Q5 ^ Q9); // XNOR
    assign L10 = ~(Q1 ^ A23); // XNOR
    assign L4  = Q14 ^ L10; // XOR
    assign A24 = ~(ZF ? Q2 : L4); // NMUX
    assign L12 = ~(Q16 ^ A24); // XNOR
    assign L25 = ~(U[4] ^ A24); // XNOR
    assign A25 = ZF ? L10 : A3; // MUX
    assign L17 = U[3] ^ A25; // XOR
    assign A26 = ZF ? A10 : Q4; // MUX
    assign L14 = L24 ^ A26; // XOR
    assign L23 = A25 ^ A26; // XOR
    assign A27 = ZF ? A1 : U[2]; // MUX
    assign L30 = Q12 ^ A27; // XOR
    assign A28 = ~(ZF ? L10 : L5); // NMUX
    assign L21 = ~(L14 ^ A28); // XNOR
    assign L27 = ~(L30 ^ A28); // XNOR
    assign A29 = ~(U[2] ^ L4); // XNOR
    assign L29 = A28 ^ A29; // XOR
    assign L15 = A19 ^ A29; // XOR
    assign A30 = ~(A3 ^ A10); // XNOR
    assign L18 = ~(ZF ? A19 : A30); // NMUX
    assign A31 = ~(A7 ^ A21); // XNOR
    assign L16 = A25 ^ A31; // XOR
    assign L26 = L18 ^ A31; // XOR
    assign A32 = ZF ? U[0] : A5; // MUX
    assign L13 = A7 ^ A32; // XOR
    assign A33 = ~(ZF ? A15 : U[7]); // NMUX
    assign L19 = ~(L6 ^ A33); // XNOR
    assign A34 = ~(ZF | U[1]); // NOR
    assign L20 = Q0 ^ A34; // XOR
    assign A35 = ~(A4 ^ A8); // XNOR
    assign L28 = ~(L7 ^ A35); // XNOR
    assign A36 = ~(ZF ? Q6 : L11); // NMUX
    assign L31 = A30 ^ A36; // XOR
    assign A37 = ZF ? L26 : A0; // MUX
    assign L22 = Q16 ^ A37; // XOR
    assign Q17 = U[7];
    assign L0 = Q10;
    assign L1 = Q6;
    assign L2 = Q9;
    assign L3 = Q8; 

endmodule // ctop
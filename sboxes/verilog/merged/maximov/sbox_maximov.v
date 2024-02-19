/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Alexander Maximov and Patrik Ekdahl
// Adapted by:
// 
// Create Date: 12/2023
// Module Name: sbox_maximov
// Project Name: aes_sboxes
// Description: Fast S-box or Inv-Sbox.
//              Adapted from Alexander Maximov and Patrik Ekdahl.
// 
// Dependencies: xor8_4, mulx, inv, mullc, mulld, ctop.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_maximov (
        input   wire    [7:0]   byte_in,
        input   wire            encrypt,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire T0, T1, T2, T3, T4, T5, T6, T7, T8, T9;
    wire T10, T11, T12, T13, T14, T15, T16, T17, T18, T19;
    wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9;
    wire Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17;
    wire L0, L1, L2, L3, L4, L5, L6, L7, L8, L9;
    wire L10, L11, L12, L13, L14, L15, L16, L17, L18, L19;
    wire X0, X1, X2, X3;
    wire Y0, Y1, Y2, Y3;
    wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9;
    wire K0, K1, K2, K3, K4, K5, K6, K7, K8, K9;
    wire K10, K11, K12, K13, K14, K15, K16, K17, K18, K19;
    wire K20, K21, K22, K23, K24, K25, K26, K27, K28, K29;
    wire K30, K31;
    wire A10, A11, A12, A13, A14, A15, A16, A17, A18, A19;
    wire A20, A21, A22, A23, A24, A25, A26, A27, A28, A29;
    wire A30, A31, A32, A33, A34, A35, A36, A37;
    wire L20, L21, L22, L23, L24, L25, L26, L27, L28, L29;
    wire L30, L31;

    //----------------------------------------------------------------
    // Modules
    //----------------------------------------------------------------
    xor8_4 xor8_4 (
        .K0(K0), .K1(K1), .K2(K2), .K3(K3), .K4(K4), .K5(K5),
        .K6(K6), .K7(K7), .K8(K8), .K9(K9), .K10(K10), .K11(K11),
        .K12(K12), .K13(K13), .K14(K14), .K15(K15), .K16(K16),
        .K17(K17), .K18(K18), .K19(K19), .K20(K20), .K21(K21),
        .K22(K22), .K23(K23), .K24(K24), .K25(K25), .K26(K26),
        .K27(K27), .K28(K28), .K29(K29), .K30(K30), .K31(K31),
        .R(byte_out)
    );
    
    mulx mulx (
        .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .Q5(Q5),
        .Q6(Q6), .Q7(Q7), .Q8(Q8), .Q9(Q9), .Q10(Q10), .Q11(Q11),
        .Q12(Q12), .Q13(Q13), .Q14(Q14), .Q15(Q15), .Q16(Q16),
        .Q17(Q17), .X0(X0), .X1(X1), .X2(X2), .X3(X3)
    );
 
    inv inv (
        .X0(X0), .X1(X1), .X2(X2), .X3(X3),
        .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3)
    );

    mullc mullc (
        .ZF(encrypt),
        .Y0(Y0),
        .L4(L4), .L8(L8), .L24(L24), .L28(L28),
        .K4(K4), .K8(K8), .K24(K24), .K28(K28)
    );

    mulld mulld (
        .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3),
        .L0(L0), .L12(L12), .L16(L16), .L20(L20),
        .L1(L1), .L5(L5), .L9(L9), .L13(L13),
        .L17(L17), .L21(L21), .L25(L25), .L29(L29),
        .L2(L2), .L6(L6), .L10(L10), .L14(L14),
        .L18(L18), .L22(L22), .L26(L26), .L30(L30),
        .L3(L3), .L7(L7), .L11(L11), .L15(L15),
        .L19(L19), .L23(L23), .L27(L27), .L31(L31),
        .K0(K0), .K12(K12), .K16(K16), .K20(K20),
        .K1(K1), .K5(K5), .K9(K9), .K13(K13),
        .K17(K17), .K21(K21), .K25(K25), .K29(K29),
        .K2(K2), .K6(K6), .K10(K10), .K14(K14),
        .K18(K18), .K22(K22), .K26(K26), .K30(K30),
        .K3(K3), .K7(K7), .K11(K11), .K15(K15),
        .K19(K19), .K23(K23), .K27(K27), .K31(K31)
    );

    ctop ctop (
        .U(byte_in), .ZF(encrypt),
        .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .Q5(Q5),
        .Q6(Q6), .Q7(Q7), .Q8(Q8), .Q9(Q9), .Q10(Q10), .Q11(Q11),
        .Q12(Q12), .Q13(Q13), .Q14(Q14), .Q15(Q15), .Q16(Q16),
        .Q17(Q17), .L0(L0), .L1(L1), .L2(L2), .L3(L3), .L4(L4),
        .L5(L5), .L6(L6), .L7(L7), .L8(L8), .L9(L9), .L10(L10),
        .L11(L11), .L12(L12), .L13(L13), .L14(L14), .L15(L15),
        .L16(L16), .L17(L17), .L18(L18), .L19(L19), .L20(L20),
        .L21(L21), .L22(L22), .L23(L23), .L24(L24), .L25(L25),
        .L26(L26), .L27(L27), .L28(L28), .L29(L29), .L30(L30),
        .L31(L31)
    );

endmodule // sbox_maximov
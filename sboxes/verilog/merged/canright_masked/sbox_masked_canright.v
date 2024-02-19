/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 08/2022
// Module Name: sbox_masked_canright
// Project Name: aes_sboxes
// Description: S-box & inverse with MASKING, using all normal bases.
//              Adapted from D. Canright's Very Compact "Perfectly Masked" S-Box.
// 
// Dependencies: select_not_8, gf_inv_8.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_masked_canright ( 
        input   wire    [7:0]   A,  // Input byte
        input   wire    [7:0]   M,  // Input mask 
        input   wire    [7:0]   N,  // Output mask
        input   wire            encrypt, // S-box = 1, Inverse S-box = 0 
        output  wire    [7:0]   Q   // Output byte
    );

    wire   [7:0] B, C, D, E, F, G, H, V, W, X, Y, Z;
    wire R1, R2, R3, R4, R5, R6, R7, R8, R9;
    wire S1, S2, S3, S4, S5, S6, S7, S8, S9;
    wire T1, T2, T3, T4, T5, T6, T7, T8, T9;
    wire U1, U2, U3, U4, U5, U6, U7, U8, U9, U10;

    assign  R1  = A[7] ^ A[5];
    assign  R2  = A[7] ~^ A[4];
    assign  R3  = A[6] ^ A[0];
    assign  R4  = A[5] ~^  R3 ;
    assign  R5  = A[4] ^  R4 ;
    assign  R6  = A[3] ^ A[0];
    assign  R7  = A[2] ^  R1 ;
    assign  R8  = A[1] ^  R3 ;
    assign  R9  = A[3] ^  R8 ;
    assign B[7] =  R7  ~^  R8 ;
    assign B[6] =  R5 ;
    assign B[5] = A[1] ^  R4 ;
    assign B[4] =  R1  ~^  R3 ;
    assign B[3] = A[1] ^  R2  ^  R6 ;
    assign B[2] = ~ A[0];
    assign B[1] =  R4 ;
    assign B[0] = A[2] ~^  R9 ;
    assign Y[7] =  R2 ;
    assign Y[6] = A[4] ^  R8 ;
    assign Y[5] = A[6] ^ A[4];
    assign Y[4] =  R9 ;
    assign Y[3] = A[6] ~^  R2 ;
    assign Y[2] =  R7 ;
    assign Y[1] = A[4] ^  R6 ;
    assign Y[0] = A[1] ^  R5 ;
    assign Z = ~(encrypt? B : Y);

    assign  S1  = M[7] ~^ M[5];
    assign  S2  = M[7] ~^ M[4];
    assign  S3  = M[6] ~^ M[0];
    assign  S4  = M[5]  ^  S3 ;
    assign  S5  = M[4]  ^  S4 ;
    assign  S6  = M[3]  ^ M[0];
    assign  S7  = M[2]  ^  S1 ;
    assign  S8  = M[1]  ^  S3 ;
    assign  S9  = M[3]  ^  S8 ;
    assign E[7] =  S7  ~^  S8 ;
    assign E[6] =  S5  ;
    assign E[5] = M[1]  ^  S4 ;
    assign E[4] =  S1  ~^  S3 ;
    assign E[3] = M[1]  ^  S2  ^  S6 ;
    assign E[2] = ~ M[0];
    assign E[1] =  S4  ;
    assign E[0] = M[2]  ^  S9 ;
    assign F[7] =  S2  ;
    assign F[6] = M[4]  ^  S8 ;
    assign F[5] = M[6] ~^ M[4];
    assign F[4] =  S9  ;
    assign F[3] = M[6]  ^  S2 ;
    assign F[2] =  S7  ;
    assign F[1] = M[4] ~^  S6 ;
    assign F[0] = M[1]  ^  S5 ;
    assign V = ~(encrypt? E : F);

    assign  T1  = N[7] ~^ N[5];
    assign  T2  = N[7] ~^ N[4];
    assign  T3  = N[6] ~^ N[0];
    assign  T4  = N[5]  ^  T3 ;
    assign  T5  = N[4]  ^  T4 ;
    assign  T6  = N[3]  ^ N[0];
    assign  T7  = N[2]  ^  T1 ;
    assign  T8  = N[1]  ^  T3 ;
    assign  T9  = N[3]  ^  T8 ;
    assign G[7] =  T7  ~^  T8 ;
    assign G[6] =  T5  ;
    assign G[5] = N[1]  ^  T4 ;
    assign G[4] =  T1  ~^  T3 ;
    assign G[3] = N[1]  ^  T2  ^  T6 ;
    assign G[2] = ~ N[0];
    assign G[1] =  T4  ;
    assign G[0] = N[2]  ^  T9 ;
    assign H[7] =  T2  ;
    assign H[6] = N[4]  ^  T8 ;
    assign H[5] = N[6] ~^ N[4];
    assign H[4] =  T9  ;
    assign H[3] = N[6]  ^  T2 ;
    assign H[2] =  T7  ;
    assign H[1] = N[4] ~^  T6 ;
    assign H[0] = N[1]  ^  T5 ;
    assign W = ~(encrypt? H : G);

    gf_inv_8_masked inv( Z, V, W, C );

    assign  U1  = C[7] ^ C[3];
    assign  U2  = C[6] ^ C[4];
    assign  U3  = C[6] ^ C[0];
    assign  U4  = C[5] ~^ C[3];
    assign  U5  = C[5] ~^  U1 ;
    assign  U6  = C[5] ~^ C[1];
    assign  U7  = C[4] ~^  U6 ;
    assign  U8  = C[2] ^  U4 ;
    assign  U9  = C[1] ^  U2 ;
    assign  U10  =  U3  ^  U5 ;
    assign D[7] =  U4 ;
    assign D[6] =  U1 ;
    assign D[5] =  U3 ;
    assign D[4] =  U5 ;
    assign D[3] =  U2  ^  U5 ;
    assign D[2] =  U3  ^  U8 ;
    assign D[1] =  U7 ;
    assign D[0] =  U9 ;
    assign X[7] = C[4] ~^ C[1];
    assign X[6] = C[1] ^  U10 ;
    assign X[5] = C[2] ^  U10 ;
    assign X[4] = C[6] ~^ C[1];
    assign X[3] =  U8  ^  U9 ;
    assign X[2] = C[7] ~^  U7 ;
    assign X[1] =  U6 ;
    assign X[0] = ~ C[2];
    assign Q = ~(encrypt? D : X);

endmodule // sbox_masked_canright
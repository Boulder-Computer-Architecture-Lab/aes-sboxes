/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: Reyhani-Masoleh, Taha, and Ashmawy
// Adapted by: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: tr_in
// Project Name: aes-sboxes
// Description: Transform in.
// 
// Dependencies: None.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: Based on design from "New Area Record for the AES
//                      Combined S-Box/Inverse S-Box"
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module tr_in (
        input wire  [7:0]   G,
        input wire          encrypt,
        output wire [3:0]   A,
        output wire [3:0]   B
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [2:0] T;
    wire [3:0] Ia, Ib, Ka, Kb;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign Ia[0] = Ib[3] ^ G[4]; // ib3 XOR g4
    assign Ia[1] = T[0] ^ Ia[3]; // t0 XOR ia3
    assign Ia[2] = Ib[3] ^ G[7]; // ib3 XOR g7
    assign Ia[3] = Ib[3] ^ G[1]; // ib3 XOR g1

    assign Ib[0] = ~G[0]; // NOT g0 
    assign Ib[1] = Kb[1] ~^ Ka[2]; // kb1 XNOR ka2
    assign Ib[2] = Ka[2] ~^ G[2]; // ka2 XNOR g2
    assign Ib[3] = T[1] ~^ G[5]; // t1 XNOR g5

    assign Ka[0] = Kb[2] ~^ G[5]; // kb2 XNOR g5
    assign Ka[1] = G[7] ~^ G[4]; // g7 XNOR g4
    assign Ka[2] = T[2] ^ G[1]; // t2 XOR g1
    assign Ka[3] = G[6] ^ G[4]; //g6 XOR g4

    assign Kb[0] = T[0] ^ G[5]; // t0 XOR g5
    assign Kb[1] = Ka[1] ~^ G[6]; // ka1 XNOR g6
    assign Kb[2] = Ia[0] ^ G[1]; // ia0 XOR g1
    assign Kb[3] = Ka[3] ^ T[2]; // ka3 XOR t2

    assign T[0] = G[7] ^ G[2]; // g7 XOR g2
    assign T[1] = G[6] ^ G[0]; // g6 XOR g0
    assign T[2] = T[1] ^ G[3]; // t1 XOR g3

    assign A = ~(encrypt? Ia : Ka); // MUX with output NOT
    assign B = ~(encrypt? Ib : Kb); // MUX with output NOT

endmodule // tr_in
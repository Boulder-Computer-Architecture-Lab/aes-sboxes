/////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 12/2022
// Module Name: sbox_bdd
// Project Name: aes-sboxes
// Description: Binary Decision Diagram S-box.
// 
// Dependencies: None. 
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_bdd (
        input   wire            encrypt,
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------  
    wire b0, b1, b2, b3, b4, b5, b6, b7;
    reg [7:0] byte;

    //----------------------------------------------------------------
    // Continous assignments
    //---------------------------------------------------------------- 
    assign b0 = byte_in[0];
    assign b1 = byte_in[1];
    assign b2 = byte_in[2];
    assign b3 = byte_in[3];
    assign b4 = byte_in[4];
    assign b5 = byte_in[5];
    assign b6 = byte_in[6];
    assign b7 = byte_in[7];
    assign byte_out = byte;    

    //----------------------------------------------------------------
    // Procedural assignments
    //---------------------------------------------------------------- 
    always @(byte_in) begin
        if (encrypt) begin // S-box
            if (b7) begin // 8'b1xxx_xxxx
                if (b6) begin // 8'b11xx_xxxx
                    if (b5) begin // 8'b111x_xxxx 
                        if (b4) begin // 8'b1111_xxxx
                            if (b3) begin // 8'b1111_1xxx
                                if (b2) begin // 8'b1111_11xx
                                    if (b1) begin // 8'b1111_111x
                                        if (b0) byte <= 8'h16; // 8'hff
                                        else byte <= 8'hbb; // 8'hfe
                                    end 
                                    else begin // 8'b1111_110x
                                        if (b0) byte <= 8'h54; // 8'b1111_1101
                                        else byte <= 8'hb0; // 8'b1111_1100
                                    end
                                end
                                else begin // 8'b1111_10xx
                                    if (b1) begin // 8'b1111_101x
                                        if (b0) byte <= 8'h0f; // 8'b1111_1011
                                        else byte <= 8'h2d; // 8'b1111_1010
                                    end
                                    else begin // 8'b1111_100x
                                        if (b0) byte <= 8'h99; // 8'b1111_1001
                                        else byte <= 8'h41; // 8'b1111_1000
                                    end
                                end
                            end
                            else begin // 8'b1111_0xxx
                                if (b2) begin // 8'b1111_01xx
                                    if (b1) begin // 8'b1111_011x
                                        if (b0) byte <= 8'h68; // 8'b1111_0111
                                        else byte <= 8'h42; // 8'b1111_0110
                                    end
                                    else begin // 8'b1111_010x
                                        if (b0) byte <= 8'he6; // 8'b1111_0101
                                        else byte <= 8'hbf; // 8'b1111_0100
                                    end
                                end
                                else begin // 8'b1111_00xx
                                    if (b1) begin // 8'b1111_001x
                                        if (b0) byte <= 8'h0d; // 8'b1111_0011
                                        else byte <= 8'h89; // 8'b1111_0010
                                    end
                                    else begin // 8'b1111_000x
                                        if (b0) byte <= 8'ha1; // 8'b1111_0001
                                        else byte <= 8'h8c; // 8'b1111_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1110_xxxx
                            if (b3) begin // 8'b1110_1xxx
                                if (b2) begin // 8'b1110_11xx
                                    if (b1) begin // 8'b1110_111x
                                        if (b0) byte <= 8'hdf; // 8'b1110_1111
                                        else byte <= 8'h28; // 8'b1110_1110
                                    end
                                    // 8'b1110_110x
                                    else begin
                                        if (b0) byte <= 8'h55; // 8'b1110_1101
                                        else byte <= 8'hce; // 8'b1110_1100
                                    end
                                end
                                else begin // 8'b1110_10xx
                                    if (b1) begin // 8'b1110_101x
                                        if (b0) byte <= 8'he9; // 8'b1110_1011
                                        else byte <= 8'h87; // 8'b1110_1010
                                    end
                                    else begin // 8'b1110_100x
                                        if (b0) byte <= 8'h1e; // 8'b1110_1001
                                        else byte <= 8'h9b; // 8'b1110_1000
                                    end
                                end
                            end
                            else begin // 8'b1110_0xxx
                                if (b2) begin // 8'b1110_01xx
                                    if (b1) begin // 8'b1110_011x
                                        if (b0) byte <= 8'h94; // 8'b1110_0111
                                        else byte <= 8'h8e; // 8'b1110_0110
                                    end
                                    else begin // 8'b1110_010x
                                        if (b0) byte <= 8'hd9; // 8'b1110_0101
                                        else byte <= 8'h69; // 8'b1110_0100
                                    end
                                end
                                else begin // 8'b1110_00xx
                                    if (b1) begin // 8'b1110_001x
                                        if (b0) byte <= 8'h11; // 8'b1110_0011
                                        else byte <= 8'h98; // 8'b1110_0010
                                    end
                                    else begin // 8'b1110_000x
                                        if (b0) byte <= 8'hf8; // 8'b1110_0001
                                        else byte <= 8'he1; // 8'b1110_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b110x_xxxx 
                        if (b4) begin // 8'b1101_xxxx 
                            if (b3) begin // 8'b1101_1xxx 
                                if (b2) begin // 8'b1101_11xx 
                                    if (b1) begin // 8'b1101_111x
                                        if (b0) byte <= 8'h9e; // 8'b1101_1111
                                        else byte <= 8'h1d; // 8'b1101_1110
                                    end
                                    else begin // 8'b1101_110x
                                        if (b0) byte <= 8'hc1; // 8'b1101_1101
                                        else byte <= 8'h86; // 8'b1101_1100
                                    end
                                end
                                else begin // 8'b1101_10xx 
                                    if (b1) begin // 8'b1101_101x
                                        if (b0) byte <= 8'hb9; // 8'b1101_1011
                                        else byte <= 8'h57; // 8'b1101_1010
                                    end
                                    else begin // 8'b1101_100x
                                        if (b0) byte <= 8'h35; // 8'b1101_1011
                                        else byte <= 8'h61; // 8'b1101_1010
                                    end
                                end
                            end
                            else begin // 8'b1101_0xxx 
                                if (b2) begin // 8'b1101_01xx 
                                    if (b1) begin // 8'b1101_011x 
                                        if (b0) byte <= 8'h0e; // 8'b1101_0111
                                        else byte <= 8'hf6; // 8'b1101_0110
                                    end
                                    else begin // 8'b1101_010x 
                                        if (b0) byte <= 8'h03; // 8'b1101_0101 
                                        else byte <= 8'h48; // 8'b1101_0100
                                    end
                                end
                                else begin // 8'b1101_00xx 
                                    if (b1) begin // 8'b1101_001x 
                                        if (b0) byte <= 8'h66; // 8'b1101_0011 
                                        else byte <= 8'hb5; // 8'b1101_0010
                                    end
                                    else begin // 8'b1101_000x 
                                        if (b0) byte <= 8'h3e; // 8'b1101_0001 
                                        else byte <= 8'h70; // 8'b1101_0000 
                                    end
                                end
                            end
                        end
                        else begin // 8'b1100_xxxx
                            if (b3) begin // 8'b1100_1xxx
                                if (b2) begin // 8'b1100_11xx
                                    if (b1) begin // 8'b1100_111x
                                        if (b0) byte <= 8'h8a; // 8'b1100_1110
                                        else byte <= 8'h8b; // 8'b1100_1111
                                    end
                                    else begin // 8'b1100_110x
                                        if (b0) byte <= 8'hbd; // 8'b1100_1101
                                        else byte <= 8'h4b; // 8'b1100_1100
                                    end
                                end
                                else begin // 8'b1100_10xx
                                    if (b1) begin // 8'b1100_101x
                                        if (b0) byte <= 8'h1f; // 8'b1100_1011
                                        else byte <= 8'h74; // 8'b1100_1010
                                    end
                                    else begin // 8'b1100_100x
                                        if (b0) byte <= 8'hdd; // 8'b1100_1001
                                        else byte <= 8'he8; // 8'b1100_1000
                                    end
                                end
                            end
                            else begin // 8'b1100_0xxx
                                if (b2) begin // 8'b1100_01xx
                                    if (b1) begin // 8'b1100_011x
                                        if (b0) byte <= 8'hc6; // 8'b1100_0111
                                        else byte <= 8'hb4; // 8'b1100_01110
                                    end
                                    else begin // 8'b1100_010x
                                        if (b0) byte <= 8'ha6; // 8'b1100_0101
                                        else byte <= 8'h1c; // 8'b1100_0100
                                    end
                                end
                                else begin // 8'b1100_00xx
                                    if (b1) begin // 8'b1100_001x
                                        if (b0) byte <= 8'h2e; // 8'b1100_0011
                                        else byte <= 8'h25; // 8'b1100_0010
                                    end
                                    else begin // 8'b1100_000x
                                        if (b0) byte <= 8'h78; // 8'b1100_0001
                                        else byte <= 8'hba; // 8'b1100_0000
                                    end
                                end
                            end
                        end
                    end
                end
                else begin // 8'b10xx_xxxx
                    if (b5) begin // 8'b101x_xxxx
                        if (b4) begin // 8'b1011_xxxx
                            if (b3) begin // 8'b1011_1xxx
                                if (b2) begin // 8'b1011_11xx
                                    if (b1) begin // 8'b1011_111x
                                        if (b0) byte <= 8'h08; // 8'b1011_1111
                                        else byte <= 8'hae; // 8'b1011_1110
                                    end
                                    else begin // 8'b1011_110x
                                        if (b0) byte <= 8'h7a; // 8'b1011_1101
                                        else byte <= 8'h65; // 8'b1011_1100
                                    end
                                end
                                else begin // 8'b1011_10xx
                                    if (b1) begin // 8'b1011_101x
                                        if (b0) byte <= 8'hea; // 8'b1011_1011
                                        else byte <= 8'hf4; // 8'b1011_1010
                                    end
                                    else begin // 8'b1011_100x
                                        if (b0) byte <= 8'h56; // 8'b1011_1001
                                        else byte <= 8'h6c; // 8'b1011_1000
                                    end
                                end
                            end
                            else begin // 8'b1011_0xxx
                                if (b2) begin // 8'b1011_01xx
                                    if (b1) begin // 8'b1011_011x
                                        if (b0) byte <= 8'ha9; // 8'b1011_0111
                                        else byte <= 8'h4e; // 8'b1011_0110
                                    end
                                    else begin // 8'b1011_010x
                                        if (b0) byte <= 8'hd5; // 8'b1011_0101
                                        else byte <= 8'h8d; // 8'b1011_0100
                                    end
                                end
                                else begin // 8'b1011_00xx
                                    if (b1) begin // 8'b1011_001x
                                        if (b0) byte <= 8'h6d; // 8'b1011_0011
                                        else byte <= 8'h37; // 8'b1011_0010
                                    end
                                    else begin // 8'b1011_000x
                                        if (b0) byte <= 8'hc8; // 8'b1011_0001
                                        else byte <= 8'he7; // 8'b1011_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1010_xxxx
                            if (b3) begin // 8'b1010_1xxx
                                if (b2) begin // 8'b1010_11xx
                                    if (b1) begin // 8'b1010_111x
                                        if (b0) byte <= 8'h79; // 8'b1010_1111
                                        else byte <= 8'he4; // 8'b1010_1110
                                    end
                                    else begin // 8'b1010_110x
                                        if (b0) byte <= 8'h95; // 8'b1010_1101
                                        else byte <= 8'h91; // 8'b1010_1100
                                    end
                                end
                                else begin // 8'b1010_10xx
                                    if (b1) begin // 8'b1010_101x
                                        if (b0) byte <= 8'h62;  // 8'b1010_1011
                                        else byte <= 8'hac; // 8'b1010_1010
                                    end
                                    else begin // 8'b1010_100x
                                        if (b0) byte <= 8'hd3; // 8'b1010_1001
                                        else byte <= 8'hc2; // 8'b1010_1000
                                    end
                                end
                            end
                            else begin // 8'b1010_0xxx
                                if (b2) begin // 8'b1010_01xx
                                    if (b1) begin // 8'b1010_011x
                                        if (b0) byte <= 8'h5c; // 8'b1010_0111
                                        else byte <= 8'h24; // 8'b1010_0110
                                    end
                                    else begin // 8'b1010_010x
                                        if (b0) byte <= 8'h06; // 8'b1010_0101
                                        else byte <= 8'h49; // 8'b1010_0100
                                    end
                                end
                                else begin // 8'b1010_00xx
                                    if (b1) begin // 8'b1010_001x
                                        if (b0) byte <= 8'h0a;  // 8'b1010_0011
                                        else byte <= 8'h3a;  // 8'b1010_0010
                                    end
                                    else begin // 8'b1010_000x
                                        if (b0) byte <= 8'h32;  // 8'b1010_0001
                                        else byte <= 8'he0; // 8'b1010_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b100x_xxxx
                        if (b4) begin // 8'b1001_xxxx
                            if (b3) begin // 8'b1001_1xxx
                                if (b2) begin // 8'b1001_11xx
                                    if (b1) begin // 8'b1001_111x
                                        if (b0) byte <= 8'hdb; // 8'b1001_1111
                                        else byte <= 8'h0b; // 8'b1001_1110
                                    end
                                    else begin // 8'b1001_110x
                                        if (b0) byte <= 8'h5e; // 8'b1001_1101
                                        else byte <= 8'hde; // 8'b1001_1100
                                    end
                                end
                                else begin // 8'b1001_10xx
                                    if (b1) begin // 8'b1001_101x
                                        if (b0) byte <= 8'h14; // 8'b1001_1011
                                        else byte <= 8'hb8; // 8'b1001_1010
                                    end
                                    else begin // 8'b1001_100x
                                        if (b0) byte <= 8'hee; // 8'b1001_1001
                                        else byte <= 8'h46; // 8'b1001_1000
                                    end
                                end
                            end
                            else begin // 8'b1001_0xxx
                                if (b2) begin // 8'b1001_01xx
                                    if (b1) begin // 8'b1001_011x
                                        if (b0) byte <= 8'h88; // 8'b1001_0111
                                        else byte <= 8'h90; // 8'b1001_0110
                                    end
                                    else begin // 8'b1001_010x
                                        if (b0) byte <= 8'h2a; // 8'b1001_0101
                                        else byte <= 8'h22; // 8'b1001_0100
                                    end
                                end
                                else begin // 8'b1001_00xx
                                    if (b1) begin // 8'b1001_001x
                                        if (b0) byte <= 8'hdc; // 8'b1001_0011
                                        else byte <= 8'h4f; // 8'b1001_0010
                                    end
                                    else begin // 8'b1001_000x
                                        if (b0) byte <= 8'h81; // 8'b1001_0001
                                        else byte <= 8'h60; // 8'b1001_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1000_xxxx
                            if (b3) begin // 8'b1000_1xxx
                                if (b2) begin // 8'b1000_11xx
                                    if (b1) begin // 8'b1000_111x
                                        if (b0) byte <= 8'h73; // 8'b1000_1111
                                        else byte <= 8'h19; // 8'b1000_1110
                                    end
                                    else begin // 8'b1000_110x
                                        if (b0) byte <= 8'h5d; // 8'b1000_1101
                                        else byte <= 8'h64; // 8'b1000_1100
                                    end
                                end
                                else begin // 8'b1000_10xx
                                    if (b1) begin // 8'b1000_101x
                                        if (b0) byte <= 8'h3d; // 8'b1000_1011
                                        else byte <= 8'h7e; // 8'b1000_1010
                                    end
                                    else begin // 8'b1000_100x
                                        if (b0) byte <= 8'ha7; // 8'b1000_1001
                                        else byte <= 8'hc4; // 8'b1000_1000
                                    end
                                end
                            end
                            else begin // 8'b1000_0xxx
                                if (b2) begin // 8'b1000_01xx
                                    if (b1) begin // 8'b1000_011x
                                        if (b0) byte <= 8'h17; // 8'b1000_0111
                                        else byte <= 8'h44; // 8'b1000_0110
                                    end
                                    else begin // 8'b1000_010x
                                        if (b0) byte <= 8'h97; // 8'b1000_0101
                                        else byte <= 8'h5f; // 8'b1000_0100
                                    end
                                end
                                else begin // 8'b1000_00xx
                                    if (b1) begin // 8'b1000_001x
                                        if (b0) byte <= 8'hec; // 8'b1000_0011
                                        else byte <= 8'h13; // 8'b1000_0010
                                    end
                                    else begin // 8'b1000_000x
                                        if (b0) byte <= 8'h0c; // 8'b1000_0001
                                        else byte <= 8'hcd; // 8'b1000_0000
                                    end
                                end
                            end
                        end
                    end
                end
            end
            else begin // 8'b0xxx_xxxx
                if (b6) begin // 8'b01xx_xxxx
                    if (b5) begin // 8'b011x_xxxx
                        if (b4) begin // 8'b0111_xxxx
                            if (b3) begin // 8'b0111_1xxx
                                if (b2) begin // 8'b0111_11xx
                                    if (b1) begin // 8'b0111_111x
                                        if (b0) byte <= 8'hd2; // 8'b0111_1111
                                        else byte <= 8'hf3; // 8'b0111_1110
                                    end
                                    else begin // 8'b0111_110x
                                        if (b0) byte <= 8'hff;  // 8'b0111_1101
                                        else byte <= 8'h10;  // 8'b0111_1100
                                    end
                                end
                                else begin // 8'b0111_10xx
                                    if (b1) begin // 8'b0111_101x
                                        if (b0) byte <= 8'h21; // 8'b0111_1011
                                        else byte <= 8'hda; // 8'b0111_1010
                                    end
                                    else begin // 8'b0111_100x
                                        if (b0) byte <= 8'hb6;  // 8'b0111_1001
                                        else byte <= 8'hbc; // 8'b0111_1000
                                    end
                                end
                            end
                            else begin // 8'b0111_0xxx
                                if (b2) begin // 8'b0111_01xx
                                    if (b1) begin // 8'b0111_011x
                                        if (b0) byte <= 8'hf5; // 8'b0111_0111
                                        else byte <= 8'h38; // 8'b0111_0110
                                    end
                                    else begin // 8'b0111_010x
                                        if (b0) byte <= 8'h9d; // 8'b0111_0101
                                        else byte <= 8'h92; // 8'b0111_0100
                                    end
                                end
                                else begin  // 8'b0111_00xx
                                    if (b1) begin // 8'b0111_001x
                                        if (b0) byte <= 8'h8f; // 8'b0111_0011
                                        else byte <= 8'h40; // 8'b0111_0010
                                    end
                                    else begin // 8'b0111_000x
                                        if (b0) byte <= 8'ha3; // 8'b0111_0001
                                        else byte <= 8'h51; // 8'b0111_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0110_xxxx 
                            if (b3) begin // 8'b0110_1xxx
                                if (b2) begin // 8'b0110_11xx 
                                    if (b1) begin // 8'b0110_111x
                                        if (b0) byte <= 8'ha8; // 8'b0110_1111
                                        else byte <= 8'h9f; // 8'b0110_1110
                                    end
                                    else begin // 8'b0110_110x
                                        if (b0) byte <= 8'h3c; // 8'b0110_1101
                                        else byte <= 8'h50; // 8'b0110_1100
                                    end
                                end
                                else begin // 8'b0110_10xx 
                                    if (b1) begin // 8'b0110_101x 
                                        if (b0) byte <= 8'h7f; // 8'b0110_1011 
                                        else byte <= 8'h02; // 8'b0110_1010
                                    end
                                    else begin // 8'b0110_10x 
                                        if (b0) byte <= 8'hf9; // 8'b0110_1001
                                        else byte <= 8'h45; // 8'b0110_1000
                                    end
                                end
                            end
                            else begin // 8'b0110_0xxx
                                if (b2) begin // 8'b0110_01xx
                                    if (b1) begin // 8'b0110_011x
                                        if (b0) byte <= 8'h85; // 8'b0110_0111
                                        else byte <= 8'h33; // 8'b0110_0110
                                    end
                                    else begin // 8'b0110_010x
                                        if (b0) byte <= 8'h4d; // 8'b0110_0101
                                        else byte <= 8'h43; // 8'b0110_0100
                                    end
                                end
                                else begin // 8'b0110_00xx
                                    if (b1) begin // 8'b0110_001x
                                        if (b0) byte <= 8'hfb; // 8'b0110_0011
                                        else byte <= 8'haa; // 8'b0110_0010
                                    end
                                    else begin // 8'b0110_000x
                                        if (b0) byte <= 8'hef; // 8'b0110_0001
                                        else byte <= 8'hd0; // 8'b0110_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b010x_xxxx
                        if (b4) begin // 8'b0101_xxxx
                            if (b3) begin  // 8'b0101_1xxx
                                if (b2) begin  // 8'b0101_11xx
                                    if (b1) begin // 8'b0101_111x
                                        if (b0) byte <= 8'hcf; // 8'b0101_1111 
                                        else byte <= 8'h58; // 8'b0101_1110
                                    end
                                    else begin // 8'b0101_110x
                                        if (b0) byte <= 8'h4c; // 8'b0101_1101
                                        else byte <= 8'h4a; // 8'b0101_1100
                                    end
                                end
                                else begin // 8'b0101_10xx
                                    if (b1) begin  // 8'b0101_101x
                                        if (b0) byte <= 8'h39;  // 8'b0101_1011
                                        else byte <= 8'hbe;  // 8'b0101_1010
                                    end
                                    else begin  // 8'b0101_100x
                                        if (b0) byte <= 8'hcb;  // 8'b0101_1001
                                        else byte <= 8'h6a;  // 8'b0101_1000
                                    end
                                end
                            end
                            else begin // 8'b0101_0xxx
                                if (b2) begin // 8'b0101_01xx
                                    if (b1) begin // 8'b0101_011x
                                        if (b0) byte <= 8'h5b; // 8'b0101_0111
                                        else byte <= 8'hb1; // 8'b0101_0110
                                    end
                                    else begin // 8'b0101_010x
                                        if (b0) byte <= 8'hfc; // 8'b0101_0101
                                        else byte <= 8'h20; // 8'b0101_0100
                                    end
                                end
                                else begin // 8'b0101_00xx
                                    if (b1) begin // 8'b0101_001x
                                        if (b0) byte <= 8'hed; // 8'b0101_0011
                                        else byte <= 8'h00; // 8'b0101_0010
                                    end
                                    else begin // 8'b0101_000x
                                        if (b0) byte <= 8'hd1; // 8'b0101_0001
                                        else byte <= 8'h53; // 8'b0101_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0100_xxxx
                            if (b3) begin // 8'b0100_1xxx
                                if (b2) begin // 8'b0100_11xx
                                    if (b1) begin  // 8'b0100_111x
                                        if (b0) byte <= 8'h84; // 8'b0100_1111
                                        else byte <= 8'h2f;  // 8'b0100_1110
                                    end
                                    else begin // 8'b0100_110x
                                        if (b0) byte <= 8'he3; // 8'b0100_1101
                                        else byte <= 8'h29; // 8'b0100_1100
                                    end
                                end
                                else begin // 8'b0100_10xx
                                    if (b1) begin // 8'b0100_101x
                                        if (b0) byte <= 8'hb3; // 8'b0100_1011
                                        else byte <= 8'hd6; // 8'b0100_1010
                                    end
                                    else begin // 8'b0100_100x
                                        if (b0) byte <= 8'h3b; // 8'b0100_1001
                                        else byte <= 8'h52; // 8'b0100_1000
                                    end
                                end
                            end
                            else begin // 8'b0100_0xxx
                                if (b2) begin // 8'b0100_01xx
                                    if (b1) begin // 8'b0100_011x
                                        if (b0) byte <= 8'ha0; // 8'b0100_0111
                                        else byte <= 8'h5a; // 8'b0100_0110
                                    end
                                    else begin // 8'b0100_010x
                                        if (b0) byte <= 8'h6e; // 8'b0100_0101
                                        else byte <= 8'h1b; // 8'b0100_0100
                                    end
                                end
                                else begin // 8'b0100_00xx
                                    if (b1) begin // 8'b0100_001x
                                        if (b0) byte <= 8'h1a; // 8'b0100_0011
                                        else byte <= 8'h2c; // 8'b0100_0010
                                    end
                                    else begin // 8'b0100_000x
                                        if (b0) byte <= 8'h83; // 8'b0100_0001
                                        else byte <= 8'h09; // 8'b0100_0000
                                    end
                                end
                            end
                        end
                    end
                end
                else begin // 8'b00xx_xxxx
                    if (b5) begin // 8'b001x_xxxx
                        if (b4) begin // 8'b0011_xxxx
                            if (b3) begin // 8'b0011_1xxx
                                if (b2) begin // 8'b0011_11xx
                                    if (b1) begin // 8'b0011_111x
                                        if (b0) byte <= 8'h75; // 8'b0011_1111 
                                        else byte <= 8'hb2; // 8'b0011_1110
                                    end
                                    else begin // 8'b0011_110x
                                        if (b0) byte <= 8'h27; // 8'b0011_1101
                                        else byte <= 8'heb; // 8'b0011_1100
                                    end
                                end
                                else begin // 8'b0011_10xx
                                    if (b1) begin // 8'b0011_101x
                                        if (b0) byte <= 8'he2; // 8'b0011_1001
                                        else byte <= 8'h80; // 8'b0011_1000
                                    end
                                    else begin // 8'b0011_100x
                                        if (b0) byte <= 8'h12; // 8'b0011_1001
                                        else byte <= 8'h07; // 8'b0011_1000
                                    end
                                end
                            end
                            else begin // 8'b0011_0xxx
                                if (b2) begin // 8'b0011_01xx
                                    if (b1) begin // 8'b0011_011x
                                        if (b0) byte <= 8'h9a; // 8'b0011_0111
                                        else byte <= 8'h05; // 8'b0011_0110
                                    end
                                    else begin // 8'b0011_010x
                                        if (b0) byte <= 8'h96; // 8'b0011_0101
                                        else byte <= 8'h18; // 8'b0011_0100
                                    end
                                end
                                else begin // 8'b0011_00xx
                                    if (b1) begin // 8'b0011_001x
                                        if (b0) byte <= 8'hc3; // 8'b0011_0011
                                        else byte <= 8'h23; // 8'b0011_0010
                                    end
                                    else begin // 8'b0011_000x
                                        if (b0) byte <= 8'hc7; // 8'b0011_0001
                                        else byte <= 8'h04; // 8'b0011_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0010_xxxx
                            if (b3) begin // 8'b0010_1xxx
                                if (b2) begin // 8'b0010_11xx
                                    if (b1) begin // 8'b0010_111x
                                        if (b0) byte <= 8'h15; // 8'b0010_1111
                                        else byte <= 8'h31; // 8'b0010_1110
                                    end
                                    else begin // 8'b0010_110x
                                        if (b0) byte <= 8'hd8; // 8'b0010_1101
                                        else byte <= 8'h71; // 8'b0010_1100
                                    end
                                end
                                else begin // 8'b0010_10xx
                                    if (b1) begin // 8'b0010_101x
                                        if (b0) byte <= 8'hf1; // 8'b0010_1011
                                        else byte <= 8'he5; // 8'b0010_1010
                                    end
                                    else begin // 8'b0010_100x
                                        if (b0) byte <= 8'ha5; // 8'b0010_1001
                                        else byte <= 8'h34; // 8'b0010_1000
                                    end
                                end
                            end
                            else begin // 8'b0010_0xxx
                                if (b2) begin // 8'b0010_01xx
                                    if (b1) begin // 8'b0010_011x
                                        if (b0) byte <= 8'hcc; // 8'b0010_0111
                                        else byte <= 8'hf7; // 8'b0010_0110
                                    end
                                    else begin // 8'b0010_010x
                                        if (b0) byte <= 8'h3f; // 8'b0010_0101
                                        else byte <= 8'h36; // 8'b0010_0100
                                    end
                                end
                                else begin // 8'b0010_00xx
                                    if (b1) begin // 8'b0010_001x
                                        if (b0) byte <= 8'h26; // 8'b0010_0011
                                        else byte <= 8'h93; // 8'b0010_0010
                                    end
                                    else begin // 8'b0010_000x
                                        if (b0) byte <= 8'hfd; // 8'h21
                                        else byte <= 8'hb7; // 8'h20
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b000x_xxxx
                        if (b4) begin // 8'b0001_xxxx
                            if (b3) begin // 8'b0001_1xxx
                                if (b2) begin // 8'b0001_11xx
                                    if (b1) begin // 8'b0001_111x
                                        if (b0) byte <= 8'hc0; // 8'h1f
                                        else byte <= 8'h72; // 8'h1e
                                    end
                                    else begin // 8'b0001_110x
                                        if (b0) byte <= 8'ha4; // 8'h1d
                                        else byte <= 8'h9c; // 8'h1c
                                    end
                                end
                                else begin // 8'b0001_10xx
                                    if (b1) begin // 8'b0001_101x
                                        if (b0) byte <= 8'haf; // 8'h1b
                                        else byte <= 8'ha2; // 8'h1a
                                    end
                                    else begin // 8'b0001_100x
                                        if (b0) byte <= 8'hd4; // 8'h19
                                        else byte <= 8'had; // 8'h18
                                    end
                                end
                            end
                            else begin // 8'b0001_0xxx
                                if (b2) begin  // 8'b0001_01xx
                                    if (b1) begin  // 8'b0001_011x
                                        if (b0) byte <= 8'hf0;  // 8'h17
                                        else byte <= 8'h47; // 8'h16
                                    end
                                    else begin // 8'b0001_010x
                                        if (b0) byte <= 8'h59; // 8'h15
                                        else byte <= 8'hfa; // 8'h14
                                    end
                                end
                                else begin // 8'b0001_00xx
                                    if (b1) begin // 8'b0001_001x
                                        if (b0) byte <= 8'h7d; // 8'h13
                                        else byte <= 8'hc9; // 8'h12
                                    end
                                    else begin // 8'b0001_000x
                                        if (b0) byte <= 8'h82; // 8'h11
                                        else byte <= 8'hca; // 8'h10
                                    end
                                end
                            end
                        end
                        else begin // 8'b0000_xxxx
                            if (b3) begin // 8'b0000_1xxx
                                if (b2) begin // 8'b0000_11xx
                                    if (b1) begin // 8'b0000_111x
                                        if (b0) byte <= 8'h76; // 8'h0f
                                        else byte <= 8'hab; // 8'h0e
                                    end
                                    else begin // 8'b0000_110x
                                        if (b0) byte <= 8'hd7; // 8'h0d
                                        else byte <= 8'hfe; // 8'h0c
                                    end
                                end
                                else begin // 8'b0000_10xx
                                    if (b1) begin // 8'b0000_101x
                                        if (b0) byte <= 8'h2b; // 8'h0b
                                        else byte <= 8'h67; // 8'h0a
                                    end
                                    else begin // 8'b0000_100x
                                        if (b0) byte <= 8'h01;  // 8'h09
                                        else byte <= 8'h30;  // 8'h08
                                    end
                                end
                            end
                            else begin // 8'b0000_0xxx
                                if (b2) begin // 8'b0000_01XX
                                    if (b1) begin // 8'b0000_011X
                                        if (b0) byte <= 8'hc5; // 8'h07
                                        else byte <= 8'h6f; // 8'h06
                                    end
                                    else begin // 8'b0000_010X
                                        if (b0) byte <= 8'h6b; // 8'h05
                                        else byte <= 8'hf2; // 8'h04
                                    end
                                end // 8'b0000_00XX
                                else begin
                                    if (b1) begin // 8'b0000_001X
                                        if (b0) byte <= 8'h7b; // 8'h03
                                        else byte <= 8'h77; // 8'h02
                                    end
                                    else begin
                                        if (b0) byte <= 8'h7c; // 8'h01
                                        else byte <= 8'h63; // 8'h00
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        else begin // Inv-Sbox     
            if (b7) begin // 8'b1xxx_xxxx
                if (b6) begin // 8'b11xx_xxxx
                    if (b5) begin // 8'b111x_xxxx 
                        if (b4) begin // 8'b1111_xxxx
                            if (b3) begin // 8'b1111_1xxx
                                if (b2) begin // 8'b1111_11xx
                                    if (b1) begin // 8'b1111_111x
                                        if (b0) byte <= 8'h7d; // 8'hff
                                        else byte <= 8'h0c; // 8'hfe
                                    end 
                                    else begin // 8'b1111_110x
                                        if (b0) byte <= 8'h21; // 8'b1111_1101
                                        else byte <= 8'h55; // 8'b1111_1100
                                    end
                                end
                                else begin // 8'b1111_10xx
                                    if (b1) begin // 8'b1111_101x
                                        if (b0) byte <= 8'h63; // 8'b1111_1011
                                        else byte <= 8'h14; // 8'b1111_1010
                                    end
                                    else begin // 8'b1111_100x
                                        if (b0) byte <= 8'h69; // 8'b1111_1001
                                        else byte <= 8'he1; // 8'b1111_1000
                                    end
                                end
                            end
                            else begin // 8'b1111_0xxx
                                if (b2) begin // 8'b1111_01xx
                                    if (b1) begin // 8'b1111_011x
                                        if (b0) byte <= 8'h26; // 8'b1111_0111
                                        else byte <= 8'hd6; // 8'b1111_0110
                                    end
                                    else begin // 8'b1111_010x
                                        if (b0) byte <= 8'h77; // 8'b1111_0101
                                        else byte <= 8'hba; // 8'b1111_0100
                                    end
                                end
                                else begin // 8'b1111_00xx
                                    if (b1) begin // 8'b1111_001x
                                        if (b0) byte <= 8'h7e; // 8'b1111_0011
                                        else byte <= 8'h04; // 8'b1111_0010
                                    end
                                    else begin // 8'b1111_000x
                                        if (b0) byte <= 8'h2b; // 8'b1111_0001
                                        else byte <= 8'h17; // 8'b1111_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1110_xxxx
                            if (b3) begin // 8'b1110_1xxx
                                if (b2) begin // 8'b1110_11xx
                                    if (b1) begin // 8'b1110_111x
                                        if (b0) byte <= 8'h61; // 8'b1110_1111
                                        else byte <= 8'h99; // 8'b1110_1110
                                    end
                                    // 8'b1110_110x
                                    else begin
                                        if (b0) byte <= 8'h53; // 8'b1110_1101
                                        else byte <= 8'h83; // 8'b1110_1100
                                    end
                                end
                                else begin // 8'b1110_10xx
                                    if (b1) begin // 8'b1110_101x
                                        if (b0) byte <= 8'h3c; // 8'b1110_1011
                                        else byte <= 8'hbb; // 8'b1110_1010
                                    end
                                    else begin // 8'b1110_100x
                                        if (b0) byte <= 8'heb; // 8'b1110_1001
                                        else byte <= 8'hc8; // 8'b1110_1000
                                    end
                                end
                            end
                            else begin // 8'b1110_0xxx
                                if (b2) begin // 8'b1110_01xx
                                    if (b1) begin // 8'b1110_011x
                                        if (b0) byte <= 8'hb0; // 8'b1110_0111
                                        else byte <= 8'hf5; // 8'b1110_0110
                                    end
                                    else begin // 8'b1110_010x
                                        if (b0) byte <= 8'h2a; // 8'b1110_0101
                                        else byte <= 8'hae; // 8'b1110_0100
                                    end
                                end
                                else begin // 8'b1110_00xx
                                    if (b1) begin // 8'b1110_001x
                                        if (b0) byte <= 8'h4d; // 8'b1110_0011
                                        else byte <= 8'h3b; // 8'b1110_0010
                                    end
                                    else begin // 8'b1110_000x
                                        if (b0) byte <= 8'he0; // 8'b1110_0001
                                        else byte <= 8'ha0; // 8'b1110_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b110x_xxxx 
                        if (b4) begin // 8'b1101_xxxx 
                            if (b3) begin // 8'b1101_1xxx 
                                if (b2) begin // 8'b1101_11xx 
                                    if (b1) begin // 8'b1101_111x
                                        if (b0) byte <= 8'hef; // 8'b1101_1111
                                        else byte <= 8'h9c; // 8'b1101_1110
                                    end
                                    else begin // 8'b1101_110x
                                        if (b0) byte <= 8'hc9; // 8'b1101_1101
                                        else byte <= 8'h93; // 8'b1101_1100
                                    end
                                end
                                else begin // 8'b1101_10xx 
                                    if (b1) begin // 8'b1101_101x
                                        if (b0) byte <= 8'h9f; // 8'b1101_1011
                                        else byte <= 8'h7a; // 8'b1101_1010
                                    end
                                    else begin // 8'b1101_100x
                                        if (b0) byte <= 8'he5; // 8'b1101_1011
                                        else byte <= 8'h2d; // 8'b1101_1010
                                    end
                                end
                            end
                            else begin // 8'b1101_0xxx 
                                if (b2) begin // 8'b1101_01xx 
                                    if (b1) begin // 8'b1101_011x 
                                        if (b0) byte <= 8'h0d; // 8'b1101_0111
                                        else byte <= 8'h4a; // 8'b1101_0110
                                    end
                                    else begin // 8'b1101_010x 
                                        if (b0) byte <= 8'hb5; // 8'b1101_0101 
                                        else byte <= 8'h19; // 8'b1101_0100
                                    end
                                end
                                else begin // 8'b1101_00xx 
                                    if (b1) begin // 8'b1101_001x 
                                        if (b0) byte <= 8'ha9; // 8'b1101_0011 
                                        else byte <= 8'h7f; // 8'b1101_0010
                                    end
                                    else begin // 8'b1101_000x 
                                        if (b0) byte <= 8'h51; // 8'b1101_0001 
                                        else byte <= 8'h60; // 8'b1101_0000 
                                    end
                                end
                            end
                        end
                        else begin // 8'b1100_xxxx
                            if (b3) begin // 8'b1100_1xxx
                                if (b2) begin // 8'b1100_11xx
                                    if (b1) begin // 8'b1100_111x
                                        if (b0) byte <= 8'h5f; // 8'b1100_1110
                                        else byte <= 8'hec; // 8'b1100_1111
                                    end
                                    else begin // 8'b1100_110x
                                        if (b0) byte <= 8'h80; // 8'b1100_1101
                                        else byte <= 8'h27; // 8'b1100_1100
                                    end
                                end
                                else begin // 8'b1100_10xx
                                    if (b1) begin // 8'b1100_101x
                                        if (b0) byte <= 8'h59; // 8'b1100_1011
                                        else byte <= 8'h10; // 8'b1100_1010
                                    end
                                    else begin // 8'b1100_100x
                                        if (b0) byte <= 8'h12; // 8'b1100_1001
                                        else byte <= 8'hb1; // 8'b1100_1000
                                    end
                                end
                            end
                            else begin // 8'b1100_0xxx
                                if (b2) begin // 8'b1100_01xx
                                    if (b1) begin // 8'b1100_011x
                                        if (b0) byte <= 8'h31; // 8'b1100_0111
                                        else byte <= 8'hc7; // 8'b1100_01110
                                    end
                                    else begin // 8'b1100_010x
                                        if (b0) byte <= 8'h07; // 8'b1100_0101
                                        else byte <= 8'h88; // 8'b1100_0100
                                    end
                                end
                                else begin // 8'b1100_00xx
                                    if (b1) begin // 8'b1100_001x
                                        if (b0) byte <= 8'h33; // 8'b1100_0011
                                        else byte <= 8'ha8; // 8'b1100_0010
                                    end
                                    else begin // 8'b1100_000x
                                        if (b0) byte <= 8'hdd; // 8'b1100_0001
                                        else byte <= 8'h1f; // 8'b1100_0000
                                    end
                                end
                            end
                        end
                    end
                end
                else begin // 8'b10xx_xxxx
                    if (b5) begin // 8'b101x_xxxx
                        if (b4) begin // 8'b1011_xxxx
                            if (b3) begin // 8'b1011_1xxx
                                if (b2) begin // 8'b1011_11xx
                                    if (b1) begin // 8'b1011_111x
                                        if (b0) byte <= 8'hf4; // 8'b1011_1111
                                        else byte <= 8'h5a; // 8'b1011_1110
                                    end
                                    else begin // 8'b1011_110x
                                        if (b0) byte <= 8'hcd; // 8'b1011_1101
                                        else byte <= 8'h78; // 8'b1011_1100
                                    end
                                end
                                else begin // 8'b1011_10xx
                                    if (b1) begin // 8'b1011_101x
                                        if (b0) byte <= 8'hfe; // 8'b1011_1011
                                        else byte <= 8'hc0; // 8'b1011_1010
                                    end
                                    else begin // 8'b1011_100x
                                        if (b0) byte <= 8'hdb; // 8'b1011_1001
                                        else byte <= 8'h9a; // 8'b1011_1000
                                    end
                                end
                            end
                            else begin // 8'b1011_0xxx
                                if (b2) begin // 8'b1011_01xx
                                    if (b1) begin // 8'b1011_011x
                                        if (b0) byte <= 8'h20; // 8'b1011_0111
                                        else byte <= 8'h79; // 8'b1011_0110
                                    end
                                    else begin // 8'b1011_010x
                                        if (b0) byte <= 8'hd2; // 8'b1011_0101
                                        else byte <= 8'hc6; // 8'b1011_0100
                                    end
                                end
                                else begin // 8'b1011_00xx
                                    if (b1) begin // 8'b1011_001x
                                        if (b0) byte <= 8'h4b; // 8'b1011_0011
                                        else byte <= 8'h3e; // 8'b1011_0010
                                    end
                                    else begin // 8'b1011_000x
                                        if (b0) byte <= 8'h56; // 8'b1011_0001
                                        else byte <= 8'hfc; // 8'b1011_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1010_xxxx
                            if (b3) begin // 8'b1010_1xxx
                                if (b2) begin // 8'b1010_11xx
                                    if (b1) begin // 8'b1010_111x
                                        if (b0) byte <= 8'h1b; // 8'b1010_1111
                                        else byte <= 8'hbe; // 8'b1010_1110
                                    end
                                    else begin // 8'b1010_110x
                                        if (b0) byte <= 8'h18; // 8'b1010_1101
                                        else byte <= 8'haa; // 8'b1010_1100
                                    end
                                end
                                else begin // 8'b1010_10xx
                                    if (b1) begin // 8'b1010_101x
                                        if (b0) byte <= 8'h0e;  // 8'b1010_1011
                                        else byte <= 8'h62; // 8'b1010_1010
                                    end
                                    else begin // 8'b1010_100x
                                        if (b0) byte <= 8'hb7; // 8'b1010_1001
                                        else byte <= 8'h6f; // 8'b1010_1000
                                    end
                                end
                            end
                            else begin // 8'b1010_0xxx
                                if (b2) begin // 8'b1010_01xx
                                    if (b1) begin // 8'b1010_011x
                                        if (b0) byte <= 8'h89; // 8'b1010_0111
                                        else byte <= 8'hc5; // 8'b1010_0110
                                    end
                                    else begin // 8'b1010_010x
                                        if (b0) byte <= 8'h29; // 8'b1010_0101
                                        else byte <= 8'h1d; // 8'b1010_0100
                                    end
                                end
                                else begin // 8'b1010_00xx
                                    if (b1) begin // 8'b1010_001x
                                        if (b0) byte <= 8'h71;  // 8'b1010_0011
                                        else byte <= 8'h1a;  // 8'b1010_0010
                                    end
                                    else begin // 8'b1010_000x
                                        if (b0) byte <= 8'hf1;  // 8'b1010_0001
                                        else byte <= 8'h47; // 8'b1010_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b100x_xxxx
                        if (b4) begin // 8'b1001_xxxx
                            if (b3) begin // 8'b1001_1xxx
                                if (b2) begin // 8'b1001_11xx
                                    if (b1) begin // 8'b1001_111x
                                        if (b0) byte <= 8'h6e; // 8'b1001_1111
                                        else byte <= 8'hdf; // 8'b1001_1110
                                    end
                                    else begin // 8'b1001_110x
                                        if (b0) byte <= 8'h75; // 8'b1001_1101
                                        else byte <= 8'h1c; // 8'b1001_1100
                                    end
                                end
                                else begin // 8'b1001_10xx
                                    if (b1) begin // 8'b1001_101x
                                        if (b0) byte <= 8'he8; // 8'b1001_1011
                                        else byte <= 8'h37; // 8'b1001_1010
                                    end
                                    else begin // 8'b1001_100x
                                        if (b0) byte <= 8'hf9; // 8'b1001_1001
                                        else byte <= 8'he2; // 8'b1001_1000
                                    end
                                end
                            end
                            else begin // 8'b1001_0xxx
                                if (b2) begin // 8'b1001_01xx
                                    if (b1) begin // 8'b1001_011x
                                        if (b0) byte <= 8'h85; // 8'b1001_0111
                                        else byte <= 8'h35; // 8'b1001_0110
                                    end
                                    else begin // 8'b1001_010x
                                        if (b0) byte <= 8'had; // 8'b1001_0101
                                        else byte <= 8'he7; // 8'b1001_0100
                                    end
                                end
                                else begin // 8'b1001_00xx
                                    if (b1) begin // 8'b1001_001x
                                        if (b0) byte <= 8'h22; // 8'b1001_0011
                                        else byte <= 8'h74; // 8'b1001_0010
                                    end
                                    else begin // 8'b1001_000x
                                        if (b0) byte <= 8'hac; // 8'b1001_0001
                                        else byte <= 8'h96; // 8'b1001_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b1000_xxxx
                            if (b3) begin // 8'b1000_1xxx
                                if (b2) begin // 8'b1000_11xx
                                    if (b1) begin // 8'b1000_111x
                                        if (b0) byte <= 8'h73; // 8'b1000_1111
                                        else byte <= 8'he6; // 8'b1000_1110
                                    end
                                    else begin // 8'b1000_110x
                                        if (b0) byte <= 8'hb4; // 8'b1000_1101
                                        else byte <= 8'hf0; // 8'b1000_1100
                                    end
                                end
                                else begin // 8'b1000_10xx
                                    if (b1) begin // 8'b1000_101x
                                        if (b0) byte <= 8'hce; // 8'b1000_1011
                                        else byte <= 8'hcf; // 8'b1000_1010
                                    end
                                    else begin // 8'b1000_100x
                                        if (b0) byte <= 8'hf2; // 8'b1000_1001
                                        else byte <= 8'h97; // 8'b1000_1000
                                    end
                                end
                            end
                            else begin // 8'b1000_0xxx
                                if (b2) begin // 8'b1000_01xx
                                    if (b1) begin // 8'b1000_011x
                                        if (b0) byte <= 8'hea; // 8'b1000_0111
                                        else byte <= 8'hdc; // 8'b1000_0110
                                    end
                                    else begin // 8'b1000_010x
                                        if (b0) byte <= 8'h67; // 8'b1000_0101
                                        else byte <= 8'h4f; // 8'b1000_0100
                                    end
                                end
                                else begin // 8'b1000_00xx
                                    if (b1) begin // 8'b1000_001x
                                        if (b0) byte <= 8'h41; // 8'b1000_0011
                                        else byte <= 8'h11; // 8'b1000_0010
                                    end
                                    else begin // 8'b1000_000x
                                        if (b0) byte <= 8'h91; // 8'b1000_0001
                                        else byte <= 8'h3a; // 8'b1000_0000
                                    end
                                end
                            end
                        end
                    end
                end
            end
            else begin // 8'b0xxx_xxxx
                if (b6) begin // 8'b01xx_xxxx
                    if (b5) begin // 8'b011x_xxxx
                        if (b4) begin // 8'b0111_xxxx
                            if (b3) begin // 8'b0111_1xxx
                                if (b2) begin // 8'b0111_11xx
                                    if (b1) begin // 8'b0111_111x
                                        if (b0) byte <= 8'h6b; // 8'b0111_1111
                                        else byte <= 8'h8a; // 8'b0111_1110
                                    end
                                    else begin // 8'b0111_110x
                                        if (b0) byte <= 8'h13;  // 8'b0111_1101
                                        else byte <= 8'h01;  // 8'b0111_1100
                                    end
                                end
                                else begin // 8'b0111_10xx
                                    if (b1) begin // 8'b0111_101x
                                        if (b0) byte <= 8'h03; // 8'b0111_1011
                                        else byte <= 8'hbd; // 8'b0111_1010
                                    end
                                    else begin // 8'b0111_100x
                                        if (b0) byte <= 8'haf;  // 8'b0111_1001
                                        else byte <= 8'hc1; // 8'b0111_1000
                                    end
                                end
                            end
                            else begin // 8'b0111_0xxx
                                if (b2) begin // 8'b0111_01xx
                                    if (b1) begin // 8'b0111_011x
                                        if (b0) byte <= 8'h02; // 8'b0111_0111
                                        else byte <= 8'h0f; // 8'b0111_0110
                                    end
                                    else begin // 8'b0111_010x
                                        if (b0) byte <= 8'h3f; // 8'b0111_0101
                                        else byte <= 8'hca; // 8'b0111_0100
                                    end
                                end
                                else begin  // 8'b0111_00xx
                                    if (b1) begin // 8'b0111_001x
                                        if (b0) byte <= 8'h8f; // 8'b0111_0011
                                        else byte <= 8'h1e; // 8'b0111_0010
                                    end
                                    else begin // 8'b0111_000x
                                        if (b0) byte <= 8'h2c; // 8'b0111_0001
                                        else byte <= 8'hd0; // 8'b0111_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0110_xxxx 
                            if (b3) begin // 8'b0110_1xxx
                                if (b2) begin // 8'b0110_11xx 
                                    if (b1) begin // 8'b0110_111x
                                        if (b0) byte <= 8'h06; // 8'b0110_1111
                                        else byte <= 8'h45; // 8'b0110_1110
                                    end
                                    else begin // 8'b0110_110x
                                        if (b0) byte <= 8'hb3; // 8'b0110_1101
                                        else byte <= 8'hb8; // 8'b0110_1100
                                    end
                                end
                                else begin // 8'b0110_10xx 
                                    if (b1) begin // 8'b0110_101x 
                                        if (b0) byte <= 8'h05; // 8'b0110_1011 
                                        else byte <= 8'h58; // 8'b0110_1010
                                    end
                                    else begin // 8'b0110_10x 
                                        if (b0) byte <= 8'he4; // 8'b0110_1001
                                        else byte <= 8'hf7; // 8'b0110_1000
                                    end
                                end
                            end
                            else begin // 8'b0110_0xxx
                                if (b2) begin // 8'b0110_01xx
                                    if (b1) begin // 8'b0110_011x
                                        if (b0) byte <= 8'h0a; // 8'b0110_0111
                                        else byte <= 8'hd3; // 8'b0110_0110
                                    end
                                    else begin // 8'b0110_010x
                                        if (b0) byte <= 8'hbc; // 8'b0110_0101
                                        else byte <= 8'h8c; // 8'b0110_0100
                                    end
                                end
                                else begin // 8'b0110_00xx
                                    if (b1) begin // 8'b0110_001x
                                        if (b0) byte <= 8'h00; // 8'b0110_0011
                                        else byte <= 8'hab; // 8'b0110_0010
                                    end
                                    else begin // 8'b0110_000x
                                        if (b0) byte <= 8'hd8; // 8'b0110_0001
                                        else byte <= 8'h90; // 8'b0110_0000
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b010x_xxxx
                        if (b4) begin // 8'b0101_xxxx
                            if (b3) begin  // 8'b0101_1xxx
                                if (b2) begin  // 8'b0101_11xx
                                    if (b1) begin // 8'b0101_111x
                                        if (b0) byte <= 8'h84; // 8'b0101_1111 
                                        else byte <= 8'h9d; // 8'b0101_1110
                                    end
                                    else begin // 8'b0101_110x
                                        if (b0) byte <= 8'h8d; // 8'b0101_1101
                                        else byte <= 8'ha7; // 8'b0101_1100
                                    end
                                end
                                else begin // 8'b0101_10xx
                                    if (b1) begin  // 8'b0101_101x
                                        if (b0) byte <= 8'h57;  // 8'b0101_1011
                                        else byte <= 8'h46;  // 8'b0101_1010
                                    end
                                    else begin  // 8'b0101_100x
                                        if (b0) byte <= 8'h15;  // 8'b0101_1001
                                        else byte <= 8'h5e;  // 8'b0101_1000
                                    end
                                end
                            end
                            else begin // 8'b0101_0xxx
                                if (b2) begin // 8'b0101_01xx
                                    if (b1) begin // 8'b0101_011x
                                        if (b0) byte <= 8'hda; // 8'b0101_0111
                                        else byte <= 8'hb9; // 8'b0101_0110
                                    end
                                    else begin // 8'b0101_010x
                                        if (b0) byte <= 8'hed; // 8'b0101_0101
                                        else byte <= 8'hfd; // 8'b0101_0100
                                    end
                                end
                                else begin // 8'b0101_00xx
                                    if (b1) begin // 8'b0101_001x
                                        if (b0) byte <= 8'h50; // 8'b0101_0011
                                        else byte <= 8'h48; // 8'b0101_0010
                                    end
                                    else begin // 8'b0101_000x
                                        if (b0) byte <= 8'h70; // 8'b0101_0001
                                        else byte <= 8'h6c; // 8'b0101_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0100_xxxx
                            if (b3) begin // 8'b0100_1xxx
                                if (b2) begin // 8'b0100_11xx
                                    if (b1) begin  // 8'b0100_111x
                                        if (b0) byte <= 8'h92; // 8'b0100_1111
                                        else byte <= 8'hb6;  // 8'b0100_1110
                                    end
                                    else begin // 8'b0100_110x
                                        if (b0) byte <= 8'h65; // 8'b0100_1101
                                        else byte <= 8'h5d; // 8'b0100_1100
                                    end
                                end
                                else begin // 8'b0100_10xx
                                    if (b1) begin // 8'b0100_101x
                                        if (b0) byte <= 8'hcc; // 8'b0100_1011
                                        else byte <= 8'h5c; // 8'b0100_1010
                                    end
                                    else begin // 8'b0100_100x
                                        if (b0) byte <= 8'ha4; // 8'b0100_1001
                                        else byte <= 8'hd4; // 8'b0100_1000
                                    end
                                end
                            end
                            else begin // 8'b0100_0xxx
                                if (b2) begin // 8'b0100_01xx
                                    if (b1) begin // 8'b0100_011x
                                        if (b0) byte <= 8'h16; // 8'b0100_0111
                                        else byte <= 8'h98; // 8'b0100_0110
                                    end
                                    else begin // 8'b0100_010x
                                        if (b0) byte <= 8'h68; // 8'b0100_0101
                                        else byte <= 8'h86; // 8'b0100_0100
                                    end
                                end
                                else begin // 8'b0100_00xx
                                    if (b1) begin // 8'b0100_001x
                                        if (b0) byte <= 8'h64; // 8'b0100_0011
                                        else byte <= 8'hf6; // 8'b0100_0010
                                    end
                                    else begin // 8'b0100_000x
                                        if (b0) byte <= 8'hf8; // 8'b0100_0001
                                        else byte <= 8'h72; // 8'b0100_0000
                                    end
                                end
                            end
                        end
                    end
                end
                else begin // 8'b00xx_xxxx
                    if (b5) begin // 8'b001x_xxxx
                        if (b4) begin // 8'b0011_xxxx
                            if (b3) begin // 8'b0011_1xxx
                                if (b2) begin // 8'b0011_11xx
                                    if (b1) begin // 8'b0011_111x
                                        if (b0) byte <= 8'h25; // 8'b0011_1111 
                                        else byte <= 8'hd1; // 8'b0011_1110
                                    end
                                    else begin // 8'b0011_110x
                                        if (b0) byte <= 8'h8b; // 8'b0011_1101
                                        else byte <= 8'h6d; // 8'b0011_1100
                                    end
                                end
                                else begin // 8'b0011_10xx
                                    if (b1) begin // 8'b0011_101x
                                        if (b0) byte <= 8'h49; // 8'b0011_1001
                                        else byte <= 8'ha2; // 8'b0011_1000
                                    end
                                    else begin // 8'b0011_100x
                                        if (b0) byte <= 8'h5b; // 8'b0011_1001
                                        else byte <= 8'h76; // 8'b0011_1000
                                    end
                                end
                            end
                            else begin // 8'b0011_0xxx
                                if (b2) begin // 8'b0011_01xx
                                    if (b1) begin // 8'b0011_011x
                                        if (b0) byte <= 8'hb2; // 8'b0011_0111
                                        else byte <= 8'h24; // 8'b0011_0110
                                    end
                                    else begin // 8'b0011_010x
                                        if (b0) byte <= 8'hd9; // 8'b0011_0101
                                        else byte <= 8'h28; // 8'b0011_0100
                                    end
                                end
                                else begin // 8'b0011_00xx
                                    if (b1) begin // 8'b0011_001x
                                        if (b0) byte <= 8'h66; // 8'b0011_0011
                                        else byte <= 8'ha1; // 8'b0011_0010
                                    end
                                    else begin // 8'b0011_000x
                                        if (b0) byte <= 8'h2e; // 8'b0011_0001
                                        else byte <= 8'h08; // 8'b0011_0000
                                    end
                                end
                            end
                        end
                        else begin // 8'b0010_xxxx
                            if (b3) begin // 8'b0010_1xxx
                                if (b2) begin // 8'b0010_11xx
                                    if (b1) begin // 8'b0010_111x
                                        if (b0) byte <= 8'h4e; // 8'b0010_1111
                                        else byte <= 8'hc3; // 8'b0010_1110
                                    end
                                    else begin // 8'b0010_110x
                                        if (b0) byte <= 8'hfa; // 8'b0010_1101
                                        else byte <= 8'h42; // 8'b0010_1100
                                    end
                                end
                                else begin // 8'b0010_10xx
                                    if (b1) begin // 8'b0010_101x
                                        if (b0) byte <= 8'h0b; // 8'b0010_1011
                                        else byte <= 8'h95; // 8'b0010_1010
                                    end
                                    else begin // 8'b0010_100x
                                        if (b0) byte <= 8'h4c; // 8'b0010_1001
                                        else byte <= 8'hee; // 8'b0010_1000
                                    end
                                end
                            end
                            else begin // 8'b0010_0xxx
                                if (b2) begin // 8'b0010_01xx
                                    if (b1) begin // 8'b0010_011x
                                        if (b0) byte <= 8'h3d; // 8'b0010_0111
                                        else byte <= 8'h23; // 8'b0010_0110
                                    end
                                    else begin // 8'b0010_010x
                                        if (b0) byte <= 8'hc2; // 8'b0010_0101
                                        else byte <= 8'ha6; // 8'b0010_0100
                                    end
                                end
                                else begin // 8'b0010_00xx
                                    if (b1) begin // 8'b0010_001x
                                        if (b0) byte <= 8'h32; // 8'b0010_0011
                                        else byte <= 8'h94; // 8'b0010_0010
                                    end
                                    else begin // 8'b0010_000x
                                        if (b0) byte <= 8'h7b; // 8'h21
                                        else byte <= 8'h54; // 8'h20
                                    end
                                end
                            end
                        end
                    end
                    else begin // 8'b000x_xxxx
                        if (b4) begin // 8'b0001_xxxx
                            if (b3) begin // 8'b0001_1xxx
                                if (b2) begin // 8'b0001_11xx
                                    if (b1) begin // 8'b0001_111x
                                        if (b0) byte <= 8'hcb; // 8'h1f
                                        else byte <= 8'he9; // 8'h1e
                                    end
                                    else begin // 8'b0001_110x
                                        if (b0) byte <= 8'hde; // 8'h1d
                                        else byte <= 8'hc4; // 8'h1c
                                    end
                                end
                                else begin // 8'b0001_10xx
                                    if (b1) begin // 8'b0001_101x
                                        if (b0) byte <= 8'h44; // 8'h1b
                                        else byte <= 8'h43; // 8'h1a
                                    end
                                    else begin // 8'b0001_100x
                                        if (b0) byte <= 8'h8e; // 8'h19
                                        else byte <= 8'h34; // 8'h18
                                    end
                                end
                            end
                            else begin // 8'b0001_0xxx
                                if (b2) begin  // 8'b0001_01xx
                                    if (b1) begin  // 8'b0001_011x
                                        if (b0) byte <= 8'h87;  // 8'h17
                                        else byte <= 8'hff; // 8'h16
                                    end
                                    else begin // 8'b0001_010x
                                        if (b0) byte <= 8'h2f; // 8'h15
                                        else byte <= 8'h9b; // 8'h14
                                    end
                                end
                                else begin // 8'b0001_00xx
                                    if (b1) begin // 8'b0001_001x
                                        if (b0) byte <= 8'h82; // 8'h13
                                        else byte <= 8'h39; // 8'h12
                                    end
                                    else begin // 8'b0001_000x
                                        if (b0) byte <= 8'he3; // 8'h11
                                        else byte <= 8'h7c; // 8'h10
                                    end
                                end
                            end
                        end
                        else begin // 8'b0000_xxxx
                            if (b3) begin // 8'b0000_1xxx
                                if (b2) begin // 8'b0000_11xx
                                    if (b1) begin // 8'b0000_111x
                                        if (b0) byte <= 8'hfb; // 8'h0f
                                        else byte <= 8'hd7; // 8'h0e
                                    end
                                    else begin // 8'b0000_110x
                                        if (b0) byte <= 8'hf3; // 8'h0d
                                        else byte <= 8'h81; // 8'h0c
                                    end
                                end
                                else begin // 8'b0000_10xx
                                    if (b1) begin // 8'b0000_101x
                                        if (b0) byte <= 8'h9e; // 8'h0b
                                        else byte <= 8'ha3; // 8'h0a
                                    end
                                    else begin // 8'b0000_100x
                                        if (b0) byte <= 8'h40;  // 8'h09
                                        else byte <= 8'hbf;  // 8'h08
                                    end
                                end
                            end
                            else begin // 8'b0000_0xxx
                                if (b2) begin // 8'b0000_01XX
                                    if (b1) begin // 8'b0000_011X
                                        if (b0) byte <= 8'h38; // 8'h07
                                        else byte <= 8'ha5; // 8'h06
                                    end
                                    else begin // 8'b0000_010X
                                        if (b0) byte <= 8'h36; // 8'h05
                                        else byte <= 8'h30; // 8'h04
                                    end
                                end // 8'b0000_00XX
                                else begin
                                    if (b1) begin // 8'b0000_001X
                                        if (b0) byte <= 8'hd5; // 8'h03
                                        else byte <= 8'h6a; // 8'h02
                                    end
                                    else begin
                                        if (b0) byte <= 8'h09; // 8'h01
                                        else byte <= 8'h52; // 8'h00
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

endmodule // sbox_bdd
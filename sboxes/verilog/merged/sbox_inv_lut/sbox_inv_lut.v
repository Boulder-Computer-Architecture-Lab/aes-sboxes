//////////////////////////////////////////////////////////////////////////////////
//
// Author:
// 
// Create Date: 10/2022
// Module Name: sbox_inv_lut
// Project Name: aes_sboxes
// Description: Logic based-affine transform and ROM-basde inversion over GF(2^8)
//              AES S-box.
// 
// Dependencies: affine_transform, invaffine_transform
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module sbox_inv_lut (
        input   wire            encrypt,
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    wire [7:0] affine_in, invaffine_in, inverter_in;
    wire [7:0] affine_out, invaffine_out;
    reg [7:0] inverter_out;

    //----------------------------------------------------------------
    // Continuous assignments
    //----------------------------------------------------------------
    assign affine_in = encrypt? inverter_out : 8'h0;
    assign inverter_in = encrypt? byte_in : invaffine_out;
    assign invaffine_in = encrypt? 8'h0 : byte_in;

    assign byte_out = encrypt? affine_out : inverter_out;

    //----------------------------------------------------------------
    // Module instantiation
    //----------------------------------------------------------------
    // Affine transformation
    affine_transform affine_transform(
        .byte_in(affine_in),
        .encrypt(encrypt),
        .byte_out(affine_out)
    );

    // Inverse affine transformation
    invaffine_transform invaffine_transform(
        .byte_in(invaffine_in),
        .encrypt(encrypt),
        .byte_out(invaffine_out)
    );

    //----------------------------------------------------------------
    // Procedural assignments
    //----------------------------------------------------------------
    always @(inverter_in) begin
        case(inverter_in)
            8'h00 : inverter_out <=  8'h00;
            8'h01 : inverter_out <=  8'h01;
            8'h02 : inverter_out <=  8'h8D;
            8'h03 : inverter_out <=  8'hF6;
            8'h04 : inverter_out <=  8'hCB;
            8'h05 : inverter_out <=  8'h52;
            8'h06 : inverter_out <=  8'h7B;
            8'h07 : inverter_out <=  8'hD1;
            8'h08 : inverter_out <=  8'hE8;
            8'h09 : inverter_out <=  8'h4F;
            8'h0a : inverter_out <=  8'h29;
            8'h0b : inverter_out <=  8'hC0;
            8'h0c : inverter_out <=  8'hB0;
            8'h0d : inverter_out <=  8'hE1;
            8'h0e : inverter_out <=  8'hE5;
            8'h0f : inverter_out <=  8'hC7;
            8'h10 : inverter_out <=  8'h74;
            8'h11 : inverter_out <=  8'hB4;
            8'h12 : inverter_out <=  8'hAA;
            8'h13 : inverter_out <=  8'h4B;
            8'h14 : inverter_out <=  8'h99;
            8'h15 : inverter_out <=  8'h2B;
            8'h16 : inverter_out <=  8'h60;
            8'h17 : inverter_out <=  8'h5F;
            8'h18 : inverter_out <=  8'h58;
            8'h19 : inverter_out <=  8'h3F;
            8'h1a : inverter_out <=  8'hFD;
            8'h1b : inverter_out <=  8'hCC;
            8'h1c : inverter_out <=  8'hFF;
            8'h1d : inverter_out <=  8'h40;
            8'h1e : inverter_out <=  8'hEE;
            8'h1f : inverter_out <=  8'hB2;
            8'h20 : inverter_out <=  8'h3A;
            8'h21 : inverter_out <=  8'h6E;
            8'h22 : inverter_out <=  8'h5A;
            8'h23 : inverter_out <=  8'hF1;
            8'h24 : inverter_out <=  8'h55;
            8'h25 : inverter_out <=  8'h4D;
            8'h26 : inverter_out <=  8'hA8;
            8'h27 : inverter_out <=  8'hC9;
            8'h28 : inverter_out <=  8'hC1;
            8'h29 : inverter_out <=  8'h0A;
            8'h2a : inverter_out <=  8'h98;
            8'h2b : inverter_out <=  8'h15;
            8'h2c : inverter_out <=  8'h30;
            8'h2d : inverter_out <=  8'h44;
            8'h2e : inverter_out <=  8'hA2;
            8'h2f : inverter_out <=  8'hC2;
            8'h30 : inverter_out <=  8'h2C;
            8'h31 : inverter_out <=  8'h45;
            8'h32 : inverter_out <=  8'h92;
            8'h33 : inverter_out <=  8'h6C;
            8'h34 : inverter_out <=  8'hF3;
            8'h35 : inverter_out <=  8'h39;
            8'h36 : inverter_out <=  8'h66;
            8'h37 : inverter_out <=  8'h42;
            8'h38 : inverter_out <=  8'hF2;
            8'h39 : inverter_out <=  8'h35;
            8'h3a : inverter_out <=  8'h20;
            8'h3b : inverter_out <=  8'h6F;
            8'h3c : inverter_out <=  8'h77;
            8'h3d : inverter_out <=  8'hBB;
            8'h3e : inverter_out <=  8'h59;
            8'h3f : inverter_out <=  8'h19;
            8'h40 : inverter_out <=  8'h1D;
            8'h41 : inverter_out <=  8'hFE;
            8'h42 : inverter_out <=  8'h37;
            8'h43 : inverter_out <=  8'h67;
            8'h44 : inverter_out <=  8'h2D;
            8'h45 : inverter_out <=  8'h31;
            8'h46 : inverter_out <=  8'hF5;
            8'h47 : inverter_out <=  8'h69;
            8'h48 : inverter_out <=  8'hA7;
            8'h49 : inverter_out <=  8'h64;
            8'h4a : inverter_out <=  8'hAB;
            8'h4b : inverter_out <=  8'h13;
            8'h4c : inverter_out <=  8'h54;
            8'h4d : inverter_out <=  8'h25;
            8'h4e : inverter_out <=  8'hE9;
            8'h4f : inverter_out <=  8'h09;
            8'h50 : inverter_out <=  8'hED;
            8'h51 : inverter_out <=  8'h5C;
            8'h52 : inverter_out <=  8'h05;
            8'h53 : inverter_out <=  8'hCA;
            8'h54 : inverter_out <=  8'h4C;
            8'h55 : inverter_out <=  8'h24;
            8'h56 : inverter_out <=  8'h87;
            8'h57 : inverter_out <=  8'hBF;
            8'h58 : inverter_out <=  8'h18;
            8'h59 : inverter_out <=  8'h3E;
            8'h5a : inverter_out <=  8'h22;
            8'h5b : inverter_out <=  8'hF0;
            8'h5c : inverter_out <=  8'h51;
            8'h5d : inverter_out <=  8'hEC;
            8'h5e : inverter_out <=  8'h61;
            8'h5f : inverter_out <=  8'h17;
            8'h60 : inverter_out <=  8'h16;
            8'h61 : inverter_out <=  8'h5E;
            8'h62 : inverter_out <=  8'hAF;
            8'h63 : inverter_out <=  8'hD3;
            8'h64 : inverter_out <=  8'h49;
            8'h65 : inverter_out <=  8'hA6;
            8'h66 : inverter_out <=  8'h36;
            8'h67 : inverter_out <=  8'h43;
            8'h68 : inverter_out <=  8'hF4;
            8'h69 : inverter_out <=  8'h47;
            8'h6a : inverter_out <=  8'h91;
            8'h6b : inverter_out <=  8'hDF;
            8'h6c : inverter_out <=  8'h33;
            8'h6d : inverter_out <=  8'h93;
            8'h6e : inverter_out <=  8'h21;
            8'h6f : inverter_out <=  8'h3B;
            8'h70 : inverter_out <=  8'h79;
            8'h71 : inverter_out <=  8'hB7;
            8'h72 : inverter_out <=  8'h97;
            8'h73 : inverter_out <=  8'h85;
            8'h74 : inverter_out <=  8'h10;
            8'h75 : inverter_out <=  8'hB5;
            8'h76 : inverter_out <=  8'hBA;
            8'h77 : inverter_out <=  8'h3C;
            8'h78 : inverter_out <=  8'hB6;
            8'h79 : inverter_out <=  8'h70;
            8'h7a : inverter_out <=  8'hD0;
            8'h7b : inverter_out <=  8'h06;
            8'h7c : inverter_out <=  8'hA1;
            8'h7d : inverter_out <=  8'hFA;
            8'h7e : inverter_out <=  8'h81;
            8'h7f : inverter_out <=  8'h82;
            8'h80 : inverter_out <=  8'h83;
            8'h81 : inverter_out <=  8'h7E;
            8'h82 : inverter_out <=  8'h7F;
            8'h83 : inverter_out <=  8'h80;
            8'h84 : inverter_out <=  8'h96;
            8'h85 : inverter_out <=  8'h73;
            8'h86 : inverter_out <=  8'hBE;
            8'h87 : inverter_out <=  8'h56;
            8'h88 : inverter_out <=  8'h9B;
            8'h89 : inverter_out <=  8'h9E;
            8'h8a : inverter_out <=  8'h95;
            8'h8b : inverter_out <=  8'hD9;
            8'h8c : inverter_out <=  8'hF7;
            8'h8d : inverter_out <=  8'h02;
            8'h8e : inverter_out <=  8'hB9;
            8'h8f : inverter_out <=  8'hA4;
            8'h90 : inverter_out <=  8'hDE;
            8'h91 : inverter_out <=  8'h6A;
            8'h92 : inverter_out <=  8'h32;
            8'h93 : inverter_out <=  8'h6D;
            8'h94 : inverter_out <=  8'hD8;
            8'h95 : inverter_out <=  8'h8A;
            8'h96 : inverter_out <=  8'h84;
            8'h97 : inverter_out <=  8'h72;
            8'h98 : inverter_out <=  8'h2A;
            8'h99 : inverter_out <=  8'h14;
            8'h9a : inverter_out <=  8'h9F;
            8'h9b : inverter_out <=  8'h88;
            8'h9c : inverter_out <=  8'hF9;
            8'h9d : inverter_out <=  8'hDC;
            8'h9e : inverter_out <=  8'h89;
            8'h9f : inverter_out <=  8'h9A;
            8'ha0 : inverter_out <=  8'hFB;
            8'ha1 : inverter_out <=  8'h7C;
            8'ha2 : inverter_out <=  8'h2E;
            8'ha3 : inverter_out <=  8'hC3;
            8'ha4 : inverter_out <=  8'h8F;
            8'ha5 : inverter_out <=  8'hB8;
            8'ha6 : inverter_out <=  8'h65;
            8'ha7 : inverter_out <=  8'h48;
            8'ha8 : inverter_out <=  8'h26;
            8'ha9 : inverter_out <=  8'hC8;
            8'haa : inverter_out <=  8'h12;
            8'hab : inverter_out <=  8'h4A;
            8'hac : inverter_out <=  8'hCE;
            8'had : inverter_out <=  8'hE7;
            8'hae : inverter_out <=  8'hD2;
            8'haf : inverter_out <=  8'h62;
            8'hb0 : inverter_out <=  8'h0C;
            8'hb1 : inverter_out <=  8'hE0;
            8'hb2 : inverter_out <=  8'h1F;
            8'hb3 : inverter_out <=  8'hEF;
            8'hb4 : inverter_out <=  8'h11;
            8'hb5 : inverter_out <=  8'h75;
            8'hb6 : inverter_out <=  8'h78;
            8'hb7 : inverter_out <=  8'h71;
            8'hb8 : inverter_out <=  8'hA5;
            8'hb9 : inverter_out <=  8'h8E;
            8'hba : inverter_out <=  8'h76;
            8'hbb : inverter_out <=  8'h3D;
            8'hbc : inverter_out <=  8'hBD;
            8'hbd : inverter_out <=  8'hBC;
            8'hbe : inverter_out <=  8'h86;
            8'hbf : inverter_out <=  8'h57;
            8'hc0 : inverter_out <=  8'h0B;
            8'hc1 : inverter_out <=  8'h28;
            8'hc2 : inverter_out <=  8'h2F;
            8'hc3 : inverter_out <=  8'hA3;
            8'hc4 : inverter_out <=  8'hDA;
            8'hc5 : inverter_out <=  8'hD4;
            8'hc6 : inverter_out <=  8'hE4;
            8'hc7 : inverter_out <=  8'h0F;
            8'hc8 : inverter_out <=  8'hA9;
            8'hc9 : inverter_out <=  8'h27;
            8'hca : inverter_out <=  8'h53;
            8'hcb : inverter_out <=  8'h04;
            8'hcc : inverter_out <=  8'h1B;
            8'hcd : inverter_out <=  8'hFC;
            8'hce : inverter_out <=  8'hAC;
            8'hcf : inverter_out <=  8'hE6;
            8'hd0 : inverter_out <=  8'h7A;
            8'hd1 : inverter_out <=  8'h07;
            8'hd2 : inverter_out <=  8'hAE;
            8'hd3 : inverter_out <=  8'h63;
            8'hd4 : inverter_out <=  8'hC5;
            8'hd5 : inverter_out <=  8'hDB;
            8'hd6 : inverter_out <=  8'hE2;
            8'hd7 : inverter_out <=  8'hEA;
            8'hd8 : inverter_out <=  8'h94;
            8'hd9 : inverter_out <=  8'h8B;
            8'hda : inverter_out <=  8'hC4;
            8'hdb : inverter_out <=  8'hD5;
            8'hdc : inverter_out <=  8'h9D;
            8'hdd : inverter_out <=  8'hF8;
            8'hde : inverter_out <=  8'h90;
            8'hdf : inverter_out <=  8'h6B;
            8'he0 : inverter_out <=  8'hB1;
            8'he1 : inverter_out <=  8'h0D;
            8'he2 : inverter_out <=  8'hD6;
            8'he3 : inverter_out <=  8'hEB;
            8'he4 : inverter_out <=  8'hC6;
            8'he5 : inverter_out <=  8'h0E;
            8'he6 : inverter_out <=  8'hCF;
            8'he7 : inverter_out <=  8'hAD;
            8'he8 : inverter_out <=  8'h08;
            8'he9 : inverter_out <=  8'h4E;
            8'hea : inverter_out <=  8'hD7;
            8'heb : inverter_out <=  8'hE3;
            8'hec : inverter_out <=  8'h5D;
            8'hed : inverter_out <=  8'h50;
            8'hee : inverter_out <=  8'h1E;
            8'hef : inverter_out <=  8'hB3;
            8'hf0 : inverter_out <=  8'h5B;
            8'hf1 : inverter_out <=  8'h23;
            8'hf2 : inverter_out <=  8'h38;
            8'hf3 : inverter_out <=  8'h34;
            8'hf4 : inverter_out <=  8'h68;
            8'hf5 : inverter_out <=  8'h46;
            8'hf6 : inverter_out <=  8'h03;
            8'hf7 : inverter_out <=  8'h8C;
            8'hf8 : inverter_out <=  8'hDD;
            8'hf9 : inverter_out <=  8'h9C;
            8'hfa : inverter_out <=  8'h7D;
            8'hfb : inverter_out <=  8'hA0;
            8'hfc : inverter_out <=  8'hCD;
            8'hfd : inverter_out <=  8'h1A;
            8'hfe : inverter_out <=  8'h41;
            8'hff : inverter_out <=  8'h1C;
            default: inverter_out <=  0;
        endcase
    end


endmodule // sbox_inv_lut
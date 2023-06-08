//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: exp_inverter
// Project Name: aes-v
// Description: exp and Exp LUT inverter.
// 
// Dependencies: exp.mem, exp.mem.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

module log_inverter (
        input   wire    [7:0]   byte_in,
        output  wire    [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    reg [7:0] log, temp, exp;

    assign byte_out = exp;
    
    always @(byte_in) begin
        if (byte_in == 0) begin
        end 
        else begin
            case(byte_in)
                8'h00: log = 8'h00;
                8'h01: log = 8'h00;
                8'h02: log = 8'h19;
                8'h03: log = 8'h01;
                8'h04: log = 8'h32;
                8'h05: log = 8'h02;
                8'h06: log = 8'h1a;
                8'h07: log = 8'hc6;
                8'h08: log = 8'h4b;
                8'h09: log = 8'hc7;
                8'h0a: log = 8'h1b;
                8'h0b: log = 8'h68;
                8'h0c: log = 8'h33;
                8'h0d: log = 8'hee;
                8'h0e: log = 8'hdf;
                8'h0f: log = 8'h03;
                8'h10: log = 8'h64;
                8'h11: log = 8'h04;
                8'h12: log = 8'he0;
                8'h13: log = 8'h0e;
                8'h14: log = 8'h34;
                8'h15: log = 8'h8d;
                8'h16: log = 8'h81;
                8'h17: log = 8'hef;
                8'h18: log = 8'h4c;
                8'h19: log = 8'h71;
                8'h1a: log = 8'h08;
                8'h1b: log = 8'hc8;
                8'h1c: log = 8'hf8;
                8'h1d: log = 8'h69;
                8'h1e: log = 8'h1c;
                8'h1f: log = 8'hc1;
                8'h20: log = 8'h7d;
                8'h21: log = 8'hc2;
                8'h22: log = 8'h1d;
                8'h23: log = 8'hb5;
                8'h24: log = 8'hf9;
                8'h25: log = 8'hb9;
                8'h26: log = 8'h27;
                8'h27: log = 8'h6a;
                8'h28: log = 8'h4d;
                8'h29: log = 8'he4;
                8'h2a: log = 8'ha6;
                8'h2b: log = 8'h72;
                8'h2c: log = 8'h9a;
                8'h2d: log = 8'hc9;
                8'h2e: log = 8'h09;
                8'h2f: log = 8'h78;
                8'h30: log = 8'h65;
                8'h31: log = 8'h2f;
                8'h32: log = 8'h8a;
                8'h33: log = 8'h05;
                8'h34: log = 8'h21;
                8'h35: log = 8'h0f;
                8'h36: log = 8'he1;
                8'h37: log = 8'h24;
                8'h38: log = 8'h12;
                8'h39: log = 8'hf0;
                8'h3a: log = 8'h82;
                8'h3b: log = 8'h45;
                8'h3c: log = 8'h35;
                8'h3d: log = 8'h93;
                8'h3e: log = 8'hda;
                8'h3f: log = 8'h8e;
                8'h40: log = 8'h96;
                8'h41: log = 8'h8f;
                8'h42: log = 8'hdb;
                8'h43: log = 8'hbd;
                8'h44: log = 8'h36;
                8'h45: log = 8'hd0;
                8'h46: log = 8'hce;
                8'h47: log = 8'h94;
                8'h48: log = 8'h13;
                8'h49: log = 8'h5c;
                8'h4a: log = 8'hd2;
                8'h4b: log = 8'hf1;
                8'h4c: log = 8'h40;
                8'h4d: log = 8'h46;
                8'h4e: log = 8'h83;
                8'h4f: log = 8'h38;
                8'h50: log = 8'h66;
                8'h51: log = 8'hdd;
                8'h52: log = 8'hfd;
                8'h53: log = 8'h30;
                8'h54: log = 8'hbf;
                8'h55: log = 8'h06;
                8'h56: log = 8'h8b;
                8'h57: log = 8'h62;
                8'h58: log = 8'hb3;
                8'h59: log = 8'h25;
                8'h5a: log = 8'he2;
                8'h5b: log = 8'h98;
                8'h5c: log = 8'h22;
                8'h5d: log = 8'h88;
                8'h5e: log = 8'h91;
                8'h5f: log = 8'h10;
                8'h60: log = 8'h7e;
                8'h61: log = 8'h6e;
                8'h62: log = 8'h48;
                8'h63: log = 8'hc3;
                8'h64: log = 8'ha3;
                8'h65: log = 8'hb6;
                8'h66: log = 8'h1e;
                8'h67: log = 8'h42;
                8'h68: log = 8'h3a;
                8'h69: log = 8'h6b;
                8'h6a: log = 8'h28;
                8'h6b: log = 8'h54;
                8'h6c: log = 8'hfa;
                8'h6d: log = 8'h85;
                8'h6e: log = 8'h3d;
                8'h6f: log = 8'hba;
                8'h70: log = 8'h2b;
                8'h71: log = 8'h79;
                8'h72: log = 8'h0a;
                8'h73: log = 8'h15;
                8'h74: log = 8'h9b;
                8'h75: log = 8'h9f;
                8'h76: log = 8'h5e;
                8'h77: log = 8'hca;
                8'h78: log = 8'h4e;
                8'h79: log = 8'hd4;
                8'h7a: log = 8'hac;
                8'h7b: log = 8'he5;
                8'h7c: log = 8'hf3;
                8'h7d: log = 8'h73;
                8'h7e: log = 8'ha7;
                8'h7f: log = 8'h57;
                8'h80: log = 8'haf;
                8'h81: log = 8'h58;
                8'h82: log = 8'ha8;
                8'h83: log = 8'h50;
                8'h84: log = 8'hf4;
                8'h85: log = 8'hea;
                8'h86: log = 8'hd6;
                8'h87: log = 8'h74;
                8'h88: log = 8'h4f;
                8'h89: log = 8'hae;
                8'h8a: log = 8'he9;
                8'h8b: log = 8'hd5;
                8'h8c: log = 8'he7;
                8'h8d: log = 8'he6;
                8'h8e: log = 8'had;
                8'h8f: log = 8'he8;
                8'h90: log = 8'h2c;
                8'h91: log = 8'hd7;
                8'h92: log = 8'h75;
                8'h93: log = 8'h7a;
                8'h94: log = 8'heb;
                8'h95: log = 8'h16;
                8'h96: log = 8'h0b;
                8'h97: log = 8'hf5;
                8'h98: log = 8'h59;
                8'h99: log = 8'hcb;
                8'h9a: log = 8'h5f;
                8'h9b: log = 8'hb0;
                8'h9c: log = 8'h9c;
                8'h9d: log = 8'ha9;
                8'h9e: log = 8'h51;
                8'h9f: log = 8'ha0;
                8'ha0: log = 8'h7f;
                8'ha1: log = 8'h0c;
                8'ha2: log = 8'hf6;
                8'ha3: log = 8'h6f;
                8'ha4: log = 8'h17;
                8'ha5: log = 8'hc4;
                8'ha6: log = 8'h49;
                8'ha7: log = 8'hec;
                8'ha8: log = 8'hd8;
                8'ha9: log = 8'h43;
                8'haa: log = 8'h1f;
                8'hab: log = 8'h2d;
                8'hac: log = 8'ha4;
                8'had: log = 8'h76;
                8'hae: log = 8'h7b;
                8'haf: log = 8'hb7;
                8'hb0: log = 8'hcc;
                8'hb1: log = 8'hbb;
                8'hb2: log = 8'h3e;
                8'hb3: log = 8'h5a;
                8'hb4: log = 8'hfb;
                8'hb5: log = 8'h60;
                8'hb6: log = 8'hb1;
                8'hb7: log = 8'h86;
                8'hb8: log = 8'h3b;
                8'hb9: log = 8'h52;
                8'hba: log = 8'ha1;
                8'hbb: log = 8'h6c;
                8'hbc: log = 8'haa;
                8'hbd: log = 8'h55;
                8'hbe: log = 8'h29;
                8'hbf: log = 8'h9d;
                8'hc0: log = 8'h97;
                8'hc1: log = 8'hb2;
                8'hc2: log = 8'h87;
                8'hc3: log = 8'h90;
                8'hc4: log = 8'h61;
                8'hc5: log = 8'hbe;
                8'hc6: log = 8'hdc;
                8'hc7: log = 8'hfc;
                8'hc8: log = 8'hbc;
                8'hc9: log = 8'h95;
                8'hca: log = 8'hcf;
                8'hcb: log = 8'hcd;
                8'hcc: log = 8'h37;
                8'hcd: log = 8'h3f;
                8'hce: log = 8'h5b;
                8'hcf: log = 8'hd1;
                8'hd0: log = 8'h53;
                8'hd1: log = 8'h39;
                8'hd2: log = 8'h84;
                8'hd3: log = 8'h3c;
                8'hd4: log = 8'h41;
                8'hd5: log = 8'ha2;
                8'hd6: log = 8'h6d;
                8'hd7: log = 8'h47;
                8'hd8: log = 8'h14;
                8'hd9: log = 8'h2a;
                8'hda: log = 8'h9e;
                8'hdb: log = 8'h5d;
                8'hdc: log = 8'h56;
                8'hdd: log = 8'hf2;
                8'hde: log = 8'hd3;
                8'hdf: log = 8'hab;
                8'he0: log = 8'h44;
                8'he1: log = 8'h11;
                8'he2: log = 8'h92;
                8'he3: log = 8'hd9;
                8'he4: log = 8'h23;
                8'he5: log = 8'h20;
                8'he6: log = 8'h2e;
                8'he7: log = 8'h89;
                8'he8: log = 8'hb4;
                8'he9: log = 8'h7c;
                8'hea: log = 8'hb8;
                8'heb: log = 8'h26;
                8'hec: log = 8'h77;
                8'hed: log = 8'h99;
                8'hee: log = 8'he3;
                8'hef: log = 8'ha5;
                8'hf0: log = 8'h67;
                8'hf1: log = 8'h4a;
                8'hf2: log = 8'hed;
                8'hf3: log = 8'hde;
                8'hf4: log = 8'hc5;
                8'hf5: log = 8'h31;
                8'hf6: log = 8'hfe;
                8'hf7: log = 8'h18;
                8'hf8: log = 8'h0d;
                8'hf9: log = 8'h63;
                8'hfa: log = 8'h8c;
                8'hfb: log = 8'h80;
                8'hfc: log = 8'hc0;
                8'hfd: log = 8'hf7;
                8'hfe: log = 8'h70;
                8'hff: log = 8'h07;
                    default: log =  0;
            endcase
            temp = 255-log;
            case (temp)
                8'h00: exp = 8'h01;
                8'h01: exp = 8'h03;
                8'h02: exp = 8'h05;
                8'h03: exp = 8'h0f;
                8'h04: exp = 8'h11;
                8'h05: exp = 8'h33;
                8'h06: exp = 8'h55;
                8'h07: exp = 8'hff;
                8'h08: exp = 8'h1a;
                8'h09: exp = 8'h2e;
                8'h0a: exp = 8'h72;
                8'h0b: exp = 8'h96;
                8'h0c: exp = 8'ha1;
                8'h0d: exp = 8'hf8;
                8'h0e: exp = 8'h13;
                8'h0f: exp = 8'h35;
                8'h10: exp = 8'h5f;
                8'h11: exp = 8'he1;
                8'h12: exp = 8'h38;
                8'h13: exp = 8'h48;
                8'h14: exp = 8'hd8;
                8'h15: exp = 8'h73;
                8'h16: exp = 8'h95;
                8'h17: exp = 8'ha4;
                8'h18: exp = 8'hf7;
                8'h19: exp = 8'h02;
                8'h1a: exp = 8'h06;
                8'h1b: exp = 8'h0a;
                8'h1c: exp = 8'h1e;
                8'h1d: exp = 8'h22;
                8'h1e: exp = 8'h66;
                8'h1f: exp = 8'haa;
                8'h20: exp = 8'he5;
                8'h21: exp = 8'h34;
                8'h22: exp = 8'h5c;
                8'h23: exp = 8'he4;
                8'h24: exp = 8'h37;
                8'h25: exp = 8'h59;
                8'h26: exp = 8'heb;
                8'h27: exp = 8'h26;
                8'h28: exp = 8'h6a;
                8'h29: exp = 8'hbe;
                8'h2a: exp = 8'hd9;
                8'h2b: exp = 8'h70;
                8'h2c: exp = 8'h90;
                8'h2d: exp = 8'hab;
                8'h2e: exp = 8'he6;
                8'h2f: exp = 8'h31;
                8'h30: exp = 8'h53;
                8'h31: exp = 8'hf5;
                8'h32: exp = 8'h04;
                8'h33: exp = 8'h0c;
                8'h34: exp = 8'h14;
                8'h35: exp = 8'h3c;
                8'h36: exp = 8'h44;
                8'h37: exp = 8'hcc;
                8'h38: exp = 8'h4f;
                8'h39: exp = 8'hd1;
                8'h3a: exp = 8'h68;
                8'h3b: exp = 8'hb8;
                8'h3c: exp = 8'hd3;
                8'h3d: exp = 8'h6e;
                8'h3e: exp = 8'hb2;
                8'h3f: exp = 8'hcd;
                8'h40: exp = 8'h4c;
                8'h41: exp = 8'hd4;
                8'h42: exp = 8'h67;
                8'h43: exp = 8'ha9;
                8'h44: exp = 8'he0;
                8'h45: exp = 8'h3b;
                8'h46: exp = 8'h4d;
                8'h47: exp = 8'hd7;
                8'h48: exp = 8'h62;
                8'h49: exp = 8'ha6;
                8'h4a: exp = 8'hf1;
                8'h4b: exp = 8'h08;
                8'h4c: exp = 8'h18;
                8'h4d: exp = 8'h28;
                8'h4e: exp = 8'h78;
                8'h4f: exp = 8'h88;
                8'h50: exp = 8'h83;
                8'h51: exp = 8'h9e;
                8'h52: exp = 8'hb9;
                8'h53: exp = 8'hd0;
                8'h54: exp = 8'h6b;
                8'h55: exp = 8'hbd;
                8'h56: exp = 8'hdc;
                8'h57: exp = 8'h7f;
                8'h58: exp = 8'h81;
                8'h59: exp = 8'h98;
                8'h5a: exp = 8'hb3;
                8'h5b: exp = 8'hce;
                8'h5c: exp = 8'h49;
                8'h5d: exp = 8'hdb;
                8'h5e: exp = 8'h76;
                8'h5f: exp = 8'h9a;
                8'h60: exp = 8'hb5;
                8'h61: exp = 8'hc4;
                8'h62: exp = 8'h57;
                8'h63: exp = 8'hf9;
                8'h64: exp = 8'h10;
                8'h65: exp = 8'h30;
                8'h66: exp = 8'h50;
                8'h67: exp = 8'hf0;
                8'h68: exp = 8'h0b;
                8'h69: exp = 8'h1d;
                8'h6a: exp = 8'h27;
                8'h6b: exp = 8'h69;
                8'h6c: exp = 8'hbb;
                8'h6d: exp = 8'hd6;
                8'h6e: exp = 8'h61;
                8'h6f: exp = 8'ha3;
                8'h70: exp = 8'hfe;
                8'h71: exp = 8'h19;
                8'h72: exp = 8'h2b;
                8'h73: exp = 8'h7d;
                8'h74: exp = 8'h87;
                8'h75: exp = 8'h92;
                8'h76: exp = 8'had;
                8'h77: exp = 8'hec;
                8'h78: exp = 8'h2f;
                8'h79: exp = 8'h71;
                8'h7a: exp = 8'h93;
                8'h7b: exp = 8'hae;
                8'h7c: exp = 8'he9;
                8'h7d: exp = 8'h20;
                8'h7e: exp = 8'h60;
                8'h7f: exp = 8'ha0;
                8'h80: exp = 8'hfb;
                8'h81: exp = 8'h16;
                8'h82: exp = 8'h3a;
                8'h83: exp = 8'h4e;
                8'h84: exp = 8'hd2;
                8'h85: exp = 8'h6d;
                8'h86: exp = 8'hb7;
                8'h87: exp = 8'hc2;
                8'h88: exp = 8'h5d;
                8'h89: exp = 8'he7;
                8'h8a: exp = 8'h32;
                8'h8b: exp = 8'h56;
                8'h8c: exp = 8'hfa;
                8'h8d: exp = 8'h15;
                8'h8e: exp = 8'h3f;
                8'h8f: exp = 8'h41;
                8'h90: exp = 8'hc3;
                8'h91: exp = 8'h5e;
                8'h92: exp = 8'he2;
                8'h93: exp = 8'h3d;
                8'h94: exp = 8'h47;
                8'h95: exp = 8'hc9;
                8'h96: exp = 8'h40;
                8'h97: exp = 8'hc0;
                8'h98: exp = 8'h5b;
                8'h99: exp = 8'hed;
                8'h9a: exp = 8'h2c;
                8'h9b: exp = 8'h74;
                8'h9c: exp = 8'h9c;
                8'h9d: exp = 8'hbf;
                8'h9e: exp = 8'hda;
                8'h9f: exp = 8'h75;
                8'ha0: exp = 8'h9f;
                8'ha1: exp = 8'hba;
                8'ha2: exp = 8'hd5;
                8'ha3: exp = 8'h64;
                8'ha4: exp = 8'hac;
                8'ha5: exp = 8'hef;
                8'ha6: exp = 8'h2a;
                8'ha7: exp = 8'h7e;
                8'ha8: exp = 8'h82;
                8'ha9: exp = 8'h9d;
                8'haa: exp = 8'hbc;
                8'hab: exp = 8'hdf;
                8'hac: exp = 8'h7a;
                8'had: exp = 8'h8e;
                8'hae: exp = 8'h89;
                8'haf: exp = 8'h80;
                8'hb0: exp = 8'h9b;
                8'hb1: exp = 8'hb6;
                8'hb2: exp = 8'hc1;
                8'hb3: exp = 8'h58;
                8'hb4: exp = 8'he8;
                8'hb5: exp = 8'h23;
                8'hb6: exp = 8'h65;
                8'hb7: exp = 8'haf;
                8'hb8: exp = 8'hea;
                8'hb9: exp = 8'h25;
                8'hba: exp = 8'h6f;
                8'hbb: exp = 8'hb1;
                8'hbc: exp = 8'hc8;
                8'hbd: exp = 8'h43;
                8'hbe: exp = 8'hc5;
                8'hbf: exp = 8'h54;
                8'hc0: exp = 8'hfc;
                8'hc1: exp = 8'h1f;
                8'hc2: exp = 8'h21;
                8'hc3: exp = 8'h63;
                8'hc4: exp = 8'ha5;
                8'hc5: exp = 8'hf4;
                8'hc6: exp = 8'h07;
                8'hc7: exp = 8'h09;
                8'hc8: exp = 8'h1b;
                8'hc9: exp = 8'h2d;
                8'hca: exp = 8'h77;
                8'hcb: exp = 8'h99;
                8'hcc: exp = 8'hb0;
                8'hcd: exp = 8'hcb;
                8'hce: exp = 8'h46;
                8'hcf: exp = 8'hca;
                8'hd0: exp = 8'h45;
                8'hd1: exp = 8'hcf;
                8'hd2: exp = 8'h4a;
                8'hd3: exp = 8'hde;
                8'hd4: exp = 8'h79;
                8'hd5: exp = 8'h8b;
                8'hd6: exp = 8'h86;
                8'hd7: exp = 8'h91;
                8'hd8: exp = 8'ha8;
                8'hd9: exp = 8'he3;
                8'hda: exp = 8'h3e;
                8'hdb: exp = 8'h42;
                8'hdc: exp = 8'hc6;
                8'hdd: exp = 8'h51;
                8'hde: exp = 8'hf3;
                8'hdf: exp = 8'h0e;
                8'he0: exp = 8'h12;
                8'he1: exp = 8'h36;
                8'he2: exp = 8'h5a;
                8'he3: exp = 8'hee;
                8'he4: exp = 8'h29;
                8'he5: exp = 8'h7b;
                8'he6: exp = 8'h8d;
                8'he7: exp = 8'h8c;
                8'he8: exp = 8'h8f;
                8'he9: exp = 8'h8a;
                8'hea: exp = 8'h85;
                8'heb: exp = 8'h94;
                8'hec: exp = 8'ha7;
                8'hed: exp = 8'hf2;
                8'hee: exp = 8'h0d;
                8'hef: exp = 8'h17;
                8'hf0: exp = 8'h39;
                8'hf1: exp = 8'h4b;
                8'hf2: exp = 8'hdd;
                8'hf3: exp = 8'h7c;
                8'hf4: exp = 8'h84;
                8'hf5: exp = 8'h97;
                8'hf6: exp = 8'ha2;
                8'hf7: exp = 8'hfd;
                8'hf8: exp = 8'h1c;
                8'hf9: exp = 8'h24;
                8'hfa: exp = 8'h6c;
                8'hfb: exp = 8'hb4;
                8'hfc: exp = 8'hc7;
                8'hfd: exp = 8'h52;
                8'hfe: exp = 8'hf6;
                8'hff: exp = 8'h01;
                default: exp =  0;
            endcase
        end
    end

    // assign byte_out = (byte_in == 0) ? 0 : exp_rom[255 - log_rom[byte_in]];

endmodule // exp_inverter
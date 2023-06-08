//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: sbox_tb
// Project Name: aes-v
// Description: Testbench for evaluating S-boxes bytes.
//              Verifies all S-box and InvSbox values output by the module.
// 
// Dependencies: sbox_mux, sbox_full_lut, sbox_inv_lut, sbox_canright, 
//               sbox_pprm, sbox_depth16, sbox_new_area.
// 
// Revision: 
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

`default_nettype none

// Select one and comment out undesired S-boxes
// `define SBOX_CANRIGHT
// `define SBOX_CANRIGHT_MASKED
`define SBOX_FULL_ROM
// `define SBOX_FULL_LUT
// `define SBOX_INV_LUT
// `define SBOX_LOG_LUT
// `define SBOX_PPRM
// `define SBOX_DEPTH16
// `define SBOX_NEW_AREA

module sbox_tb();
    //----------------------------------------------------------------
    // Integers
    //----------------------------------------------------------------
    integer i;

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    reg clk; // Clock

    // UUT
    reg [7:0] byte_in;    
    reg encrypt;
    wire [7:0] byte_out; // Computed value

    // Verification
    reg [7:0] expected_sbox [0:255]; // Pre-computed values
    reg [7:0] expected_inv_sbox [0:255]; // Pre-computed values

    // Masks
    reg [7:0] M, N;

    //----------------------------------------------------------------
    // Initialization
    //----------------------------------------------------------------
    initial begin
        clk = 1; // Initialize clock to 1
        byte_in = 0; // Initialize input byte to 0
        encrypt = 1;
        $readmemh("tb/mem/sbox/sbox.mem", expected_sbox); // Load values from memory
        $readmemh("tb/mem/sbox/inv_sbox.mem", expected_inv_sbox); // Load from memory
    end

    //----------------------------------------------------------------
    // Clock generation
    //----------------------------------------------------------------
    always #1 clk = ~clk;

    //----------------------------------------------------------------
    // Unit Under Test
    //----------------------------------------------------------------

    `ifdef SBOX_FULL_ROM
        sbox_full_rom uut(
            .encrypt(encrypt),
            .byte_in(byte_in),
            .byte_out(byte_out)
        );
    `endif 

    // Full LUT S-box
    `ifdef SBOX_FULL_LUT
        sbox_full_lut uut(
            .encrypt(encrypt),
            .byte_in(byte_in),
            .byte_out(byte_out)
        );
    `endif 

    // Inversion LUT S-box
    `ifdef SBOX_INV_LUT
        sbox_inv_lut uut(
            .encrypt(encrypt),
            .byte_in(byte_in),
            .byte_out(byte_out)
        );
    `endif 

    // Log LUT S-box
    `ifdef SBOX_LOG_LUT
        sbox_inv_lut uut(
            .encrypt(encrypt),
            .byte_in(byte_in),
            .byte_out(byte_out)
        );
    `endif 

    // Canright S-Box
    `ifdef SBOX_CANRIGHT
        sbox_canright UUT(
            .A(byte_in),
            .encrypt(encrypt),
            .Q(byte_out)
        );
    `endif

    // Canright Masked S-Box
    `ifdef SBOX_CANRIGHT_MASKED
        sbox_masked_canright UUT(
            .A(byte_in^M),
            .M(M),
            .N(8'h0),
            .encrypt(encrypt),
            .Q(byte_out)
        );
    `endif

    // PPRM S-Box
    `ifdef SBOX_PPRM
        sbox_pprm UUT(
            .byte_in(byte_in),
            .encrypt(encrypt),
            .byte_out(byte_out)
        );
    `endif

    // Depth 16 S-Box
    `ifdef SBOX_DEPTH16
        sbox_depth16 UUT(
            .byte_in(byte_in),
            .encrypt(encrypt),
            .byte_out(byte_out)
        );
    `endif

    // New Area Recprd S-box
    `ifdef SBOX_NEW_AREA
        sbox_new_area UUT(
            .byte_in(byte_in),
            .encrypt(encrypt),
            .byte_out(byte_out)
        );
    `endif 

    //----------------------------------------------------------------
    // Testbench
    //----------------------------------------------------------------
    initial begin
        $display("\nSystem reset.");
        $display("\nInitiating test for: %m.");
        // Encryption - S-Box
        for (i = 0; i < 256; i = i+1) begin
            byte_in = i;
            M = $random%256; // mask
            #1;
            $display("TEST #%0d --- S-Box: Encrypt? %d, Evaluating: 0x%h, Expected: 0x%h, Obtained: 0x%h", i, encrypt, byte_in, expected_sbox[i], byte_out);      
            if (~(byte_out === expected_sbox[i])) begin
                $display("  Unexpected output in %m: got 0x%h but expected 0x%h\n", byte_out, expected_sbox[i]); 
                $display("  Stopping test...\n");
                $finish;
            end
        end
        // Decryption - S-Box
        encrypt = 0;
        for (i = 0; i < 256; i = i+1) begin
            byte_in = i;
            M = $random%256; // mask
            #1;
            $display("TEST #%0d --- S-Box: Encrypt? %d, Evaluating: 0x%h, Expected: 0x%h, Obtained: 0x%h", i+256, encrypt, byte_in, expected_inv_sbox[i], byte_out);      
            if (~(byte_out === expected_inv_sbox[i])) begin
                $display("  Unexpected output in %m: got 0x%h but expected 0x%h\n", byte_out, expected_inv_sbox[i]); 
                $display("  Stopping test...\n");
                $finish;
            end
        end
        $display("\nSuccessfully completed test: %m!\n");
        $finish;
    end

endmodule // sbox_tb
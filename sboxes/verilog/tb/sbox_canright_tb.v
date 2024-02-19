//////////////////////////////////////////////////////////////////////////////////
//
// Author:
// 
// Create Date: 08/2023
// Module Name: sbox_canright_tb
// Project Name: aes_sboxes
// Description: Testbench for evaluating S-boxes bytes.
//              Verifies all S-box and InvSbox values output by the module.
// 
// Dependencies: sbox_canright
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`include "../merged/canright/gf_inv_4.v"
`include "../merged/canright/gf_inv_8.v"
`include "../merged/canright/gf_muls_2.v"
`include "../merged/canright/gf_muls_4.v"
`include "../merged/canright/gf_muls_scl_2.v"
`include "../merged/canright/gf_sq_2.v"
`include "../merged/canright/sbox_canright.v"


`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module sbox_canright_tb ();
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

    //----------------------------------------------------------------
    // Initialization
    //----------------------------------------------------------------
    initial begin
        clk = 1; // Initialize clock to 1
        byte_in = 0; // Initialize input byte to 0
        encrypt = 1;
        $readmemh("mem/sbox.mem", expected_sbox); // Load values from memory
        $readmemh("mem/inv_sbox.mem", expected_inv_sbox); // Load from memory
    end

    //----------------------------------------------------------------
    // Clock generation
    //----------------------------------------------------------------
    always #1 clk = ~clk;

    //----------------------------------------------------------------
    // Unit Under Test
    //----------------------------------------------------------------
    sbox_canright UUT(
        .byte_in(byte_in),
        .encrypt(encrypt),
        .byte_out(byte_out)
    );

    //----------------------------------------------------------------
    // Testbench
    //----------------------------------------------------------------
    initial begin
        $display("\nSystem reset.");
        $display("\nInitiating test for: %m.");
        // Encryption - S-Box
        for (i = 0; i < 256; i = i+1) begin
            byte_in = i;
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

endmodule // sbox_canright_tb
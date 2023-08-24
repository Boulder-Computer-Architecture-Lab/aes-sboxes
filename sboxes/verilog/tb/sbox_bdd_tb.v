//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: sbox_tb
// Project Name: aes-sboxes
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
`include "../merged/sbox_bdd/sbox_bdd.v"

`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module sbox_tb ();
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

    sbox_bdd uut(
        .encrypt(encrypt),
        .byte_in(byte_in),
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

endmodule // sbox_tb
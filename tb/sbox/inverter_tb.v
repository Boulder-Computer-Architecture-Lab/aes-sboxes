//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 10/2022
// Module Name: inverter_tb
// Project Name: aes-v
// Description: Testbench for evaluating sbox's inverter bytes.
// 
// Dependencies: pprm_inverter, log_inverter.
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
// `define INVERTER_PPRM
// `define INVERTER_LOG

module inverter_tb();
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
    wire [7:0] byte_out; // Computed value

    // Verification
    reg [7:0] expected_inversion [0:255]; // Pre-computed values

    //----------------------------------------------------------------
    // Initialization
    //----------------------------------------------------------------
    initial begin
        clk = 1; // Initialize clock to 1
        byte_in = 0; // Initialize input byte to 0
        $readmemh("tb/mem/sbox/inverter.mem", expected_inversion); // Load values from memory
    end

    //----------------------------------------------------------------
    // Clock generation
    //----------------------------------------------------------------
    always #1 clk = ~clk;

    //----------------------------------------------------------------
    // Unit Under Test
    //----------------------------------------------------------------
    // PPRM Inverter
    `ifdef INVERTER_PRRM
        pprm_inverter UUT(
            .X(byte_in),
            .Y(byte_out)
        );
    `endif

    // Log Inverter
    `ifdef INVERTER_LOG
        log_inverter UUT(
            .byte_in(byte_in),
            .byte_out(byte_out)
        );
    `endif

    // Akkar
    `ifdef INVERTER_AKKAR
        inverter_akkar UUT(
            .A(byte_in),
            .Z(byte_out)
        );
    `endif
    //----------------------------------------------------------------
    // Testbench
    //----------------------------------------------------------------
    initial begin
        $display("\nSystem reset.");
        $display("\nInitiating test for: %m.");
        // Inversion over GF(2^8)
        for (i = 0; i < 256; i = i+1) begin
            byte_in = i;
            #1;
            $display("TEST #%0d --- S-Box Inverter: Evaluating: 0x%h, Expected: 0x%h, Obtained: 0x%h", i, byte_in, expected_inversion[i], byte_out);      
            if (~(byte_out === expected_inversion[i])) begin
                $display("  Unexpected output in %m: got 0x%h but expected 0x%h\n", byte_out, expected_inversion[i]); 
                $display("  Stopping test...\n");
                $finish;
            end
        end
        $display("Successfully completed: %m!\n");
        $finish;
    end

endmodule // inverter_tb

`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Phaedra Curlin
// 
// Create Date: 08/2022
// Module Name: sbox_full_rom
// Project Name: aes-sboxes
// Description: ROM implementation of the AES S-box.
// 
// Dependencies: invsbox.mem, sbox.mem.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module sbox_full_rom (
        input   wire            encrypt,
        input   wire    [7:0]   byte_in,
        output  reg     [7:0]   byte_out
    );

    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    reg [7:0] sbox_rom [255:0];
    reg [7:0] invsbox_rom [255:0];

    //----------------------------------------------------------------
    // Initialization
    //----------------------------------------------------------------
    initial begin
        $readmemh("v/sbox_full_rom/mem/sbox.mem", sbox_rom);
        $readmemh("v/sbox_full_rom/mem/inv_sbox.mem", invsbox_rom);
    end

    //----------------------------------------------------------------
    // Procedural assignments
    //----------------------------------------------------------------
    always @(byte_in) begin
        if (encrypt) begin
            byte_out <= sbox_rom[byte_in];
        end
        else begin
            byte_out <= invsbox_rom[byte_in];
        end
    end

endmodule // sbox_full_rom
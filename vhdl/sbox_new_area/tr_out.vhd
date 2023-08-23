----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: tr_out
-- Project Name: aes-sboxes
-- Description: Transform out.
-- 
-- Dependencies: None.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- 
-- Additional Comments: Based on design from "New Area Record for the AES.
--                      Combined S-Box/Inverse S-Box"
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity
entity tr_out is port (
    encrypt: in std_logic;
    W: in std_logic_vector(3 downto 0);
    Z: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(7 downto 0)
);
end tr_out;

-- architecture
architecture arch_tr_out of tr_out is
    signal J: std_logic_vector(7 downto 0);
    signal L: std_logic_vector(7 downto 0);
    signal TT0: std_logic;
    signal TT1: std_logic;
begin

    TT0 <= not (J(7) xor Z(0));
    TT1 <= not (J(4) xor Z(3));

    -- S-box
    J(7) <= not (W(3) xor Z(1));
    J(6) <= W(1) xor Z(1);
    J(5) <= W(0) xor Z(2);
    J(4) <= J(7) xor W(1);
    J(3) <= not (J(0) xor TT1);
    J(2) <= not (J(5) xor TT0);
    J(1) <= not (L(7) xor W(3));
    J(0) <= not (L(7) xor W(0));

    -- Inv-Sbox
    L(7) <= W(2) xnor Z(3);
    L(6) <= J(5) xnor TT1;
    L(5) <= J(2) xor W(1);
    L(4) <= W(0) xnor Z(3);
    L(3) <= J(0) xnor TT0;
    L(2) <= J(1) xnor W(1);
    L(1) <= W(3) xnor Z(3);
    L(0) <= not Z(0);

    S <= (not J) when encrypt else (not L); -- MUX with output NOT

end arch_tr_out; -- tr_out
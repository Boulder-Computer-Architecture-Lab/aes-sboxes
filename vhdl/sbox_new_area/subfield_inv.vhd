----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: subfield_inv
-- Project Name: aes-sboxes
-- Description: Subfield inversion in GF((2xor2)xor2)
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
entity subfield_inv is port (
    D: in std_logic_vector(3 downto 0);
    E: out std_logic_vector(3 downto 0)
);
end subfield_inv;

-- architecture
architecture arch_subfield_inv of subfield_inv is
begin
    E(0) <= (D(3) and (D(0) xor D(1))) or (D(2) and ((not D(0)) or D(3)));
    E(1) <= (((not D(2)) and D(3)) and (not (D(0) xor D(1)))) or (D(2) and (D(1) or (not D(3))));
    E(2) <= (D(1) and (D(2) xor D(3))) or (D(0) and ((not D(2)) or D(1)));
    E(3) <= ((not D(0)) and D(1) and (not (D(2) xor D(3)))) or ((D(0) and (D(3) or (not D(1)))));

end arch_subfield_inv; -- subfield_inv
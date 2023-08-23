----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: exp
-- Project Name: aes-sboxes
-- Description: MUX implementation of the AES S-box.
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
entity exp is port (                 	
    A : in std_logic_vector(3 downto 0);  
    B : in std_logic_vector(3 downto 0);  
    D : out std_logic_vector(3 downto 0);  
    Ap: out std_logic;
    Bp: out std_logic
);            		
end exp;

-- architecture
architecture arch_exp of exp is
begin
    Ap <= (A(0) xor A(2)) xor (A(1) xor A(3));
    Bp <= (B(0) xor B(2)) xor (B(1) xor B(3));

    D(0) <= (((A(0) xor A(1)) and (B(0) xor B(1))) xor ((A(0) xor A(2)) and (B(0) xor B(2))) xor (A(0) and B(0)) xor ((A(1) xor A(3)) or (B(1) xor B(3))));
    D(1) <= (((A(0) xor A(1)) and (B(0) xor B(1))) xor ((A(0) xor A(2)) or (B(0) xor B(2))) xor (A(1) and B(1)) xor (Ap and Bp));
    D(2) <= ((A(2) or B(2)) xor ((A(1) xor A(3)) and (B(1) xor B(3))) xor ((A(2) xor A(3)) and (B(2) xor B(3))) xor ((A(0) xor A(2)) and (B(0) xor B(2))));
    D(3) <= ((A(3) and B(3)) xor (Ap and Bp) xor ((A(2) xor A(3)) or (B(2) xor B(3))) xor ((A(0) xor A(2)) and (B(0) xor B(2))));

end arch_exp; -- exp
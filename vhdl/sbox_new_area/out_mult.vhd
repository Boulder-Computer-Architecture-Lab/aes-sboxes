----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: out_mult
-- Project Name: aes-sboxes
-- Description: Output multiplier.
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
entity out_mult is port (                 	
    A : in std_logic_vector(3 downto 0);  
    B : in std_logic_vector(3 downto 0);  
    E : in std_logic_vector(3 downto 0);  
    Ap: in std_logic;
    Bp: in std_logic;
    Z: out std_logic_vector(3 downto 0);
    W: out std_logic_vector(3 downto 0)
);            		
end out_mult;

-- architecture
architecture arch_out_mult of out_mult is
    signal W4: std_logic;
    signal W5: std_logic;
    signal Z4: std_logic;
    signal Z5: std_logic;
begin

    W(0) <= (B(1) and E(0)) xor ((B(0) xor B(1)) and E(1)) xor W4;
    W(1) <= (B(0) and E(1)) xor ((B(0) xor B(1)) and E(0)) xor W5;
    W(2) <= (B(3) and E(2)) xor ((B(2) xor B(3)) and E(3)) xor W4;
    W(3) <= (B(2) and E(3)) xor ((B(2) xor B(3)) and E(2)) xor W5;
    W4 <= ((B(1) xor B(3)) and (E(1) xor E(3))) xor ((B(0) xor B(2)) and (E(0) xor E(2)));
    W5 <= (Bp and (E(1) xor E(3))) xor ((B(1) xor B(3)) and (E(0) xor E(2)));

    Z(0) <= (A(1) and E(0)) xor ((A(0) xor A(1)) and E(1)) xor Z4;
    Z(1) <= (A(0) and E(1)) xor ((A(0) xor A(1)) and E(0)) xor Z5;
    Z(2) <= (A(3) and E(2)) xor ((A(2) xor A(3)) and E(3)) xor Z4;
    Z(3) <= (A(2) and E(3)) xor ((A(2) xor A(3)) and E(2)) xor Z5;
    Z4 <= ((A(1) xor A(3)) and (E(1) xor E(3))) xor ((A(0) xor A(2)) and (E(0) xor E(2)));
    Z5 <= (Ap and (E(1) xor E(3))) xor ((A(1) xor A(3)) and (E(0) xor E(2)));

end arch_out_mult; -- out_mult
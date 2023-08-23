----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: tr_in
-- Project Name: aes-sboxes
-- Description: Transform in.
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
entity tr_in is port (
    encrypt : in std_logic;
    G : in std_logic_vector(7 downto 0);
    A : out std_logic_vector(3 downto 0);
    B : out std_logic_vector(3 downto 0)
);
end tr_in;

-- architecture
architecture arch_tr_in of tr_in is 
    signal T: std_logic_vector(2 downto 0);
    signal Ia: std_logic_vector(3 downto 0);
    signal Ib: std_logic_vector(3 downto 0);
    signal Ka: std_logic_vector(3 downto 0);
    signal Kb: std_logic_vector(3 downto 0);
begin

    Ia(0) <= Ib(3) xor G(4); -- ib3 XOR g4
    Ia(1) <= T(0) xor Ia(3); -- t0 XOR ia3
    Ia(2) <= Ib(3) xor G(7); -- ib3 XOR g7
    Ia(3) <= Ib(3) xor G(1); -- ib3 XOR g1

    Ib(0) <= not G(0); -- NOT g0 
    Ib(1) <= Kb(1) xnor Ka(2); -- kb1 XNOR ka2
    Ib(2) <= Ka(2) xnor G(2); -- ka2 XNOR g2
    Ib(3) <= T(1) xnor G(5); -- t1 XNOR g5

    Ka(0) <= Kb(2) xnor G(5); -- kb2 XNOR g5
    Ka(1) <= G(7) xnor G(4); -- g7 XNOR g4
    Ka(2) <= T(2) xor G(1); -- t2 XOR g1
    Ka(3) <= G(6) xor G(4); --g6 XOR g4

    Kb(0) <= T(0) xor G(5); -- t0 XOR g5
    Kb(1) <= Ka(1) xnor G(6); -- ka1 XNOR g6
    Kb(2) <= Ia(0) xor G(1); -- ia0 XOR g1
    Kb(3) <= Ka(3) xor T(2); -- ka3 XOR t2

    T(0) <= G(7) xor G(2); -- g7 XOR g2
    T(1) <= G(6) xor G(0); -- g6 XOR g0
    T(2) <= T(1) xor G(3); -- t1 XOR g3

    A <= (not Ia) when encrypt else (not Ka); -- MUX with output NOT
    B <= (not Ib) when encrypt else (not Kb); -- MUX with output NOT

end arch_tr_in; -- tr_in
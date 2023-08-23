----------------------------------------------------------------------------------
--
-- Author:  Phaedra Curlin
-- 
-- Create Date: 08/2023
-- Module Name: sbox_new_area
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
entity sbox_new_area is port (
    encrypt: in std_logic;
    byte_in: in std_logic_vector(7 downto 0);
    byte_out: out std_logic_vector(7 downto 0)
);
end sbox_new_area;

-- architecture
architecture arch_sbox_new_area of sbox_new_area is
    signal A: std_logic_vector(3 downto 0);
    signal B: std_logic_vector(3 downto 0);
    signal D: std_logic_vector(3 downto 0);
    signal E: std_logic_vector(3 downto 0);
    signal W: std_logic_vector(3 downto 0);
    signal Z: std_logic_vector(3 downto 0);
    signal Ap: std_logic;
    signal Bp: std_logic;

    component tr_in is port (
        encrypt : in std_logic;
        G : in std_logic_vector(7 downto 0);
        A : out std_logic_vector(3 downto 0);
        B : out std_logic_vector(3 downto 0)
        );
    end component;

    component exp is port (
        A : in std_logic_vector(3 downto 0);  
        B : in std_logic_vector(3 downto 0);  
        D : out std_logic_vector(3 downto 0);  
        Ap: out std_logic;
        Bp: out std_logic
    );
    end component;

    component subfield_inv is port (
        D: in std_logic_vector(3 downto 0);
        E: out std_logic_vector(3 downto 0)
    );
    end component;

    component out_mult is port (
        A : in std_logic_vector(3 downto 0);  
        B : in std_logic_vector(3 downto 0);  
        E : in std_logic_vector(3 downto 0);  
        Ap: in std_logic;
        Bp: in std_logic;
        Z: out std_logic_vector(3 downto 0);
        W: out std_logic_vector(3 downto 0)
    );
    end component;

    component tr_out is port (
        encrypt: in std_logic;
        W: in std_logic_vector(3 downto 0);
        Z: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
    end component;

begin
    tr_in : tr_in port map (
        encrypt => encrypt,
        G => byte_in,
        A => A,
        B => B        
    );

    exp : exp port map (
        A => A,
        B => B,
        D => D,
        Ap => Ap,
        Bp => Bp
    );

    subfield_inv : subfield_inv port map (
        D => D,
        E => E
    );

    out_mult : out_mult port map (
        A => A,
        B => B,
        E => E,
        Ap => Ap,
        Bp => Bp,
        Z => Z,
        W => W
    );

    tr_out : tr_out port map (
        W => W,
        Z => Z,
        encrypt => encrypt,
        S => byte_out
    );

end arch_sbox_new_area; -- sbox_new_area
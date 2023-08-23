library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity sbox_tb is
end sbox_tb;

architecture tb of sbox_tb is

    component sbox_new_area
        port (encrypt  : in std_logic;
              byte_in  : in std_logic_vector (7 downto 0);
              byte_out : out std_logic_vector (7 downto 0));
    end component;

    signal encrypt  : std_logic;
    signal byte_in  : std_logic_vector (7 downto 0);
    signal byte_out : std_logic_vector (7 downto 0);

    begin

    dut : sbox_new_area
    port map (encrypt  => encrypt,
              byte_in  => byte_in,
              byte_out => byte_out);

    stimuli : process begin
        report "System reset.";    
        report "Initiating test for sbox_tb.";    
        encrypt := '1';
        byte_in := x"00";
        wait for 1 ns;
        for i in 0 to 255 loop
            byte_in := i;
            report "TEST " & integer'image(i) & " --- S-box: Encrypt? " & integer'image(encrypt) & ", Evaluating: " & integer'image(byte_in) & ", Expected: " & ", Obtained: " & integer'image(byte_out);
            wait for 1 ns;
        end loop;
        encrypt := '0';
   
        wait;
    end process;

end tb; -- sbox_tb
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 05:29:44 PM
-- Design Name: 
-- Module Name: adunare_sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adunare_sim is
--  Port ( );
end adunare_sim;

architecture Behavioral of adunare_sim is

component scadere is
generic( n: natural);
   Port (  x, y: in std_logic_vector(n-1 downto 0);
 s: out  std_logic_vector(n-1 downto 0));
end component;

signal x, y, s: std_logic_vector(7 downto 0):= (others => '0');
signal tin, tout: std_logic := '0';

begin

c1: scadere generic map (n => 8)  port map( x, y, s);

process
begin

for i in 24 to 26 loop
    x <= std_logic_vector(conv_std_logic_vector(i,8));
    for j in 10 to 13 loop
        y <= std_logic_vector(conv_std_logic_vector(j,8));
        wait for 1 ns;      
    end loop;
end loop;
end process;

end Behavioral;

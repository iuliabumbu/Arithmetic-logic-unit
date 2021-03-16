----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2020 05:26:11 PM
-- Design Name: 
-- Module Name: impartire_sim - Behavioral
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

entity impartire_sim is
--  Port ( );
end impartire_sim;

architecture Behavioral of impartire_sim is


signal clk, rst, term, start: std_logic := '0';
signal x, y, a ,q: std_logic_vector(7 downto 0) := (others => '0');

begin
c1: entity WORK.impartire generic map (n => 8) 
    port map(clk, rst, start, x, y, a ,q, term);

gen_clk: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process gen_clk; 

rst <= '1','0' after 1 ns;


process
begin
 x <= std_logic_vector(conv_std_logic_vector(129,8));
 y <= std_logic_vector(conv_std_logic_vector(0,8));
 start <= '1';
 wait for 500 ns;        

end process;

end Behavioral;


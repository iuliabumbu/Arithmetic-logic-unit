----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 04:16:41 PM
-- Design Name: 
-- Module Name: alu_sim - Behavioral
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

entity alu_sim is
--  Port ( );
end alu_sim;

architecture Behavioral of alu_sim is

signal x, y: std_logic_vector(7 downto 0);
signal res: std_logic_vector(15 downto 0);
signal opcode: std_logic_vector(3 downto 0);
signal clk, rst, start, term: std_logic;

begin


c1: entity WORK.alu generic map (n => 8)  port map(opcode, x, y, clk, rst,start, term, res);

gen_clk: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process gen_clk; 

rst <= '1','0' after 1 ns;
--start <= '1', '0' after 60 ns;
gen_start: process
begin
    start <= '0';
    wait for 30 ns;
    start <= '1';
    wait for 10 ns;
    start <= '0';
    wait for 560 ns;

end process gen_start; 

--simulare pentru valori mici
process
begin

x <= std_logic_vector(conv_std_logic_vector(5,8));
for j in 1 to 3 loop
    y <= std_logic_vector(conv_std_logic_vector(j,8));
    
    opcode <= "0000";
    wait for 10 ns;

    opcode <= "0001";
    wait for 10 ns;

    opcode <= "0010";
    wait for 10 ns;

    opcode <= "0011";
    wait for 500 ns;

    opcode <= "0100";
    wait for 10 ns;

    opcode <= "0101";
    wait for 10 ns;

    opcode <= "0110";
    wait for 10 ns;

    opcode <= "0111";
    wait for 10 ns;

    opcode <= "1000";
    wait for 10 ns;

    opcode <= "1001";
    wait for 10 ns;

    opcode <= "1010";
    wait for 10 ns;        
end loop;


--simulare pentru valori intermediare


x <= std_logic_vector(conv_std_logic_vector(150,8));
for j in 63 to 65 loop
    y <= std_logic_vector(conv_std_logic_vector(j,8));
    
    opcode <= "0000";
    wait for 10 ns;

    opcode <= "0001";
    wait for 10 ns;

    opcode <= "0010";
    wait for 10 ns;

    opcode <= "0011";
    wait for 500 ns;

    opcode <= "0100";
    wait for 10 ns;

    opcode <= "0101";
    wait for 10 ns;

    opcode <= "0110";
    wait for 10 ns;

    opcode <= "0111";
    wait for 10 ns;

    opcode <= "1000";
    wait for 10 ns;

    opcode <= "1001";
    wait for 10 ns;

    opcode <= "1010";
    wait for 10 ns;        
end loop;

--simulare pentru valori mari

x <= std_logic_vector(conv_std_logic_vector(255,8));
for j in 251 to 253 loop
    y <= std_logic_vector(conv_std_logic_vector(j,8));
    
    opcode <= "0000";
    wait for 10 ns;

    opcode <= "0001";
    wait for 10 ns;

    opcode <= "0010";
    wait for 10 ns;

    opcode <= "0011";
    wait for 500 ns;

    opcode <= "0100";
    wait for 10 ns;

    opcode <= "0101";
    wait for 10 ns;

    opcode <= "0110";
    wait for 10 ns;

    opcode <= "0111";
    wait for 10 ns;

    opcode <= "1000";
    wait for 10 ns;

    opcode <= "1001";
    wait for 10 ns;

    opcode <= "1010";
    wait for 10 ns;        
end loop;
end process;

end Behavioral;

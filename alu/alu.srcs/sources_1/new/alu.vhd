----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 05:51:13 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
generic( n: natural);
  Port ( opcode: in std_logic_vector(3 downto 0);
 x, y: in std_logic_vector(n-1 downto 0);
 clk, rst, start: in std_logic;
 term: out std_logic;
 rez: out  std_logic_vector(2*n-1 downto 0));
end alu;

architecture Behavioral of alu is

signal sum,dif, compl, a, q, zero, andRes, orRes, xorRes, xnorRes,shlRes, shrRes  : std_logic_vector(n-1 downto 0) := (others => '0');
signal p: std_logic_vector(2*n-1 downto 0) := (others => '0');
signal tout: std_logic := '0';

begin

--Control: entity WORK.ControlUnit port map( opcode, add, sub, mul, div, annd, orr, xorr, xnorr,shiftl, shiftr, compl2);
adunare: entity WORK.adunare  generic map (n => n) port map('0', x, y, sum, tout);
scadere: entity WORK.scadere  generic map (n => n) port map(x, y, dif);
produs: entity WORK.InmultireMatriceala generic map (n => n) port map(x, y, p);
impartire: entity WORK.impartire generic map (n => n) port map(clk, rst, start, x, y, a ,q, term);
complement: entity WORK.complement2 generic map (n => n) port map(x, compl);
si: entity WORK.andLogic generic map (n => n) port map(x,y, andRes);
sau: entity WORK.orLogic generic map (n => n) port map(x,y, orRes);
sau_exclusiv: entity WORK.xorLogic generic map (n => n) port map(x,y, xorRes);
coincidenta: entity WORK.xnorLogic generic map (n => n) port map(x,y, xnorRes);
shiftLeft: entity WORK.shiftLeftLogic generic map (n => n) port map(x,y, shlRes);
shiftRight: entity WORK.shiftRightLogic generic map (n => n) port map(x,y, shrRes);

control:process (opcode, sum, dif, p, a, q, compl, andRes, orRes, xorRes, xnorRes, shlRes, shrRes)
begin
case opcode is
			when "0000" => rez <= zero(n-1 downto 1)& tout & sum;
			when "0001" => rez <= zero & dif;
			when "0010" => rez <= p;
			when "0011" => rez <= a & q;
			when "0100" => rez <= zero & andRes;
			when "0101" => rez <= zero & orRes;
			when "0110" => rez <= zero & xorRes;
			when "0111" => rez <= zero & xnorRes;
			when "1000" => rez <=  zero & shlRes;
			when "1001" => rez <= zero & shrRes;
			when "1010" => rez <= zero & compl;
			when others => rez <= zero & zero;						
end case;
end process;


end Behavioral;

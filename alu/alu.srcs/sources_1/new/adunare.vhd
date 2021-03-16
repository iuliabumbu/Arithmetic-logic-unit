----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 05:21:08 PM
-- Design Name: 
-- Module Name: adunare - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adunare is
generic( n: natural);
  Port ( tin: in std_logic;
  x, y: in std_logic_vector(n-1 downto 0);
  s: out  std_logic_vector(n-1 downto 0);
  tout: out std_logic);
end adunare;

architecture Behavioral of adunare is

component SumatorElementar is
  Port ( x, y, tin: in std_logic;
  s, tout: out std_logic );
end component;

signal aux: std_logic_vector(n downto 0) := (others => '0');
begin

aux(0) <= tin;
tout <= aux(n);

Suma: for i in 0 to n-1 generate
            c: SumatorElementar port map(x(i), y(i), aux(i),s(i), aux(i+1));
end generate; 

end Behavioral;

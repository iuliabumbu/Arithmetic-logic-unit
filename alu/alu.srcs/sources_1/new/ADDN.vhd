----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 01:57:45 PM
-- Design Name: 
-- Module Name: ADDN - Behavioral
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

entity ADDN is
 generic( n: natural);
  Port ( tin: in std_logic;
  x, y: in std_logic_vector(n-1 downto 0);
  s: out  std_logic_vector(n-1 downto 0);
  tout, ovf: out std_logic);
end ADDN;

architecture Behavioral of ADDN is

signal aux: std_logic_vector(n downto 0);
begin
    aux(0) <= tin;
    suma: for i in 0 to n-1 generate
            s(i) <= x(i) xor y(i) xor aux(i);
            aux(i+1) <= (x(i) and y(i)) or ((x(i) or y(i)) and aux(i));
    end generate;
    
    ovf <= aux(n-1) xor aux(n-2);   
    tout <= aux(n);   
    

end Behavioral;

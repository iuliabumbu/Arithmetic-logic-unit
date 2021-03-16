----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2020 10:54:32 AM
-- Design Name: 
-- Module Name: inmultireMatriceala_sim - Behavioral
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

entity inmultireMatriceala_sim is
--  Port ( );
end inmultireMatriceala_sim;

architecture Behavioral of inmultireMatriceala_sim is

component InmultireMatriceala is
 generic( n: natural);
  Port (x, y: in std_logic_vector(n-1 downto 0);
  p: out std_logic_vector(2*n-1 downto 0));
end component;

signal x, y: std_logic_vector(7 downto 0):= (others => '0');
signal p: std_logic_vector(15 downto 0):= (others => '0');

begin

c1: InmultireMatriceala generic map (n => 8)  port map(x, y, p);

process
begin

for i in 0 to 3 loop
    x <= std_logic_vector(conv_std_logic_vector(i,8));
    for j in 0 to 3 loop
        y <= std_logic_vector(conv_std_logic_vector(j,8));
        wait for 1 ns;
          if (p /= (x * y)) then
                 report "inmultire incorecta" & " & la t = " & TIME'image (now)
                severity ERROR;
          end if;      
    end loop;
end loop;

for i in 0 to 3 loop
    x <= std_logic_vector(conv_std_logic_vector(i,8));
    for j in 0 to 3 loop
        y <= std_logic_vector(conv_std_logic_vector(j,8));
        wait for 1 ns;
          if (p /= (x * y)) then
                 report "inmultire incorecta" & " & la t = " & TIME'image (now)
                severity ERROR;
          end if;      
    end loop;
end loop;

for i in 252 to 255 loop
    x <= std_logic_vector(conv_std_logic_vector(i,8));
    for j in 252 to 255 loop
        y <= std_logic_vector(conv_std_logic_vector(j,8));
        wait for 1 ns;
          if (p /= (x * y)) then
                 report "inmultire incorecta" & " & la t = " & TIME'image (now)
                severity ERROR;
          end if;      
    end loop;
end loop;

for i in 133 to 136 loop
    x <= std_logic_vector(conv_std_logic_vector(i,8));
    for j in 23 to 26 loop
        y <= std_logic_vector(conv_std_logic_vector(j,8));
        wait for 1 ns;
          if (p /= (x * y)) then
                 report "inmultire incorecta" & " & la t = " & TIME'image (now)
                severity ERROR;
          end if;      
    end loop;
end loop;

end process;


end Behavioral;

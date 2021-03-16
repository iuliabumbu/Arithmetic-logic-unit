----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 02:55:18 PM
-- Design Name: 
-- Module Name: comanda_booth - Behavioral
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

entity comanda_impartire is
  generic( n: natural);
  Port (clk, rst, start, An: in std_logic;
  term, ldA, ldB, ldQ, subB, shlAQ, ldQi, rstA, rstQ: out std_logic );
end comanda_impartire;

architecture Behavioral of comanda_impartire is
type state_type is (idle, init, shift, subs, stateQ0, testA, addi, testC, stop);
signal state: state_type;
signal count: natural := n;

begin

process(clk)
begin

if clk'event and clk = '1' then
		   if rst = '1' then 
			   state <= idle;
		   else
		     case state is 
		      when idle =>
		                   if start = '1' then 
                                state <= init;
                           else
                                state <= idle;
                           end if;
              when init => state <= shift; count <= n;
              when shift => state <= subs; 
              when subs => state <= stateQ0;
              when stateQ0 => state <= testA;
              when testA => 
                           if An = '1' then
                                state <= addi;
                           else 
                                state <= testC;     
                           end if;   
                           count <= count - 1;
              when addi => state <= testC;    
              when testC =>  
                           if count = 0 then 
                                state <= stop;
                           else
                                state <= shift;
                           end if;  
              when stop => state <= idle;                
            end case;
         end if;
end if;
end process;    
--ldQi e folosit sa incarce initial in registrul Q intrarea X la starea init, iar ldQ sa incarce reg Q cu valorile intermediare
process(state)
begin case state is 
    when idle => term <= '0'; ldA <= 'X'; ldB <= 'X'; ldQ <= 'X'; subB <= '0'; shlAQ <= 'X'; ldQi <= 'X'; rstA <= 'X';rstQ <= 'X';
    when init => term <= '0'; ldA <= '0'; ldB <= '1'; ldQ <= '0'; subB <= '0'; shlAQ <= '0'; ldQi <= '1'; rstA <= '1';rstQ <= '0';
    when shift => term <= '0'; ldA <= '0'; ldB <= '0'; ldQ <= '0'; subB <= '0'; shlAQ <= '1'; ldQi <= '0';rstA <= '0';rstQ <= '0';
    when subs => term <= '0'; ldA <= '1'; ldB <= '0'; ldQ <= '0'; subB <= '1'; shlAQ <= '0'; ldQi <= '0';rstA <= '0';rstQ <= '0';
    when stateQ0 => term <= '0'; ldA <= '0'; ldB <= '0'; ldQ <= '1'; subB <= '0'; shlAQ <= '0'; ldQi <= '0';rstA <= '0';rstQ <= '0';
    when testA => term <= '0'; ldA <= '0'; ldB <= '0'; ldQ <= '0'; subB <= '0';shlAQ <= '0';ldQi <= '0';rstA <= '0';rstQ <= '0';
    when addi => term <= '0'; ldA <= '1'; ldB <= '0'; ldQ <= '0'; subB <= '0'; shlAQ <= '0';ldQi <= '0';rstA <= '0';rstQ <= '0';
    when testC => term <= '0'; ldA <= '0'; ldB <= '0'; ldQ <= '0'; subB <= '0'; shlAQ <= '0';ldQi <= '0';rstA <= '0';rstQ <= '0';
    when stop => term <= '1'; ldA <= '0'; ldB <= '0'; ldQ <= '0'; subB <= '0'; shlAQ <= '0';ldQi <= '0';rstA <= '0';rstQ <= '0';
    
end case;
end process;                             




end Behavioral;

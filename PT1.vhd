----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:20 03/28/2016 
-- Design Name: 
-- Module Name:    PT1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PT1 is
	Port(Load : in STD_LOGIC_VECTOR (15 downto 0);
		  CLK: in STD_LOGIC;
		  DECODE : out STD_LOGIC_VECTOR (15 downto 0));
		  
end PT1;

architecture Behavioral of PT1 is
signal LATCH_IN: STD_LOGIC_VECTOR (15 downto 0);
begin
	process(CLK)
	begin
	if(CLK'event and CLK = '1')then
		LATCH_IN <= Load;
	end if;
	end process;
	
	process(CLK)
	begin
	if(CLK'event and CLK = '0')then
		DECODE<=LATCH_IN;
			end if;
	end process;
end Behavioral;


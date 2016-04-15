----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:19 03/11/2016 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
Port (     CLK      : in  STD_LOGIC;
           Reset    : in  STD_LOGIC; 
           --DATA     : in  STD_LOGIC_VECTOR (4 downto 0);
           Inst_Adr : out STD_LOGIC_VECTOR (4 downto 0));
end PC;

--ProgramRam: entity work.Program_Ram 
--	port map( CLKA => CLK,
--				 DINA => Load,
--				 ADDRA => Inst_Adr,
--				 DOUTB => DOUTB); 

architecture Behavioral of PC is
	signal count   : STD_LOGIC_Vector (4 downto 0):= (others=>'0'); --count up to 31 adr's
begin	
	PC: process(CLK,Reset)
   begin
		if (Reset = '1') then 
			count <= "00000";
		elsif (CLK'event and CLK = '1') then
			count <= count + 1;
		else
			count <= count;
		end if;
   end process PC;
   Inst_Adr <= count;
end Behavioral;	 
				 
				 


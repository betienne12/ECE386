----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:24 03/25/2016 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
	Port (	CLK	: in STD_LOGIC;
				OPCODE_Access	: in STD_LOGIC_VECTOR(15 downto 0);
				OPCODE	: out   STD_LOGIC_VECTOR(3 downto 0);
				RA : out STD_LOGIC_VECTOR(3 downto 0);
				RB	:out STD_LOGIC_VECTOR(3 downto 0);
				IMM	: out STD_LOGIC_VECTOR(7 downto 0);
				CONST : out STD_LOGIC_VECTOR(3 downto 0);
				RS : out STD_LOGIC_VECTOR(1 downto 0);
				ID : out STD_LOGIC_VECTOR(1 downto 0)
			);
				
				
end Decoder;

architecture Behavioral of Decoder is
--signal RA_save :  STD_LOGIC_VECTOR(3 downto 0):=(OTHERS=> '0');
--signal RB_save	: STD_LOGIC_VECTOR(3 downto 0):=(OTHERS=> '0');
--signal OPCODE_save	:  STD_LOGIC_VECTOR(3 downto 0):=(OTHERS=> '0');
--signal IMM_save	:  STD_LOGIC_VECTOR(7 downto 0):=(OTHERS=> '0');



begin

 process(CLK)
 begin
	if(CLK'event and CLK = '1')then
		OPCODE <= OPCODE_Access(15 downto 12); 
		RA <= OPCODE_Access(11 downto 8);
		RB <= OPCODE_Access(7 downto 4); 
		IMM <= OPCODE_Access(7 downto 0); 
		CONST <= OPCODE_Access(3 downto 0);
		RS <= OPCODE_Access(7 downto 6);
		ID <= OPCODE_Access(5 downto 4);
	
	end if;
	end process;
end Behavioral;

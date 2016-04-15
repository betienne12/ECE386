----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:59 03/28/2016 
-- Design Name: 
-- Module Name:    PT2 - Behavioral 
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

entity PT2 is
 port( OPCODE : in STD_LOGIC_VECTOR (3 downto 0);
		 RA : in STD_LOGIC_VECTOR (3 downto 0);
		 RB : in STD_LOGIC_VECTOR (3 downto 0);
		 IMM : in STD_LOGIC_VECTOR (7 downto 0);
		 CLK : in STD_LOGIC; 
		 --PT2_EN : in STD_LOGIC;
		 
		 OPCODE_saved : out STD_LOGIC_VECTOR (3 downto 0);
		 RA_saved : out STD_LOGIC_VECTOR (3 downto 0);
		 RB_saved : out STD_LOGIC_VECTOR (3 downto 0);
		 IMM_saved : out STD_LOGIC_VECTOR (7 downto 0));
end PT2;

architecture Behavioral of PT2 is
signal op_code : STD_LOGIC_VECTOR (3 downto 0);
signal ra_addr : STD_LOGIC_VECTOR (3 downto 0);
signal rb_addr : STD_LOGIC_VECTOR (3 downto 0);
signal immed : STD_LOGIC_VECTOR (7 downto 0);

begin
	process(CLK)
	begin
		if(CLK'event and CLK = '0')then
			op_code <= OPCODE;
			ra_addr <= RA;
			rb_addr <= RB;
			immed <= IMM;
		end if;
		if(CLK'event and CLK = '1')then
			OPCODE_saved <= op_code;
			RA_saved <= ra_addr;
			RB_saved <= rb_addr;
			IMM_saved <= immed;
		end if;
	end process;
end Behavioral;


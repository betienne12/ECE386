----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:07 03/30/2016 
-- Design Name: 
-- Module Name:    PT3 - Behavioral 
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

entity PT3 is
	port( OPCODE_VALUE : in STD_LOGIC_VECTOR (3 downto 0);
		 RA_VALUE : in STD_LOGIC_VECTOR (15 downto 0);
		 RB_VALUE : in STD_LOGIC_VECTOR (15 downto 0);
		 IMMED_VALUE : in STD_LOGIC_VECTOR (15 downto 0);
		 RA_ADDR : in STD_LOGIC_VECTOR (3 downto 0);
		 CLK : in STD_LOGIC; 
		 --PT3_EN : in STD_LOGIC;
		 
		 OPCODE_FINAL : out STD_LOGIC_VECTOR (3 downto 0);
		 RA_FINAL : out STD_LOGIC_VECTOR (15 downto 0);
		 RB_FINAL : out STD_LOGIC_VECTOR (15 downto 0);
		 IMMED_FINAL : out STD_LOGIC_VECTOR (15 downto 0)
		 );
end PT3;

architecture Behavioral of PT3 is
signal op_val : STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');
signal ra_val : STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal rb_val : STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal immed_val : STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal ra_address : STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');
begin
	process(CLK)
	begin
		if(CLK'event and CLK = '0')then
			op_val <= OPCODE_VALUE;
			ra_val <= RA_VALUE;
			rb_val <= RB_VALUE;
			immed_val <= IMMED_VALUE;
			ra_address <= RA_ADDR;
		end if;
		if(CLK'event and CLK = '1')then
			OPCODE_FINAL <= op_val;
			RA_FINAL <= ra_val;
			RB_FINAL <= rb_val;
			IMMED_FINAL <= immed_val;
		end if;
	end process;

end Behavioral;


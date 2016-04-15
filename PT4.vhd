----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:00:40 04/01/2016 
-- Design Name: 
-- Module Name:    PT4 - Behavioral 
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

entity PT4 is
	port( CLK : in std_logic;
			ALU_VALUE : in std_logic_vector(15 downto 0);
			CCR_VALUE : in std_logic_vector(3 downto 0);
			LDST_VALUE : in std_logic_vector(15 downto 0);
			ALU_SAVED : out std_logic_vector(15 downto 0);
			CCR_SAVED : out std_logic_vector(3 downto 0);
			LDST_SAVED : out std_logic_vector(15 downto 0)
		  );
end PT4;

architecture Behavioral of PT4 is
signal alu_val: std_logic_vector(15 downto 0):=(others=>'0');
signal ccr_val:std_logic_vector(3 downto 0):=(others=>'0');
signal ldst_val: std_logic_vector(15 downto 0):=(others=>'0');
begin
	process(CLK)
	begin
		if(CLK'event and CLK = '0')then
			alu_val <= ALU_VALUE;
			ccr_val <= CCR_VALUE;
			ldst_val <= LDST_VALUE;
		end if;
		if(CLK'event and CLK = '1')then
			ALU_SAVED <= alu_val;
			CCR_SAVED <= ccr_val;
			LDST_SAVED <= LDST_VALUE;
			end if;
		end process;
end Behavioral;


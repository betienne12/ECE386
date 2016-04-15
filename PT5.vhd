----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:14 04/01/2016 
-- Design Name: 
-- Module Name:    PT5 - Behavioral 
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

entity PT5 is
	port( CLK : IN STD_LOGIC;
			ALU_FINAL : IN STD_LOGIC_VECTOR(15 downto 0);
			LDST_DATA : IN STD_LOGIC_VECTOR(15 downto 0);
			ALU_FIN_SAVE: OUT STD_LOGIC_VECTOR(15 downto 0);
			LDST_DATA_SAVE: OUT STD_LOGIC_VECTOR(15 downto 0)
		  );
end PT5;

architecture Behavioral of PT5 is
signal alu_transfer : STD_LOGIC_VECTOR(15 downto 0);
signal ldst_transfer : STD_LOGIC_VECTOR(15 downto 0);

begin
		process(CLK)
		begin
			if(CLK'event and CLK = '0')then
				alu_transfer <= ALU_FINAL;
				ldst_transfer <= LDST_DATA;
			end if;
			if(CLK'event and CLK = '1')then
				ALU_FIN_SAVE <= alu_transfer;
				LDST_DATA_SAVE <= ldst_transfer;
			end if;
		end process;
end Behavioral;


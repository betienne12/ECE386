----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:33 04/01/2016 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
	port( CLK : IN STD_LOGIC;
			CTRL_OPCODE :IN STD_LOGIC_VECTOR(3 downto 0);
			WB_RA : IN STD_LOGIC_VECTOR(3 downto 0);
			Reg_Bank_WE : OUT STD_LOGIC;
			Reg_Bank_RE : OUT STD_LOGIC;
			Reg_Bank_EN : OUT STD_LOGIC;
			
			DM_WE : OUT STD_LOGIC;
			DM_RE : OUT STD_LOGIC;
			DM_EN : OUT STD_LOGIC;
			
			--WB_ADDR : OUT STD_LOGIC_VECTOR(3 downto 0);
			IMM_MUX_SEL : OUT STD_LOGIC;
			DM_MUX_SEL : OUT STD_LOGIC;
			
			--PT1_EN : OUT STD_LOGIC;
			
			RESET: IN STD_LOGIC
			);
			
end control;

architecture Behavioral of control is


begin
	process(CLK,RESET)
	begin 
		if(RESET = '1') then
			--Reg_Bank_EN <= '0';
			IMM_MUX_SEL <= '0';
			DM_MUX_SEL <= '0';
			DM_EN <='0';
		 elsif (CLK'event and CLK = '1') then
			if(CTRL_OPCODE > "0100") then
				IMM_MUX_SEL <='1';
				DM_MUX_SEL <= '1';
				
				if(CTRL_OPCODE = "1001") then		---load
					DM_WE <='0';		---may be un-needed as reads only on rising
					DM_RE <='1';
					DM_EN <='1';
				elsif(CTRL_OPCODE ="1010") then		---store
					DM_WE <='1';
					DM_RE <='0';
					DM_EN <='1';
				else
					DM_EN <='0';			---Reg-imm disable data memory
				end if;	
				
			else
				IMM_MUX_SEL <='0';
				DM_MUX_SEL <= '0';
				DM_EN <='0';			----reg-reg disable data memory
		   end if;
		 elsif (CLK'event and CLK ='0' and CTRL_OPCODE /= "1010") then
			Reg_Bank_EN <='1';
			Reg_Bank_WE <='1';
			Reg_Bank_RE <='0'; ---may be un-needed as reg_bank writes only on falling
			--WB_ADDR <= WB_RA;
		 end if;
	 end process;
end Behavioral;


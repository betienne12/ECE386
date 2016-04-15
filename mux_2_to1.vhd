---------------------------------------------------
-- School: University of Massachusetts Dartmouth
-- Department: Computer and Electrical Engineering
-- Engineer: Daniel Noyes
-- 
-- Create Date:    SPRING 2014
-- Module Name:    MUX_2to1
-- Project Name:   CLOCK COUNTER
-- Target Devices: Spartan-3E
-- Tool versions:  Xilinx ISE 14.7
-- Description:    2 Select MUX
---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port ( SEL  : in  STD_LOGIC;
           RB_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           IMM_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           MOUT : out STD_LOGIC_VECTOR(15 downto 0)
			  );
end mux2to1;

architecture Behavioral of mux2to1 is

begin

    MOUT <= RB_IN when SEL='0' ELSE IMM_IN;

end Behavioral;


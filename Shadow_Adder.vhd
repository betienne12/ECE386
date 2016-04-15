----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:34:12 04/13/2016 
-- Design Name: 
-- Module Name:    Shadow_Adder - Behavioral 
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

entity Shadow_Adder is
port(
			  RS_value  : in  STD_LOGIC(15 downto 0);
           IMM_IN : in  STD_LOGIC_VECTOR(3 downto 0);
           MOUT : out STD_LOGIC_VECTOR(19 downto 0)
			  );

end Shadow_Adder;

architecture Combinational  of Shadow_Adder is

signal output : STD_LOGIC_VECTOR(19 downto 0):=(OTHERS=> '0');

begin
MOUT <= ((RS_value & "0000")+(IMM_IN & "0000000000000000"));




end Combinational;


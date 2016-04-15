--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:11 03/30/2016
-- Design Name:   
-- Module Name:   U:/ECE 368/Project_pt1/Reg_Bank_tb.vhd
-- Project Name:  Project_pt1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg_Bank
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Reg_Bank_tb IS
END Reg_Bank_tb;
 
ARCHITECTURE behavior OF Reg_Bank_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg_Bank
    PORT(
         Clock : IN  std_logic;
         Enable : IN  std_logic;
         Read : IN  std_logic;
         Write : IN  std_logic;
         Read_AddrA : IN  std_logic_vector(3 downto 0);
         Read_AddrB : IN  std_logic_vector(3 downto 0);
         Write_AddrA : IN  std_logic_vector(3 downto 0);
         Data_inA : IN  std_logic_vector(15 downto 0);
         Data_outA : OUT  std_logic_vector(15 downto 0);
         Data_outB : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Enable : std_logic := '0';
   signal Read : std_logic := '0';
   signal Write : std_logic := '0';
   signal Read_AddrA : std_logic_vector(3 downto 0) := (others => '0');
   signal Read_AddrB : std_logic_vector(3 downto 0) := (others => '0');
   signal Write_AddrA : std_logic_vector(3 downto 0) := (others => '0');
   signal Data_inA : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Data_outA : std_logic_vector(15 downto 0);
   signal Data_outB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
	
	signal val: std_logic_vector(3 downto 0):=(others=>'0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_Bank PORT MAP (
          Clock => Clock,
          Enable => Enable,
          Read => Read,
          Write => Write,
          Read_AddrA => Read_AddrA,
          Read_AddrB => Read_AddrB,
          Write_AddrA => Write_AddrA,
          Data_inA => Data_inA,
          Data_outA => Data_outA,
          Data_outB => Data_outB
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Enable<='1';
			Read<='0';
			Write<='1';
			Write_AddrA<=x"0";
			Data_inA <=x"1324";
			Write<='0';
			Read<='1';
		
		--assert(Data_outA=x"12") report "Wrong output" & integer'image(Data_outA))) severity ERROR;
       

      wait;
   end process;

END;

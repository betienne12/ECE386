--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:16:04 04/01/2016
-- Design Name:   
-- Module Name:   U:/ECE 368/Project_pt1/RISC_toplevel_tb.vhd
-- Project Name:  Project_pt1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RISC_toplevel
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
 
ENTITY RISC_toplevel_tb IS
END RISC_toplevel_tb;
 
ARCHITECTURE behavior OF RISC_toplevel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RISC_toplevel
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         TOP_AlU_OUT : OUT  std_logic_vector(15 downto 0);
         TOP_LDST : OUT  std_logic_vector(15 downto 0);
         TOP_LDST_VALUE : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Load : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal TOP_AlU_OUT : std_logic_vector(15 downto 0);
   signal TOP_LDST : std_logic_vector(15 downto 0);
   signal TOP_LDST_VALUE : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RISC_toplevel PORT MAP (
          CLK => CLK,
          Reset => Reset,
          TOP_AlU_OUT => TOP_AlU_OUT,
          TOP_LDST => TOP_LDST,
          TOP_LDST_VALUE => TOP_LDST_VALUE
        );

   -- Clock process definitions
   gen_Clock :process
   begin
        CLK <= '0'; wait for period;
        CLK <= '1'; wait for period;
    end process gen_Clock;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <='1';
      wait for 100 ns;
		reset <='0';

      -- insert stimulus here 

      wait;
   end process;

END;

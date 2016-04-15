--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:31:28 03/29/2016
-- Design Name:   
-- Module Name:   U:/ECE 368/Project_pt1/fetch_decode_tb.vhd
-- Project Name:  Project_pt1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY fetch_decode_tb IS
END fetch_decode_tb;
 
ARCHITECTURE behavior OF fetch_decode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         CLK : IN  std_logic;
         OPCODE_Access : IN  std_logic_vector(15 downto 0);
         OPCODE : OUT  std_logic_vector(3 downto 0);
         RA : OUT  std_logic_vector(3 downto 0);
         RB : OUT  std_logic_vector(3 downto 0);
         IMM : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal OPCODE_Access : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal OPCODE : std_logic_vector(3 downto 0);
   signal RA : std_logic_vector(3 downto 0);
   signal RB : std_logic_vector(3 downto 0);
   signal IMM : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          CLK => CLK,
          OPCODE_Access => OPCODE_Access,
          OPCODE => OPCODE,
          RA => RA,
          RB => RB,
          IMM => IMM
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
      wait for 100 ns;	
      OPCODE_Access <= x"5002";
      -- insert stimulus here 

      wait;
   end process;

END;

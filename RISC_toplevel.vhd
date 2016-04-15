----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:29 03/11/2016 
-- Design Name: 
-- Module Name:    RISC_toplevel - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.all;

entity RISC_toplevel is
    Port ( CLK      : in  STD_LOGIC;
           Reset    : in  STD_LOGIC; 
           --Load     : in  STD_LOGIC_VECTOR (15 downto 0);
			  TOP_AlU_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
			  TOP_LDST : out STD_LOGIC_VECTOR(15 downto 0);
			  TOP_LDST_VALUE : out STD_LOGIC_VECTOR(15 downto 0)
			  );
end RISC_toplevel;
  
architecture Structural of RISC_toplevel is
 
 constant width: integer:=16;
 constant depth: integer:=32;
 constant addr: integer:=4;
 constant ir_addr: integer:=5;
 
 --ram & pt1
 signal doutb : STD_LOGIC_VECTOR(width-1 downto 0):=(OTHERS=> '0');
 --pt1 latch
 signal decode : STD_LOGIC_VECTOR(width-1 downto 0):=(OTHERS=> '0');
 --pt2 latch 
 signal opcode : STD_LOGIC_VECTOR(addr-1 downto 0):=(OTHERS=> '0');
 signal ra : STD_LOGIC_VECTOR(addr-1 downto 0):=(OTHERS=> '0');
 signal rb : STD_LOGIC_VECTOR(addr-1 downto 0):=(OTHERS=> '0');
 signal immediate : STD_LOGIC_VECTOR(7 downto 0):=(OTHERS=> '0');
 signal instr_adr: STD_LOGIC_VECTOR(ir_addr-1 downto 0):=(OTHERS=> '0');
 
 ----Reg bank-----
 signal b_addr : std_logic_vector(addr-1 downto 0):=(others => '0');
 signal a_addr : std_logic_vector(addr-1 downto 0):=(others => '0');
 signal wb_addr : std_logic_vector(addr-1 downto 0):=(others => '0');
 signal b_out : std_logic_vector(width-1 downto 0):=(others => '0');
 signal a_out : std_logic_vector(width-1 downto 0):=(others => '0');
 signal en : STD_LOGIC:='1';

 
 signal RE: STD_LOGIC:='1'; 
 signal WR: STD_LOGIC:='0';
 
 ---ALU-----
 signal opcode_final : std_logic_vector(addr-1 downto 0):=(others => '0');
 signal ra_final : std_logic_vector(width-1 downto 0):=(others => '0');
 signal rb_final : std_logic_vector(width-1 downto 0):=(others => '0'); 
 signal immed_final : std_logic_vector(width-1 downto 0):=(others => '0');
 signal alu_out : std_logic_vector(width-1 downto 0):=(others => '0');
 signal ccr : std_logic_vector(addr-1 downto 0):=(others => '0');
 signal ldst_out : std_logic_vector(width-1 downto 0);
 
 ----MUX----
 signal ctrl_sel : std_logic :='1';  --change to be control
 signal mux_value : std_logic_vector(width-1 downto 0):=(others=> '0');
 
 ---Pt4----
 signal alu_saved : std_logic_vector(width-1 downto 0):=(others=>'0');
 signal ccr_saved : std_logic_vector(3 downto 0):=(others=>'0');
 signal ldst_saved : std_logic_vector(width-1 downto 0):=(others=>'0');

-----DATA MEMORY---- 
 signal dm_en: STD_LOGIC:='0';
 signal dm_re: STD_LOGIC:='0';
 signal dm_wr: STD_LOGIC:='0';
 signal immediate_full: STD_LOGIC_VECTOR(width-1 downto 0):=(others => '0');
 signal data_out: STD_LOGIC_VECTOR(width-1 downto 0):=(others=>'0');
 
 ---DATA MEMORY MUX----
 signal dm_ctrl_sel : std_logic:='0';
 signal alu_fin_save : std_logic_vector(width-1 downto 0):=(others=>'0');
 signal ldst_data_save : std_logic_vector(width-1 downto 0):=(others=>'0');
 signal wb_data : std_logic_vector(width-1 downto 0):=(others=>'0');
 
 --signal rst: std_logic:='0';    ---use to be for control
 signal ena: std_logic:='1';
-- signal weaz : std_logic_vector(0 downto 0):=(others=>'0');
  signal a_cpy_addr: std_logic_vector(3 downto 0):=(others=>'0');
  
  ---PT2----
  signal imm_mux: std_logic_vector(7 downto 0):=(others=>'0');
  signal opcode_pt3: std_logic_vector(3 downto 0):=(others=>'0');
  
  ---Shadow Register Bank----
  signal CONST_wire: std_logic_vector(3 downto 0):=(others=>'0');
  signal RS_wire: std_logic_vector(1 downto 0):=(others=>'0');
  signal ID_wire: std_logic_vector(1 downto 0):=(others=>'0');
  
  signal Shadow_en: std_logic:='0';
  signal Shadow_rd: std_logic:='0';
  signal Shadow_wr: std_logic:='0';
  
  signal Shadow_data: std_logic_vector(width-1 downto 0);
  
  -------Shadow adder------
  
begin

    PC: entity work.PC
    port map( CLK => CLK,
				  Inst_Adr =>instr_adr,
              Reset => Reset);	
	
	 Program_ROM: entity work.Program_ROM
	 port map( CLKA => CLK,
				 ADDRA => instr_adr,
				 ENA => ena,
				 DOUTA => doutb );
				 
	 PT1: entity work.PT1
	 port map( CLK => CLK,
				 Load => doutb,
				 --PT1_EN =>
				 DECODE => decode);
				
	Decoder: entity work.Decoder
	port map( OPCODE_Access => decode,
	
				 OPCODE => opcode,
				 RA => ra,
				 RB => rb,
				 IMM => immediate,
				 CONST => CONST_wire,
				 RS => RS_wire,
				 ID => ID_wire,
				 CLK => CLK);
				 
	PT2: entity work.PT2
	port map( CLK => CLK,
				 OPCODE => opcode,
				 RA => ra,
				 RB => rb,
				 IMM => immediate,
				 --PT2_EN =>
				 
				 OPCODE_saved => opcode_pt3,
				 IMM_saved => imm_mux,
				 RA_saved => a_addr,
				 RB_saved => b_addr
				 );	
	
	Reg_Bank: entity work.Reg_Bank			 
	port map(CLOCK => CLK,
				Data_inA => wb_data,
				Read_AddrA => a_addr,
				Read_AddrB => b_addr,
				Write_AddrA => wb_addr,
				Data_outB => b_out,
				Enable => en,
				Data_outA => a_out,
				Read => '1',--RE,
				Write => WR
				);		 
				
	 immediate_full<= x"00" & imm_mux;
	 
	 MUX2TO1: entity work.mux2to1
    port map( SEL  => ctrl_sel,
           RB_IN => rb_final,
           IMM_IN => immediate_full,
           MOUT => mux_value
			  );
	
	PT3: entity work.PT3
	port map( CLK => CLK,
				 OPCODE_VALUE => opcode_pt3,
				 RA_VALUE => a_out,
				 RB_VALUE => b_out,
				 IMMED_VALUE => immediate_full,
				 RA_ADDR => ra,
				 --PT3_EN =>
				 
				 OPCODE_FINAL => opcode_final,
				 RA_FINAL => ra_final,
				 RB_FINAL => rb_final,
				 IMMED_FINAL => immed_final
				 );			 
				 
	 ALU: entity work.ALU
	 port map( CLK => CLK,     
           RA => ra_final,      
           RB => mux_value,      
           OPCODE => opcode_final, 
           CCR => ccr,     
           ALU_OUT  => alu_out,
           LDST_OUT => ldst_out
			  );	  
	 
	 PT4: entity work.PT4
	 port map( CLK => CLK,
			ALU_VALUE => alu_out ,
			CCR_VALUE => ccr,
			LDST_VALUE => ldst_out,
			--PT4_EN =>
			
			ALU_SAVED => alu_saved,
			CCR_SAVED => ccr_saved,
			LDST_SAVED => ldst_saved
		  );
		  
	 Data_Memory: entity work. Data_Memory
	 port map(Clock => CLK,
					Enable => dm_en,
					Read => dm_re,
					Write	=> dm_wr,
					Address => ldst_saved, 
					Data_in => alu_saved,
					Data_out => data_out
				 );
	PT5: entity work.PT5
	port map( CLK => CLK,
			ALU_FINAL => alu_saved,
			LDST_DATA => ldst_saved,
			ALU_FIN_SAVE => alu_fin_save,
			LDST_DATA_SAVE => ldst_data_save
		  );
    				 
	DM_MUX2to1: entity work.dm_mux2to1
	port map( SEL => dm_ctrl_sel,
				 ALU_IN => alu_fin_save,
				 DM_IN => ldst_data_save,
				 WB_DATA => wb_data
				 );
	
	a_cpy_addr	<= a_addr;
	CONTROL: entity work.control
	port map( CLK => CLK,
			CTRL_OPCODE => opcode,
			WB_RA => a_cpy_addr, ----WB is write back
			
			Reg_Bank_WE => WR,		--WE is write enable
			Reg_Bank_RE => RE,		--- RE is read enable
			Reg_Bank_EN => en,
			
			DM_WE => dm_wr,		----DM data memory
			DM_RE => dm_re,
			DM_EN => dm_en,		--en is enable
			
			--WB_ADDR => wb_addr, ---may be unnecessary
			IMM_MUX_SEL => ctrl_sel, ---IMM is immediate
			DM_MUX_SEL => dm_ctrl_sel ,
			RESET => reset
			);
			
	Shadow_Reg_Bank: entity work.Shadow_Reg_Bank
	port map(Clock =>CLK,		
	Enable => Shadow_en,	
	Read => Shadow_rd,
	Write => Shadow_wr,
	Read_AddrA => RS_wire,	
	--Write_AddrA => 
	--Data_inA: 	
	
	Data_outA => Shadow_Data); 	
	
	
--	Program_mem_ram: entity work.Program_ROM
--	port map( CLKA => CLK,
--				 ADDRA => instr_adr,
--				 ENA => ena,
--				 DOUTA => doutb );

--	Program_Mem_Rom: entity work.Program_ROM
--	port map( CLK=>CLK,
--				 ADDR=>instr_adr,
--				 DATA=>doutb
--				 );
	
	TOP_AlU_OUT	<= alu_saved;
   TOP_LDST <=ldst_saved;
	TOP_LDST_VALUE <=data_out;
end Structural;


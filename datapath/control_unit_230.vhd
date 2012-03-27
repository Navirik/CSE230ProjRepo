library ieee;
use ieee.std_logic_1164.all;

-- Control Unit for CSCE 230 Project
-- Spring 2012
--
-- Basic idea: set signals based on each stage of instruction execution
--             stage 1 initializes every control signal
--             subsequent stages only change contol signals as needed

entity control_unit_230 is
	port (op_code, cond: in std_logic_vector(3 downto 0);
		  opx: in std_logic_vector(2 downto 0);
		  n, z, v, c, mfc, clock, reset: in std_logic;
		  
		  -- datapath control signals
		  alu_op, c_select, y_select: out std_logic_vector(1 downto 0);
		  rf_write, b_select, b_inv: out std_logic;
		  
		  -- memory interface control signals
		  extend: out std_logic_vector(1 downto 0);
		  ir_enable, ma_select, mem_read, mem_write: out std_logic;
		  
		  -- instruction address control signals
		  pc_select, pc_enable, inc_select: out std_logic);
		  
		  
end control_unit_230;


architecture control_unit_230_arch of control_unit_230 is
	
	signal wmfc: std_logic;
	shared variable stage: integer:= 0;
	
begin
	
	process (clock, reset)
	begin
	
	-- only work on positive clock
	if(rising_edge(clock)) then
	
		if(reset = '1') then
			stage := 0;
		end if;
	
		-- increment stage if not waiting for memory
		if((mfc = '1' or wmfc = '0')) then
			stage := stage mod 5 + 1;
		end if;
		
		-- instruction fetch
		if(stage = 1) then
	
			wmfc <= '1';
			alu_op <= "00";
			c_select <= "01";
			y_select <= "00";
			rf_write <= '0';
			b_select <= '0';
			b_inv <= '0';
			extend <= "00";
			ir_enable <= '1';
			ma_select <= '1';
			mem_read <= '1';
			mem_write <= '0';
			pc_select <= '1';
			pc_enable <= mfc;
			inc_select <= '0';
		
		
		-- source registers
		elsif(stage = 2) then
			
			wmfc <= '0';
			ir_enable <= '0';
			mem_read <= '0';
			pc_enable <= '0';
			
		
		-- alu
		elsif(stage = 3) then
		
			-- R-type instructions
			if(op_code(1 downto 0) = "11") then
		
				-- jr instruction
				if(op_code(3 downto 2) = "10") then
					-- not implemented
					
				-- other r-type instructions
				elsif(op_code(3 downto 2) = "00") then
					
					-- add instruction
					if(opx = "010") then
						alu_op <= "11";
					
					-- sub instruction
					elsif(opx = "000") then
						alu_op <= "11";
						b_inv <= '1';
						
					-- and instruction
					elsif(opx = "110") then
						alu_op <= "01";
						
					-- or instruction
					elsif(opx = "101") then
						alu_op <= "00";
						
					-- xor instruction
					elsif(opx = "100") then
						alu_op <= "10";
						
					end if;
				end if;
			
			
			-- D-type instructions
			elsif(op_code(1 downto 0) = "10") then
				-- none implemented
				
				
			-- B-type instructions
			elsif(op_code(1 downto 0) = "01") then
				-- none implemented
		
		
			-- J-type instructions
			elsif(op_code(1 downto 0) = "00") then
				-- none implemented
				
				
			end if; -- instruction check
		
		
		-- memory access
		elsif(stage = 4) then
		
			-- R-type instructions
			if(op_code(1 downto 0) = "11") then
		
				-- jr instruction
				if(op_code(3 downto 2) = "10") then
					-- not implemented
					
				-- other r-type instructions
				else
					-- no memory read/write needed
					
				end if;
			
			
			-- D-type instructions
			elsif(op_code(1 downto 0) = "10") then
				-- none implemented
				
				
			-- B-type instructions
			elsif(op_code(1 downto 0) = "01") then
				-- none implemented
		
		
			-- J-type instructions
			elsif(op_code(1 downto 0) = "00") then
				-- none implemented
				
				
			end if; -- instruction check
		
		-- destination register
		elsif(stage = 5) then
		
			-- R-type instructions
			if(op_code(1 downto 0) = "11") then
		
				-- jr instruction
				if(op_code(3 downto 2) = "10") then
					-- not implemented
					
				-- other r-type instructions
				else
					rf_write <= '1';
					
				end if;
			
			
			-- D-type instructions
			elsif(op_code(1 downto 0) = "10") then
				-- none implemented
				
				
			-- B-type instructions
			elsif(op_code(1 downto 0) = "01") then
				-- none implemented
		
		
			-- J-type instructions
			elsif(op_code(1 downto 0) = "00") then
				-- none implemented
				
				
			end if; -- instruction check
		
		end if; -- stage
		
		
	end if; -- clock cycle
	end process;
end control_unit_230_arch;
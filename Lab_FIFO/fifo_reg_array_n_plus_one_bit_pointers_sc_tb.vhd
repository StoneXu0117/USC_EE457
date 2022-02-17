------------------------------------------------------------------------------
--
-- Copyright (c) 2010 Gandhi Puvvada, EE-Systems, VSoE, USC
--
-- This design exercise, its solution, and its test-bench are confidential items.
-- They are University of Southern California's (USC's) property. All rights are reserved.
-- Students in our courses have right only to complete the exercise and submit it as part of their course work.
-- They do not have any right on our exercise/solution or even on their completed solution as the solution contains our exercise.
-- Students would be violating copyright laws besides the University's Academic Integrity rules if they post or convey to anyone
-- either our exercise or our solution or their solution. 
-- 
-- THIS COPYRIGHT NOTICE MUST BE RETAINED AS PART OF THIS FILE (AND ITS SOLUTION AND/OR ANY OTHER DERIVED FILE) AT ALL TIMES.
--
------------------------------------------------------------------------------
--
-- A student would be violating the University's Academic Integrity rules if he/she gets help in writing or debugging the code 
-- from anyone other than the help from his/her lab partner or his/her teaching team members in completing the exercise(s). 
-- However he/she can discuss with fellow students the method of solving the exercise. 
-- But writing the code or debugging the code should not be with the help of others. 
-- One should never share the code or even look at the code of others (code from classmates or seniors 
-- or any code or solution posted online or on GitHub).
-- 
-- THIS NOTICE OF ACADEMIC INTEGRITY MUST BE RETAINED AS PART OF THIS FILE (AND ITS SOLUTION AND/OR ANY OTHER DERIVED FILE) AT ALL TIMES.
--
------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- File name: 	: fifo_reg_array_sc_tb.vhd for fifo_reg_array_sc.vhd (sc = single clock)
-- Design       : fifo_reg_array_sc 
-- Project      : FIFO using register array (single clock)
-- Author       : Pritish Malavade and Gandhi Puvvada
-- Company      : University of Southern California 
-- Date			: 6/20/2010
-------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Libraries and use clauses

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use IEEE.STD_LOGIC_SIGNED.ALL;

------------------------------------------------------------------------------
entity fifo_tb is
end fifo_tb;

------------------------------------------------------------------------------

architecture behv_tb of fifo_tb is

-- clock period
	constant clk_period: time := 20 ns;

-- local signals
	
	signal		clk_tb          			: std_logic;	
	signal		reset_tb               		: std_logic;
	signal		data_in_tb             		: std_logic_vector(15 downto 0); 
	signal		wen_tb, ren_tb				: std_logic;
	signal		data_out_tb         		: std_logic_vector(15 downto 0);
	signal		empty_tb	        		: std_logic; 
	signal		full_tb	        			: std_logic;
	signal 		depth_tb					: std_logic_vector(4 downto 0);
 	
-- component declarations
---------------------------------------
component fifo_reg_array_sc is
port ( 
		clk      		: in std_logic;
		reset			: in std_logic;
		data_in   	    : in  std_logic_vector(15 downto 0);
		wen             : in  std_logic;  -- change wenq
		ren             : in  std_logic;  -- change to ren
		data_out    	: out std_logic_vector(15 downto 0);
		depth    		: out std_logic_vector(4 downto 0);
		empty		    : out  std_logic;
		full		    : out  std_logic
	  ); 
end component ;
---------------------------------------
component producer is
port (
		reset			: in    std_logic;
		full 			: in 	std_logic;
		wen				: out 	std_logic;
		data_to_send	: out	std_logic_vector(15 downto 0);
		wclk			: in 	std_logic
	);
end component;
---------------------------------------
component consumer is
port (
		reset	: in    std_logic;
		empty 	: in 	std_logic;
		ren		: out 	std_logic;
		data_to_consume	: in	std_logic_vector(15 downto 0);
		rclk	: in 	std_logic
	);
end component;
---------------------------------------

begin
   
---------------------------------------
  FIFO: fifo_reg_array_sc
	port map(clk_tb, reset_tb, data_in_tb, wen_tb, ren_tb, data_out_tb, depth_tb, empty_tb, full_tb);

  PROD: producer
	port map(reset_tb, full_tb, wen_tb, data_in_tb, clk_tb);
  
  CONS: consumer
	port map(reset_tb, empty_tb, ren_tb, data_out_tb, clk_tb);
	
---------------------------------------	      
	-- wr_clock_generate: process
	-- begin
	  -- wclk_tb <= '0', '1' after (wr_clk_period/2);
	  -- wait for wr_clk_period;
	-- end process wr_clock_generate;
---------------------------------------	      
	clock_generate: process
	begin
	  clk_tb <= '0';
	  wait for clk_period/2;
	  clk_tb <= '1';
	  wait for clk_period/2;
	end process clock_generate;
---------------------------------------		
	reset_tb <= '1', '0' after (2.1)* clk_period;
---------------------------------------	
	
end behv_tb;

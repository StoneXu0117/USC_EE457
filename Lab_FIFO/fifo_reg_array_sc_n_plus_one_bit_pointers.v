//////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2014 Gandhi Puvvada, EE-Systems, VSoE, USC
//
// This design exercise, its solution, and its test-bench are confidential items.
// They are University of Southern California's (USC's) property. All rights are reserved.
// Students in our courses have right only to complete the exercise and submit it as part of their course work.
// They do not have any right on our exercise/solution or even on their completed solution as the solution contains our exercise.
// Students would be violating copyright laws besides the University's Academic Integrity rules if they post or convey to anyone
// either our exercise or our solution or their solution. 
// 
// THIS COPYRIGHT NOTICE MUST BE RETAINED AS PART OF THIS FILE (AND ITS SOLUTION AND/OR ANY OTHER DERIVED FILE) AT ALL TIMES.
//
//////////////////////////////////////////////////////////////////////////////
//
// A student would be violating the University's Academic Integrity rules if he/she gets help in writing or debugging the code 
// from anyone other than the help from his/her lab partner or his/her teaching team members in completing the exercise(s). 
// However he/she can discuss with fellow students the method of solving the exercise. 
// But writing the code or debugging the code should not be with the help of others. 
// One should never share the code or even look at the code of others (code from classmates or seniors 
// or any code or solution posted online or on GitHub).
// 
// THIS NOTICE OF ACADEMIC INTEGRITY MUST BE RETAINED AS PART OF THIS FILE (AND ITS SOLUTION AND/OR ANY OTHER DERIVED FILE) AT ALL TIMES.
//
//////////////////////////////////////////////////////////////////////////////



// File name: 	: fifo_reg_array_sc_n_plus_1_bit_pointers.v (sc = single clock)
// Design       : fifo_reg_array_sc 
// Author       : Gandhi Puvvada
// Date			: 10/26/2014
// Here, we use (n+1) bit pointers.
// Hence signals almost_empty and almost_full are not needed.


//`timescale 1 ns/100 ps

module fifo_reg_array_sc (clk, reset, data_in, wen, ren, data_out, depth, empty, full);

parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 4;

input clk, reset;
input wen, ren; // the read or write request for CPU
input [DATA_WIDTH-1:0] data_in;
output [ADDR_WIDTH:0] depth;
output [DATA_WIDTH-1:0] data_out;
output empty, full;

reg [ADDR_WIDTH:0] rdptr, wrptr; //read pointer and write pointer of FIFO
wire [ADDR_WIDTH:0] depth;
wire wenq, renq;// read and write enable for FIFO
reg full, empty;

reg [DATA_WIDTH-1:0] Reg_Array [(2**ADDR_WIDTH)-1:0];// FIFO array

wire [ADDR_WIDTH:0] N_Plus_1_zeros = {(ADDR_WIDTH+1){1'b0}};
wire [ADDR_WIDTH-1:0] N_zeros = {(ADDR_WIDTH){1'b0}};
wire [ADDR_WIDTH:0] A_1_and_N_zeros = {1'b1, N_zeros}; 

assign depth = wrptr - rdptr;

always@(*)
begin
	empty  = 1'b0;
	full   = 1'b0;
	if (depth == N_Plus_1_zeros)
		empty  = 1'b1;
	if (depth ==  A_1_and_N_zeros) 
		full  = 1'b1;
end

assign wenq = (~full) & wen;// only if the FIFO is not full and there is write request from CPU, we enable the write to FIFO.
assign renq = (~empty)& ren;// only if the FIFO is not empty and there is read request from CPU, we enable the read to FIFO.
assign data_out = Reg_Array[rdptr[ADDR_WIDTH-1:0]]; // we use the lower N bits of the (N+1)-bit pointer as index to the 2**N array.

always@(posedge clk, posedge reset)
begin
    if (reset)
		begin
			wrptr <= N_Plus_1_zeros;
			rdptr <= N_Plus_1_zeros;
		end
	else
		begin
			if (wenq) 
				begin
					Reg_Array[wrptr[ADDR_WIDTH-1:0]] <= data_in;  // we use the lower N bits of the (N+1)-bit pointer as index to the 2**N array.
					wrptr <= wrptr + 1;
				end
			if (renq)
					rdptr <= rdptr + 1;
		end
end

endmodule // fifo_reg_array_sc
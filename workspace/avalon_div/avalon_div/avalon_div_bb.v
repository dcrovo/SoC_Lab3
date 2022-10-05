
module avalon_div (
	clk_clk,
	ledg_export,
	reset_reset_n,
	sseg_export);	

	input		clk_clk;
	output	[7:0]	ledg_export;
	input		reset_reset_n;
	output	[31:0]	sseg_export;
endmodule


module div_sys (
	clk_clk,
	reset_reset_n,
	ledg_export,
	sseg_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	ledg_export;
	output	[31:0]	sseg_export;
endmodule

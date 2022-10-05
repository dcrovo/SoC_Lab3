	component avalon_div is
		port (
			clk_clk       : in  std_logic                     := 'X'; -- clk
			ledg_export   : out std_logic_vector(7 downto 0);         -- export
			reset_reset_n : in  std_logic                     := 'X'; -- reset_n
			sseg_export   : out std_logic_vector(31 downto 0)         -- export
		);
	end component avalon_div;

	u0 : component avalon_div
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			ledg_export   => CONNECTED_TO_ledg_export,   --  ledg.export
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			sseg_export   => CONNECTED_TO_sseg_export    --  sseg.export
		);


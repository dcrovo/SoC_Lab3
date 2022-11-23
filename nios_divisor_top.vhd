LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
------------------------------------------------------------------------------
ENTITY nios_divisor_top IS
	PORT	(
		clk		:	IN		STD_LOGIC;
		ledg		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		hex3		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		hex2		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		hex1		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		hex0		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY;
------------------------------------------------------------------------------

-------------------------------------------------------------------------------
ARCHITECTURE top OF nios_divisor_top IS
	SIGNAL	sseg_sig	:	STD_LOGIC_VECTOR(31 downto 0);

BEGIN
	nios_unit:	entity work.div_sys
	PORT MAP	(	clk_clk			=>	clk,
					ledg_export		=>	ledg,
					sseg_export		=>	sseg_sig,
					reset_reset_n	=>	'1');
					
					hex3	<=	sseg_sig(30	DOWNTO 24);
					hex2	<=	sseg_sig(22	DOWNTO 16);
					hex1	<=	sseg_sig(14	DOWNTO 8);
					hex0	<=	sseg_sig(6	DOWNTO 0);		
END ARCHITECTURE;

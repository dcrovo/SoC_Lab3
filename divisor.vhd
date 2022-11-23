LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-----------------------------------------------------------------------------------------------
ENTITY divisor IS
	GENERIC (	W				:	INTEGER	:=32;
					CBIT			:	INTEGER	:=6); --CBIT=log2(W) +1
	PORT	(		clk			:	IN STD_LOGIC;
					reset			:	IN STD_LOGIC;
					start			:	IN STD_LOGIC;
					dvnd			:	IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					dvsr			:	IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					ready			:	OUT	STD_LOGIC;
					done_tick	:	OUT STD_LOGIC;
					quo			:	OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					rmd			:	OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END ENTITY;
ARCHITECTURE rtl OF divisor IS
	TYPE state IS (idle,op,last,done);
	SIGNAL state_reg, state_next	:	state;
	
	SIGNAL rh_reg, rh_next			:	UNSIGNED(W-1 DOWNTO 0);
	SIGNAL rl_reg, rl_next			:	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	SIGNAL rh_tmp						:	UNSIGNED(W-1 DOWNTO 0);
	signal d_reg, d_next				:	UNSIGNED(W-1 DOWNTO 0);
	signal n_reg, n_next				:	UNSIGNED(CBIT-1 DOWNTO 0);
	signal q_bit						: 	STD_LOGIC;	
BEGIN
	--==========================================================
	--			fsmd state and data registers
	--==========================================================
	
	PROCESS(clk, reset)
	BEGIN
		IF	(reset='1') THEN
			state_reg	<= idle;
			rh_reg		<=	(OTHERS=>'0');
			rl_reg		<=	(OTHERS=>'0');
			d_reg			<=	(OTHERS=>'0');
			n_reg			<=	(OTHERS=>'0');
		ELSIF (rising_edge(clk))	THEN
			state_reg	<= state_next;
			rh_reg		<=	rh_next;
			rl_reg		<=	rl_next;
			d_reg			<=	d_next;
			n_reg			<=	n_next;
		END IF;
	END PROCESS;
	
	--==========================================================
	--			fsmd next'state logic and data path logic
	--==========================================================
	
	
	PROCESS (state_reg, n_reg, rh_reg, rl_reg, d_reg,
				start, dvsr, dvnd, q_bit, rh_tmp, n_next, rl_next)

	BEGIN
		CASE state_reg IS
		--------------------------------------------------------------------------------
			WHEN idle =>
				ready				<= '1';
				done_tick		<= '0';
				IF	(start = '1') THEN
					rh_next		<=	(OTHERS=>'0');
					rl_next		<=	dvnd;
					d_next 		<=	UNSIGNED(dvsr);
					n_next		<= to_unsigned(W+1, CBIT);
					state_next	<=	op;
				ELSE
					rh_next		<=	rh_reg;
					rl_next		<=	rl_next;
					d_next 		<=	d_reg;
					n_next		<= n_reg;
					state_next	<=	state_reg;
				END IF;
			---------------------------------------------------------------------------------
			WHEN OP =>
				ready				<=	'0';
				done_tick		<=	'0';
				d_next			<=	d_reg;
				-- shift th and rl left
				rl_next		<=	rl_reg(W-2 downto 0) & q_bit;
				rh_next		<= rh_tmp(W-2 downto 0) & rl_reg(W-1);
				-- decrease index
				n_next 		<= n_reg - 1;
				IF (n_next = 1) THEN
					state_next <= last;
				ELSE
					state_next <= state_reg;
				END IF;
				
			WHEN last		=>
				ready				<= '0';
				done_tick		<= '0';
				rl_next			<= rl_reg(W-2 downto 0) & q_bit;
				rh_next			<=	rh_tmp;
				d_next			<= d_reg;
				n_next			<= n_reg;
				state_next		<= done;
			-------------------------------------------------------------------------------------
			WHEN done		=>
				ready				<= '0';
				done_tick		<= '1';
				rh_next			<= rh_reg;
				rl_next			<= rl_reg;
				d_next			<= d_reg;
				n_next			<= n_next;
				state_next		<= idle;
			END CASE;
		END PROCESS;
	--==========================================================
	--			compare and substract
	--==========================================================
		PROCESS (rh_reg, d_reg)
		BEGIN
			IF(rh_reg >= d_reg) THEN
				rh_tmp		<= rh_reg - d_reg;
				q_bit			<= '1';
			ELSE
				rh_tmp		<= rh_reg;
				q_bit			<= '0';
			END IF;
		END PROCESS;
	--==========================================================
	--			Output
	--==========================================================
		quo		<= rl_reg;
		rmd		<= std_logic_vector(rh_reg);
END ARCHITECTURE;
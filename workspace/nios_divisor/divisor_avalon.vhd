LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------------------
ENTITY	divisor_avalon IS
	GENERIC	(		W					:	INTEGER	:=32;
						CBIT				:	INTEGER	:=6);	--CBIT = log2(W) +1
	PORT		(		-- TO BE CONNECTED TO AVALON CLOCK INPUT INTERFACE
						clk				:	IN		STD_LOGIC;
						reset				:	IN		STD_LOGIC;
						-- TO BE CONNECTED TO AVALON MM SLAVE INTERFACE
						div_address		:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
						div_chipselect	:	IN		STD_LOGIC;
						div_write		:	IN		STD_LOGIC;
						div_writedata	:	IN		STD_LOGIC_VECTOR(W-1 DOWNTO 0);
						div_readdata	:	OUT	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
						--	TO BE CONNECTED TO AVALON INTERRUPT	SENDER INTERFACE
						div_irq			:	OUT	STD_LOGIC;
						--	TO BE CONNECTED TO AVALON CONDUIT INTERFACE
						DIV_LED			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY divisor_avalon;
ARCHITECTURE avalonMMSlave OF divisor_avalon IS
	CONSTANT	ZEROS				:	STD_LOGIC_VECTOR(W-2 DOWNTO 0):= (OTHERS => '0');
	SIGNAL	div_start		:	STD_LOGIC;
	SIGNAL	div_ready		:	STD_LOGIC;
	SIGNAL	set_done_tick	:	STD_LOGIC;
	SIGNAL	clr_done_tick	:	STD_LOGIC;
	SIGNAL	dvnd_reg			:	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	SIGNAL	dvsr_reg			:	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	SIGNAL	done_tick_reg	:	STD_LOGIC;
	SIGNAL	quo				:	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	SIGNAL	rmd				:	STD_LOGIC_VECTOR(W-1 DOWNTO 0);
	SIGNAL	wr_en				:	STD_LOGIC;
	SIGNAL	wr_dvnd			:	STD_LOGIC;
	SIGNAL	wr_dvsr			:	STD_LOGIC;
BEGIN
	--==========================================================
	--						DIVISOR INSTANTIATION
	--==========================================================
	div_unit:		ENTITY	work.divisor
	GENERIC MAP	(	W				=>	W,
						CBIT			=>	CBIT) --CBIT=log2(W) +1
	PORT MAP		(	clk			=>	clk,
						reset			=>	'0',
						start			=>	div_start,
						dvnd			=>	dvnd_reg,
						dvsr			=>	dvsr_reg,
						ready			=>	div_ready,
						done_tick	=>	set_done_tick,
						quo			=>	quo,
						rmd			=>	rmd);
	--==========================================================
	--								REGISTERS
	--==========================================================
	
	PROCESS(clk, reset)
	BEGIN 
		IF	(reset = '1') THEN
			dvnd_reg				<=	(OTHERS => '0');
			dvnd_reg				<=	(OTHERS => '0');
			done_tick_reg		<= '0';
		ELSIF	(rising_edge(clk)) THEN
			------------------------------------------------------
			IF	(wr_dvnd = '1') THEN
				dvnd_reg			<= div_writedata;
			END IF;
			------------------------------------------------------
			IF(wr_dvsr = '1') THEN
				dvsr_reg			<=	div_writedata;
			END IF;
			------------------------------------------------------
			IF(set_done_tick = '1')	THEN
				done_tick_reg	<=	'1';
			ELSIF	(clr_done_tick	= '1') THEN
				done_tick_reg	<=	'0';
			END IF;
		END IF;
	END PROCESS;
	
	--==========================================================
	--								WRITE DECODING LOGIC
	--==========================================================
	wr_en					<=	'1'		WHEN	(div_write = '1' AND div_chipselect='1')	ELSE '0';
	wr_dvnd				<=	'1'		WHEN	(div_address="000" AND wr_en='1')			ELSE '0';
	wr_dvsr				<=	'1'		WHEN	(div_address="001" AND wr_en='1')			ELSE '0';
	div_start			<=	'1'		WHEN	(div_address="010" AND wr_en='1')			ELSE '0';
	clr_done_tick		<=	'1'		WHEN	(div_address="110" AND wr_en='1')			ELSE '0';
	
	--==========================================================
	--						READ MULTIPLEXING LOGIC assume W=32
	--==========================================================
	
	div_readdata		<=	quo							WHEN	div_address="011"	ELSE
								rmd							WHEN	div_address="100"	ELSE
								ZEROS	&	div_ready		WHEN	div_address="101"	ELSE
								ZEROS	&	done_tick_reg;
								
	--==========================================================
	--								CONDUIT SIGNAL
	--==========================================================
	div_led	<=	rmd(7 downto 0);

	--==========================================================
	--								INTERRUPT REQUEST SIGNAL
	--==========================================================
	
	div_irq <= done_tick_reg;
	
END ARCHITECTURE;

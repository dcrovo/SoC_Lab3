-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"

-- DATE "10/10/2022 21:30:29"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	divisor IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	start : IN std_logic;
	dvnd : IN std_logic_vector(7 DOWNTO 0);
	dvsr : IN std_logic_vector(7 DOWNTO 0);
	ready : BUFFER std_logic;
	done_tick : BUFFER std_logic;
	quo : BUFFER std_logic_vector(7 DOWNTO 0);
	rmd : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END divisor;

-- Design Ports Information
-- ready	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done_tick	=>  Location: PIN_AJ25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[0]	=>  Location: PIN_AJ22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[1]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[2]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[3]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[4]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[5]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[6]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- quo[7]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[0]	=>  Location: PIN_AK23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[1]	=>  Location: PIN_AK24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[2]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[4]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[5]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[6]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rmd[7]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AJ24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[0]	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[1]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[2]	=>  Location: PIN_AK26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[3]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[5]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[6]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvnd[7]	=>  Location: PIN_AK21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[4]	=>  Location: PIN_AK22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[7]	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[6]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[5]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[1]	=>  Location: PIN_AC20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[0]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[3]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dvsr[2]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF divisor IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_dvnd : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dvsr : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ready : std_logic;
SIGNAL ww_done_tick : std_logic;
SIGNAL ww_quo : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_rmd : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \state_next.last~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \state_reg.op~q\ : std_logic;
SIGNAL \state_next.last~1_combout\ : std_logic;
SIGNAL \state_reg.last~q\ : std_logic;
SIGNAL \state_reg.done~q\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \state_reg.idle~q\ : std_logic;
SIGNAL \Selector13~1_combout\ : std_logic;
SIGNAL \dvnd[0]~input_o\ : std_logic;
SIGNAL \dvsr[5]~input_o\ : std_logic;
SIGNAL \d_reg[7]~0_combout\ : std_logic;
SIGNAL \dvsr[4]~input_o\ : std_logic;
SIGNAL \dvsr[3]~input_o\ : std_logic;
SIGNAL \dvsr[2]~input_o\ : std_logic;
SIGNAL \dvsr[1]~input_o\ : std_logic;
SIGNAL \dvsr[0]~input_o\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \dvnd[6]~input_o\ : std_logic;
SIGNAL \dvnd[5]~input_o\ : std_logic;
SIGNAL \dvnd[3]~input_o\ : std_logic;
SIGNAL \dvnd[2]~input_o\ : std_logic;
SIGNAL \dvnd[1]~input_o\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \dvnd[4]~input_o\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \dvnd[7]~input_o\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Selector9~1_combout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \rh_reg[0]~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \dvsr[6]~input_o\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \dvsr[7]~input_o\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL n_next : std_logic_vector(3 DOWNTO 0);
SIGNAL rl_next : std_logic_vector(7 DOWNTO 0);
SIGNAL rl_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL d_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL rh_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL n_reg : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_dvnd[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dvnd[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_start~input_o\ : std_logic;
SIGNAL ALT_INV_n_next : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_rl_next : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Selector4~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector5~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL ALT_INV_n_reg : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector23~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector22~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector21~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector20~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector19~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector18~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector17~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector13~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \ALT_INV_state_next.last~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \ALT_INV_rh_reg[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_state_reg.op~q\ : std_logic;
SIGNAL \ALT_INV_LessThan0~6_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL ALT_INV_d_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_state_reg.last~q\ : std_logic;
SIGNAL ALT_INV_rh_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_rl_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_state_reg.done~q\ : std_logic;
SIGNAL \ALT_INV_state_reg.idle~q\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_start <= start;
ww_dvnd <= dvnd;
ww_dvsr <= dvsr;
ready <= ww_ready;
done_tick <= ww_done_tick;
quo <= ww_quo;
rmd <= ww_rmd;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_dvnd[7]~input_o\ <= NOT \dvnd[7]~input_o\;
\ALT_INV_dvnd[6]~input_o\ <= NOT \dvnd[6]~input_o\;
\ALT_INV_dvnd[5]~input_o\ <= NOT \dvnd[5]~input_o\;
\ALT_INV_dvnd[4]~input_o\ <= NOT \dvnd[4]~input_o\;
\ALT_INV_dvnd[3]~input_o\ <= NOT \dvnd[3]~input_o\;
\ALT_INV_dvnd[2]~input_o\ <= NOT \dvnd[2]~input_o\;
\ALT_INV_dvnd[1]~input_o\ <= NOT \dvnd[1]~input_o\;
\ALT_INV_dvnd[0]~input_o\ <= NOT \dvnd[0]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_start~input_o\ <= NOT \start~input_o\;
ALT_INV_n_next(2) <= NOT n_next(2);
ALT_INV_n_next(3) <= NOT n_next(3);
ALT_INV_n_next(0) <= NOT n_next(0);
ALT_INV_n_next(1) <= NOT n_next(1);
ALT_INV_rl_next(7) <= NOT rl_next(7);
ALT_INV_rl_next(6) <= NOT rl_next(6);
ALT_INV_rl_next(5) <= NOT rl_next(5);
ALT_INV_rl_next(4) <= NOT rl_next(4);
ALT_INV_rl_next(3) <= NOT rl_next(3);
ALT_INV_rl_next(2) <= NOT rl_next(2);
ALT_INV_rl_next(1) <= NOT rl_next(1);
ALT_INV_rl_next(0) <= NOT rl_next(0);
\ALT_INV_Selector4~1_combout\ <= NOT \Selector4~1_combout\;
\ALT_INV_Selector5~1_combout\ <= NOT \Selector5~1_combout\;
\ALT_INV_Selector6~1_combout\ <= NOT \Selector6~1_combout\;
\ALT_INV_Selector1~0_combout\ <= NOT \Selector1~0_combout\;
\ALT_INV_Selector0~0_combout\ <= NOT \Selector0~0_combout\;
\ALT_INV_Add0~0_combout\ <= NOT \Add0~0_combout\;
ALT_INV_n_reg(2) <= NOT n_reg(2);
ALT_INV_n_reg(3) <= NOT n_reg(3);
\ALT_INV_Selector12~0_combout\ <= NOT \Selector12~0_combout\;
\ALT_INV_Selector11~0_combout\ <= NOT \Selector11~0_combout\;
ALT_INV_n_reg(0) <= NOT n_reg(0);
ALT_INV_n_reg(1) <= NOT n_reg(1);
\ALT_INV_Selector23~0_combout\ <= NOT \Selector23~0_combout\;
\ALT_INV_Selector22~0_combout\ <= NOT \Selector22~0_combout\;
\ALT_INV_Selector21~0_combout\ <= NOT \Selector21~0_combout\;
\ALT_INV_Selector20~0_combout\ <= NOT \Selector20~0_combout\;
\ALT_INV_Selector19~0_combout\ <= NOT \Selector19~0_combout\;
\ALT_INV_Selector18~0_combout\ <= NOT \Selector18~0_combout\;
\ALT_INV_Selector17~0_combout\ <= NOT \Selector17~0_combout\;
\ALT_INV_Selector13~1_combout\ <= NOT \Selector13~1_combout\;
\ALT_INV_Selector15~0_combout\ <= NOT \Selector15~0_combout\;
\ALT_INV_state_next.last~0_combout\ <= NOT \state_next.last~0_combout\;
\ALT_INV_Selector3~1_combout\ <= NOT \Selector3~1_combout\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
\ALT_INV_Selector7~0_combout\ <= NOT \Selector7~0_combout\;
\ALT_INV_Selector8~0_combout\ <= NOT \Selector8~0_combout\;
\ALT_INV_Selector9~0_combout\ <= NOT \Selector9~0_combout\;
\ALT_INV_rh_reg[0]~0_combout\ <= NOT \rh_reg[0]~0_combout\;
\ALT_INV_state_reg.op~q\ <= NOT \state_reg.op~q\;
\ALT_INV_LessThan0~6_combout\ <= NOT \LessThan0~6_combout\;
\ALT_INV_LessThan0~5_combout\ <= NOT \LessThan0~5_combout\;
\ALT_INV_LessThan0~4_combout\ <= NOT \LessThan0~4_combout\;
\ALT_INV_LessThan0~3_combout\ <= NOT \LessThan0~3_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;
ALT_INV_d_reg(2) <= NOT d_reg(2);
ALT_INV_d_reg(3) <= NOT d_reg(3);
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
ALT_INV_d_reg(0) <= NOT d_reg(0);
ALT_INV_d_reg(1) <= NOT d_reg(1);
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
ALT_INV_d_reg(5) <= NOT d_reg(5);
ALT_INV_d_reg(6) <= NOT d_reg(6);
ALT_INV_d_reg(7) <= NOT d_reg(7);
ALT_INV_d_reg(4) <= NOT d_reg(4);
\ALT_INV_state_reg.last~q\ <= NOT \state_reg.last~q\;
ALT_INV_rh_reg(7) <= NOT rh_reg(7);
ALT_INV_rh_reg(6) <= NOT rh_reg(6);
ALT_INV_rh_reg(5) <= NOT rh_reg(5);
ALT_INV_rh_reg(4) <= NOT rh_reg(4);
ALT_INV_rh_reg(3) <= NOT rh_reg(3);
ALT_INV_rh_reg(2) <= NOT rh_reg(2);
ALT_INV_rh_reg(1) <= NOT rh_reg(1);
ALT_INV_rh_reg(0) <= NOT rh_reg(0);
ALT_INV_rl_reg(7) <= NOT rl_reg(7);
ALT_INV_rl_reg(6) <= NOT rl_reg(6);
ALT_INV_rl_reg(5) <= NOT rl_reg(5);
ALT_INV_rl_reg(4) <= NOT rl_reg(4);
ALT_INV_rl_reg(3) <= NOT rl_reg(3);
ALT_INV_rl_reg(2) <= NOT rl_reg(2);
ALT_INV_rl_reg(1) <= NOT rl_reg(1);
ALT_INV_rl_reg(0) <= NOT rl_reg(0);
\ALT_INV_state_reg.done~q\ <= NOT \state_reg.done~q\;
\ALT_INV_state_reg.idle~q\ <= NOT \state_reg.idle~q\;
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;

-- Location: IOOBUF_X74_Y0_N42
\ready~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state_reg.idle~q\,
	devoe => ww_devoe,
	o => ww_ready);

-- Location: IOOBUF_X74_Y0_N93
\done_tick~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \state_reg.done~q\,
	devoe => ww_devoe,
	o => ww_done_tick);

-- Location: IOOBUF_X70_Y0_N53
\quo[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(0),
	devoe => ww_devoe,
	o => ww_quo(0));

-- Location: IOOBUF_X68_Y0_N19
\quo[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(1),
	devoe => ww_devoe,
	o => ww_quo(1));

-- Location: IOOBUF_X70_Y0_N19
\quo[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(2),
	devoe => ww_devoe,
	o => ww_quo(2));

-- Location: IOOBUF_X64_Y0_N19
\quo[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(3),
	devoe => ww_devoe,
	o => ww_quo(3));

-- Location: IOOBUF_X66_Y0_N42
\quo[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(4),
	devoe => ww_devoe,
	o => ww_quo(4));

-- Location: IOOBUF_X70_Y0_N36
\quo[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(5),
	devoe => ww_devoe,
	o => ww_quo(5));

-- Location: IOOBUF_X70_Y0_N2
\quo[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(6),
	devoe => ww_devoe,
	o => ww_quo(6));

-- Location: IOOBUF_X89_Y4_N62
\quo[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rl_reg(7),
	devoe => ww_devoe,
	o => ww_quo(7));

-- Location: IOOBUF_X72_Y0_N36
\rmd[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(0),
	devoe => ww_devoe,
	o => ww_rmd(0));

-- Location: IOOBUF_X72_Y0_N53
\rmd[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(1),
	devoe => ww_devoe,
	o => ww_rmd(1));

-- Location: IOOBUF_X76_Y0_N19
\rmd[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(2),
	devoe => ww_devoe,
	o => ww_rmd(2));

-- Location: IOOBUF_X89_Y4_N79
\rmd[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(3),
	devoe => ww_devoe,
	o => ww_rmd(3));

-- Location: IOOBUF_X74_Y0_N59
\rmd[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(4),
	devoe => ww_devoe,
	o => ww_rmd(4));

-- Location: IOOBUF_X80_Y0_N2
\rmd[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(5),
	devoe => ww_devoe,
	o => ww_rmd(5));

-- Location: IOOBUF_X80_Y0_N36
\rmd[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(6),
	devoe => ww_devoe,
	o => ww_rmd(6));

-- Location: IOOBUF_X89_Y4_N45
\rmd[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rh_reg(7),
	devoe => ww_devoe,
	o => ww_rmd(7));

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X72_Y0_N1
\start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LABCELL_X73_Y2_N42
\Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = ( \state_reg.idle~q\ & ( !n_reg(0) $ (!\state_reg.op~q\) ) ) # ( !\state_reg.idle~q\ & ( (!n_reg(0) $ (!\state_reg.op~q\)) # (\start~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101011111111010110100101101001011010111111110101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n_reg(0),
	datac => \ALT_INV_state_reg.op~q\,
	datad => \ALT_INV_start~input_o\,
	datae => \ALT_INV_state_reg.idle~q\,
	combout => \Selector12~0_combout\);

-- Location: LABCELL_X73_Y2_N15
\n_next[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- n_next(0) = ( \Selector12~0_combout\ & ( (!\state_reg.done~q\) # (n_next(0)) ) ) # ( !\Selector12~0_combout\ & ( (n_next(0) & \state_reg.done~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_n_next(0),
	datad => \ALT_INV_state_reg.done~q\,
	dataf => \ALT_INV_Selector12~0_combout\,
	combout => n_next(0));

-- Location: IOIBUF_X74_Y0_N75
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X73_Y2_N23
\n_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => n_next(0),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(0));

-- Location: FF_X73_Y2_N11
\n_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => n_next(1),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(1));

-- Location: LABCELL_X73_Y2_N33
\Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = ( \start~input_o\ & ( (\state_reg.idle~q\ & (!n_reg(1) $ (((!\state_reg.op~q\) # (n_reg(0)))))) ) ) # ( !\start~input_o\ & ( !n_reg(1) $ (((!\state_reg.op~q\) # (n_reg(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111110100101000011111010010100000011001000010000001100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n_reg(0),
	datab => \ALT_INV_state_reg.idle~q\,
	datac => ALT_INV_n_reg(1),
	datad => \ALT_INV_state_reg.op~q\,
	dataf => \ALT_INV_start~input_o\,
	combout => \Selector11~0_combout\);

-- Location: LABCELL_X73_Y2_N51
\n_next[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- n_next(1) = ( \Selector11~0_combout\ & ( (!\state_reg.done~q\) # (n_next(1)) ) ) # ( !\Selector11~0_combout\ & ( (\state_reg.done~q\ & n_next(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.done~q\,
	datad => ALT_INV_n_next(1),
	dataf => \ALT_INV_Selector11~0_combout\,
	combout => n_next(1));

-- Location: FF_X73_Y2_N5
\n_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => n_next(3),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(3));

-- Location: LABCELL_X73_Y2_N6
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( n_reg(0) & ( \start~input_o\ & ( (n_reg(2) & \state_reg.idle~q\) ) ) ) # ( !n_reg(0) & ( \start~input_o\ & ( (\state_reg.idle~q\ & (!n_reg(2) $ (((!\state_reg.op~q\) # (n_reg(1)))))) ) ) ) # ( n_reg(0) & ( !\start~input_o\ & ( 
-- n_reg(2) ) ) ) # ( !n_reg(0) & ( !\start~input_o\ & ( !n_reg(2) $ (((!\state_reg.op~q\) # (n_reg(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101100101011001010101010101010100000000010110010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n_reg(2),
	datab => ALT_INV_n_reg(1),
	datac => \ALT_INV_state_reg.op~q\,
	datad => \ALT_INV_state_reg.idle~q\,
	datae => ALT_INV_n_reg(0),
	dataf => \ALT_INV_start~input_o\,
	combout => \Selector1~0_combout\);

-- Location: LABCELL_X73_Y2_N0
\n_next[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- n_next(2) = ( n_next(2) & ( \Selector1~0_combout\ ) ) # ( !n_next(2) & ( \Selector1~0_combout\ & ( !\state_reg.done~q\ ) ) ) # ( n_next(2) & ( !\Selector1~0_combout\ & ( \state_reg.done~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_state_reg.done~q\,
	datae => ALT_INV_n_next(2),
	dataf => \ALT_INV_Selector1~0_combout\,
	combout => n_next(2));

-- Location: FF_X73_Y2_N26
\n_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => n_next(2),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(2));

-- Location: LABCELL_X73_Y2_N48
\Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = ( !n_reg(1) & ( (!n_reg(2) & !n_reg(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_n_reg(2),
	datad => ALT_INV_n_reg(0),
	dataf => ALT_INV_n_reg(1),
	combout => \Add0~0_combout\);

-- Location: LABCELL_X73_Y2_N12
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \Add0~0_combout\ & ( (!\state_reg.idle~q\ & ((!n_reg(3) $ (!\state_reg.op~q\)) # (\start~input_o\))) # (\state_reg.idle~q\ & (!n_reg(3) $ ((!\state_reg.op~q\)))) ) ) # ( !\Add0~0_combout\ & ( ((!\state_reg.idle~q\ & 
-- \start~input_o\)) # (n_reg(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111011101010101011101110101011010110111100101101011011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n_reg(3),
	datab => \ALT_INV_state_reg.idle~q\,
	datac => \ALT_INV_state_reg.op~q\,
	datad => \ALT_INV_start~input_o\,
	dataf => \ALT_INV_Add0~0_combout\,
	combout => \Selector0~0_combout\);

-- Location: LABCELL_X73_Y2_N27
\n_next[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- n_next(3) = ( n_next(3) & ( \Selector0~0_combout\ ) ) # ( !n_next(3) & ( \Selector0~0_combout\ & ( !\state_reg.done~q\ ) ) ) # ( n_next(3) & ( !\Selector0~0_combout\ & ( \state_reg.done~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111111111111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_state_reg.done~q\,
	datae => ALT_INV_n_next(3),
	dataf => \ALT_INV_Selector0~0_combout\,
	combout => n_next(3));

-- Location: LABCELL_X73_Y2_N21
\state_next.last~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state_next.last~0_combout\ = ( n_next(0) & ( !n_next(2) & ( (!n_next(1) & !n_next(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n_next(1),
	datab => ALT_INV_n_next(3),
	datae => ALT_INV_n_next(0),
	dataf => ALT_INV_n_next(2),
	combout => \state_next.last~0_combout\);

-- Location: LABCELL_X73_Y2_N54
\Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = ( \start~input_o\ & ( (!\state_reg.idle~q\) # ((!\state_next.last~0_combout\ & \state_reg.op~q\)) ) ) # ( !\start~input_o\ & ( (!\state_next.last~0_combout\ & \state_reg.op~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000010101010111110101010101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.idle~q\,
	datac => \ALT_INV_state_next.last~0_combout\,
	datad => \ALT_INV_state_reg.op~q\,
	dataf => \ALT_INV_start~input_o\,
	combout => \Selector14~0_combout\);

-- Location: FF_X73_Y2_N56
\state_reg.op\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector14~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_reg.op~q\);

-- Location: MLABCELL_X72_Y4_N27
\state_next.last~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \state_next.last~1_combout\ = ( \state_next.last~0_combout\ & ( \state_reg.op~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_state_reg.op~q\,
	dataf => \ALT_INV_state_next.last~0_combout\,
	combout => \state_next.last~1_combout\);

-- Location: FF_X72_Y4_N29
\state_reg.last\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \state_next.last~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_reg.last~q\);

-- Location: FF_X73_Y2_N20
\state_reg.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \state_reg.last~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_reg.done~q\);

-- Location: LABCELL_X73_Y2_N57
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( !\state_reg.done~q\ & ( (\state_reg.idle~q\) # (\start~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_start~input_o\,
	datad => \ALT_INV_state_reg.idle~q\,
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector13~0_combout\);

-- Location: FF_X73_Y2_N47
\state_reg.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector13~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_reg.idle~q\);

-- Location: MLABCELL_X72_Y4_N48
\Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~1_combout\ = ( \state_reg.idle~q\ ) # ( !\state_reg.idle~q\ & ( \start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_start~input_o\,
	dataf => \ALT_INV_state_reg.idle~q\,
	combout => \Selector13~1_combout\);

-- Location: IOIBUF_X76_Y0_N35
\dvnd[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(0),
	o => \dvnd[0]~input_o\);

-- Location: IOIBUF_X78_Y0_N35
\dvsr[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(5),
	o => \dvsr[5]~input_o\);

-- Location: LABCELL_X73_Y4_N45
\d_reg[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_reg[7]~0_combout\ = ( \start~input_o\ & ( !\state_reg.idle~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.idle~q\,
	dataf => \ALT_INV_start~input_o\,
	combout => \d_reg[7]~0_combout\);

-- Location: FF_X73_Y4_N56
\d_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(5));

-- Location: IOIBUF_X68_Y0_N52
\dvsr[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(4),
	o => \dvsr[4]~input_o\);

-- Location: FF_X73_Y4_N44
\d_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(4));

-- Location: IOIBUF_X78_Y0_N1
\dvsr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(3),
	o => \dvsr[3]~input_o\);

-- Location: FF_X73_Y4_N29
\d_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(3));

-- Location: IOIBUF_X80_Y0_N18
\dvsr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(2),
	o => \dvsr[2]~input_o\);

-- Location: FF_X73_Y4_N35
\d_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(2));

-- Location: IOIBUF_X76_Y0_N1
\dvsr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(1),
	o => \dvsr[1]~input_o\);

-- Location: FF_X73_Y4_N53
\d_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(1));

-- Location: IOIBUF_X78_Y0_N52
\dvsr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(0),
	o => \dvsr[0]~input_o\);

-- Location: FF_X73_Y4_N47
\d_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(0));

-- Location: LABCELL_X73_Y4_N0
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !rh_reg(0) $ (!d_reg(0)) ) + ( !VCC ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !rh_reg(0) $ (!d_reg(0)) ) + ( !VCC ) + ( !VCC ))
-- \Add1~3\ = SHARE((!d_reg(0)) # (rh_reg(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_rh_reg(0),
	datad => ALT_INV_d_reg(0),
	cin => GND,
	sharein => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\,
	shareout => \Add1~3\);

-- Location: IOIBUF_X72_Y0_N18
\dvnd[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(6),
	o => \dvnd[6]~input_o\);

-- Location: IOIBUF_X68_Y0_N1
\dvnd[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(5),
	o => \dvnd[5]~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\dvnd[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(3),
	o => \dvnd[3]~input_o\);

-- Location: IOIBUF_X76_Y0_N52
\dvnd[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(2),
	o => \dvnd[2]~input_o\);

-- Location: IOIBUF_X66_Y0_N92
\dvnd[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(1),
	o => \dvnd[1]~input_o\);

-- Location: LABCELL_X71_Y4_N3
\Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = ( rl_reg(0) & ( \state_reg.op~q\ & ( (!\state_reg.done~q\) # (rl_reg(1)) ) ) ) # ( !rl_reg(0) & ( \state_reg.op~q\ & ( (rl_reg(1) & \state_reg.done~q\) ) ) ) # ( rl_reg(0) & ( !\state_reg.op~q\ & ( (!\state_reg.done~q\ & 
-- (((\state_reg.last~q\) # (\dvnd[1]~input_o\)))) # (\state_reg.done~q\ & (rl_reg(1))) ) ) ) # ( !rl_reg(0) & ( !\state_reg.op~q\ & ( (!\state_reg.done~q\ & (((\dvnd[1]~input_o\ & !\state_reg.last~q\)))) # (\state_reg.done~q\ & (rl_reg(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100010001000111011101110100010001000100011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rl_reg(1),
	datab => \ALT_INV_state_reg.done~q\,
	datac => \ALT_INV_dvnd[1]~input_o\,
	datad => \ALT_INV_state_reg.last~q\,
	datae => ALT_INV_rl_reg(0),
	dataf => \ALT_INV_state_reg.op~q\,
	combout => \Selector17~0_combout\);

-- Location: MLABCELL_X72_Y4_N51
\rl_next[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(1) = ( rl_next(1) & ( (!\Selector13~1_combout\) # (\Selector17~0_combout\) ) ) # ( !rl_next(1) & ( (\Selector13~1_combout\ & \Selector17~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector13~1_combout\,
	datac => \ALT_INV_Selector17~0_combout\,
	dataf => ALT_INV_rl_next(1),
	combout => rl_next(1));

-- Location: FF_X72_Y4_N11
\rl_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rl_next(1),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(1));

-- Location: LABCELL_X73_Y2_N36
\Selector18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = ( rl_reg(1) & ( \state_reg.last~q\ & ( (!\state_reg.done~q\) # (rl_reg(2)) ) ) ) # ( !rl_reg(1) & ( \state_reg.last~q\ & ( (\state_reg.done~q\ & rl_reg(2)) ) ) ) # ( rl_reg(1) & ( !\state_reg.last~q\ & ( (!\state_reg.done~q\ & 
-- (((\state_reg.op~q\)) # (\dvnd[2]~input_o\))) # (\state_reg.done~q\ & (((rl_reg(2))))) ) ) ) # ( !rl_reg(1) & ( !\state_reg.last~q\ & ( (!\state_reg.done~q\ & (\dvnd[2]~input_o\ & (!\state_reg.op~q\))) # (\state_reg.done~q\ & (((rl_reg(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001110011010011000111111100000000001100111100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dvnd[2]~input_o\,
	datab => \ALT_INV_state_reg.done~q\,
	datac => \ALT_INV_state_reg.op~q\,
	datad => ALT_INV_rl_reg(2),
	datae => ALT_INV_rl_reg(1),
	dataf => \ALT_INV_state_reg.last~q\,
	combout => \Selector18~0_combout\);

-- Location: LABCELL_X73_Y2_N30
\rl_next[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(2) = ( \Selector18~0_combout\ & ( (\Selector13~1_combout\) # (rl_next(2)) ) ) # ( !\Selector18~0_combout\ & ( (rl_next(2) & !\Selector13~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_rl_next(2),
	datad => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector18~0_combout\,
	combout => rl_next(2));

-- Location: FF_X73_Y2_N32
\rl_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => rl_next(2),
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(2));

-- Location: MLABCELL_X72_Y4_N39
\Selector19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = ( rl_reg(2) & ( \state_reg.done~q\ & ( rl_reg(3) ) ) ) # ( !rl_reg(2) & ( \state_reg.done~q\ & ( rl_reg(3) ) ) ) # ( rl_reg(2) & ( !\state_reg.done~q\ & ( ((\state_reg.op~q\) # (\state_reg.last~q\)) # (\dvnd[3]~input_o\) ) ) ) # ( 
-- !rl_reg(2) & ( !\state_reg.done~q\ & ( (\dvnd[3]~input_o\ & (!\state_reg.last~q\ & !\state_reg.op~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000011111110111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dvnd[3]~input_o\,
	datab => \ALT_INV_state_reg.last~q\,
	datac => \ALT_INV_state_reg.op~q\,
	datad => ALT_INV_rl_reg(3),
	datae => ALT_INV_rl_reg(2),
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector19~0_combout\);

-- Location: MLABCELL_X72_Y4_N54
\rl_next[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(3) = ( \Selector19~0_combout\ & ( (rl_next(3)) # (\Selector13~1_combout\) ) ) # ( !\Selector19~0_combout\ & ( (!\Selector13~1_combout\ & rl_next(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector13~1_combout\,
	datad => ALT_INV_rl_next(3),
	dataf => \ALT_INV_Selector19~0_combout\,
	combout => rl_next(3));

-- Location: FF_X72_Y4_N56
\rl_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => rl_next(3),
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(3));

-- Location: IOIBUF_X66_Y0_N58
\dvnd[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(4),
	o => \dvnd[4]~input_o\);

-- Location: MLABCELL_X72_Y4_N6
\Selector20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = ( rl_reg(4) & ( \state_reg.op~q\ & ( (\state_reg.done~q\) # (rl_reg(3)) ) ) ) # ( !rl_reg(4) & ( \state_reg.op~q\ & ( (rl_reg(3) & !\state_reg.done~q\) ) ) ) # ( rl_reg(4) & ( !\state_reg.op~q\ & ( ((!\state_reg.last~q\ & 
-- ((\dvnd[4]~input_o\))) # (\state_reg.last~q\ & (rl_reg(3)))) # (\state_reg.done~q\) ) ) ) # ( !rl_reg(4) & ( !\state_reg.op~q\ & ( (!\state_reg.done~q\ & ((!\state_reg.last~q\ & ((\dvnd[4]~input_o\))) # (\state_reg.last~q\ & (rl_reg(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001000100001111110111011101000100010001000111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rl_reg(3),
	datab => \ALT_INV_state_reg.done~q\,
	datac => \ALT_INV_dvnd[4]~input_o\,
	datad => \ALT_INV_state_reg.last~q\,
	datae => ALT_INV_rl_reg(4),
	dataf => \ALT_INV_state_reg.op~q\,
	combout => \Selector20~0_combout\);

-- Location: MLABCELL_X72_Y4_N24
\rl_next[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(4) = ( \Selector20~0_combout\ & ( (\Selector13~1_combout\) # (rl_next(4)) ) ) # ( !\Selector20~0_combout\ & ( (rl_next(4) & !\Selector13~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rl_next(4),
	datac => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector20~0_combout\,
	combout => rl_next(4));

-- Location: FF_X72_Y4_N8
\rl_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rl_next(4),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(4));

-- Location: LABCELL_X71_Y4_N21
\Selector21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = ( \state_reg.op~q\ & ( \state_reg.done~q\ & ( rl_reg(5) ) ) ) # ( !\state_reg.op~q\ & ( \state_reg.done~q\ & ( rl_reg(5) ) ) ) # ( \state_reg.op~q\ & ( !\state_reg.done~q\ & ( rl_reg(4) ) ) ) # ( !\state_reg.op~q\ & ( 
-- !\state_reg.done~q\ & ( (!\state_reg.last~q\ & (\dvnd[5]~input_o\)) # (\state_reg.last~q\ & ((rl_reg(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100110011001100110011001100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dvnd[5]~input_o\,
	datab => ALT_INV_rl_reg(4),
	datac => ALT_INV_rl_reg(5),
	datad => \ALT_INV_state_reg.last~q\,
	datae => \ALT_INV_state_reg.op~q\,
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector21~0_combout\);

-- Location: LABCELL_X71_Y4_N48
\rl_next[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(5) = ( \Selector13~1_combout\ & ( \Selector21~0_combout\ ) ) # ( !\Selector13~1_combout\ & ( \Selector21~0_combout\ & ( rl_next(5) ) ) ) # ( !\Selector13~1_combout\ & ( !\Selector21~0_combout\ & ( rl_next(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_rl_next(5),
	datae => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector21~0_combout\,
	combout => rl_next(5));

-- Location: FF_X71_Y4_N50
\rl_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => rl_next(5),
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(5));

-- Location: MLABCELL_X72_Y3_N45
\Selector22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = ( \state_reg.last~q\ & ( \state_reg.done~q\ & ( rl_reg(6) ) ) ) # ( !\state_reg.last~q\ & ( \state_reg.done~q\ & ( rl_reg(6) ) ) ) # ( \state_reg.last~q\ & ( !\state_reg.done~q\ & ( rl_reg(5) ) ) ) # ( !\state_reg.last~q\ & ( 
-- !\state_reg.done~q\ & ( (!\state_reg.op~q\ & (\dvnd[6]~input_o\)) # (\state_reg.op~q\ & ((rl_reg(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111000011110000111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dvnd[6]~input_o\,
	datab => ALT_INV_rl_reg(6),
	datac => ALT_INV_rl_reg(5),
	datad => \ALT_INV_state_reg.op~q\,
	datae => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector22~0_combout\);

-- Location: MLABCELL_X72_Y3_N3
\rl_next[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(6) = ( \Selector13~1_combout\ & ( \Selector22~0_combout\ ) ) # ( !\Selector13~1_combout\ & ( \Selector22~0_combout\ & ( rl_next(6) ) ) ) # ( !\Selector13~1_combout\ & ( !\Selector22~0_combout\ & ( rl_next(6) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_rl_next(6),
	datae => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector22~0_combout\,
	combout => rl_next(6));

-- Location: FF_X72_Y3_N5
\rl_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => rl_next(6),
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(6));

-- Location: IOIBUF_X68_Y0_N35
\dvnd[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvnd(7),
	o => \dvnd[7]~input_o\);

-- Location: LABCELL_X71_Y4_N24
\Selector23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = ( \state_reg.op~q\ & ( \state_reg.done~q\ & ( rl_reg(7) ) ) ) # ( !\state_reg.op~q\ & ( \state_reg.done~q\ & ( rl_reg(7) ) ) ) # ( \state_reg.op~q\ & ( !\state_reg.done~q\ & ( rl_reg(6) ) ) ) # ( !\state_reg.op~q\ & ( 
-- !\state_reg.done~q\ & ( (!\state_reg.last~q\ & ((\dvnd[7]~input_o\))) # (\state_reg.last~q\ & (rl_reg(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000011110000111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.last~q\,
	datab => ALT_INV_rl_reg(7),
	datac => ALT_INV_rl_reg(6),
	datad => \ALT_INV_dvnd[7]~input_o\,
	datae => \ALT_INV_state_reg.op~q\,
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector23~0_combout\);

-- Location: LABCELL_X71_Y4_N54
\rl_next[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(7) = ( \Selector13~1_combout\ & ( \Selector23~0_combout\ ) ) # ( !\Selector13~1_combout\ & ( \Selector23~0_combout\ & ( rl_next(7) ) ) ) # ( !\Selector13~1_combout\ & ( !\Selector23~0_combout\ & ( rl_next(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_rl_next(7),
	datae => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector23~0_combout\,
	combout => rl_next(7));

-- Location: FF_X71_Y4_N56
\rl_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => rl_next(7),
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(7));

-- Location: LABCELL_X73_Y4_N36
\Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = ( !\state_reg.last~q\ & ( (((\state_reg.op~q\ & ((rl_reg(7)))))) ) ) # ( \state_reg.last~q\ & ( (!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & (\Add1~1_sumout\)) # (\LessThan0~6_combout\ & (((rh_reg(0))))))) # 
-- (\LessThan0~4_combout\ & (((rh_reg(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000000010001110000111100001111000011110100011100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_LessThan0~4_combout\,
	datac => ALT_INV_rh_reg(0),
	datad => \ALT_INV_LessThan0~6_combout\,
	datae => \ALT_INV_state_reg.last~q\,
	dataf => ALT_INV_rl_reg(7),
	datag => \ALT_INV_state_reg.op~q\,
	combout => \Selector10~0_combout\);

-- Location: FF_X73_Y4_N38
\rh_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector10~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(0));

-- Location: LABCELL_X73_Y4_N3
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !d_reg(1) $ (rh_reg(1)) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( !d_reg(1) $ (rh_reg(1)) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~7\ = SHARE((!d_reg(1) & rh_reg(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001010101000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(1),
	datad => ALT_INV_rh_reg(1),
	cin => \Add1~2\,
	sharein => \Add1~3\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\,
	shareout => \Add1~7\);

-- Location: MLABCELL_X72_Y4_N0
\Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = ( \Add1~1_sumout\ & ( (!\state_reg.last~q\) # (\Add1~5_sumout\) ) ) # ( !\Add1~1_sumout\ & ( (\Add1~5_sumout\ & \state_reg.last~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~5_sumout\,
	datad => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \Selector9~0_combout\);

-- Location: MLABCELL_X72_Y4_N12
\Selector9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~1_combout\ = ( !\state_reg.last~q\ & ( (\state_reg.op~q\ & ((!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & (\Selector9~0_combout\)) # (\LessThan0~6_combout\ & ((rh_reg(0)))))) # (\LessThan0~4_combout\ & (((rh_reg(0))))))) ) ) # ( 
-- \state_reg.last~q\ & ( (!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & (\Selector9~0_combout\)) # (\LessThan0~6_combout\ & (((rh_reg(1))))))) # (\LessThan0~4_combout\ & (((rh_reg(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000010000000000010001110000111100000111000011110100011100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector9~0_combout\,
	datab => \ALT_INV_LessThan0~4_combout\,
	datac => ALT_INV_rh_reg(1),
	datad => \ALT_INV_LessThan0~6_combout\,
	datae => \ALT_INV_state_reg.last~q\,
	dataf => ALT_INV_rh_reg(0),
	datag => \ALT_INV_state_reg.op~q\,
	combout => \Selector9~1_combout\);

-- Location: FF_X72_Y4_N14
\rh_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(1));

-- Location: LABCELL_X73_Y4_N6
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !d_reg(2) $ (rh_reg(2)) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !d_reg(2) $ (rh_reg(2)) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~11\ = SHARE((!d_reg(2) & rh_reg(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_d_reg(2),
	datad => ALT_INV_rh_reg(2),
	cin => \Add1~6\,
	sharein => \Add1~7\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\,
	shareout => \Add1~11\);

-- Location: LABCELL_X73_Y4_N42
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \Add1~13_sumout\ & ( (\state_reg.last~q\) # (\Add1~9_sumout\) ) ) # ( !\Add1~13_sumout\ & ( (\Add1~9_sumout\ & !\state_reg.last~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add1~9_sumout\,
	datac => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \Selector7~0_combout\);

-- Location: MLABCELL_X72_Y4_N18
\Selector7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = ( !\state_reg.last~q\ & ( (\state_reg.op~q\ & ((!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & ((\Selector7~0_combout\))) # (\LessThan0~6_combout\ & (rh_reg(2))))) # (\LessThan0~4_combout\ & (((rh_reg(2))))))) ) ) # ( 
-- \state_reg.last~q\ & ( (!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & (((\Selector7~0_combout\)))) # (\LessThan0~6_combout\ & (rh_reg(3))))) # (\LessThan0~4_combout\ & (((rh_reg(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000111000001110000011100001000000011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => ALT_INV_rh_reg(3),
	datad => ALT_INV_rh_reg(2),
	datae => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_Selector7~0_combout\,
	datag => \ALT_INV_state_reg.op~q\,
	combout => \Selector7~1_combout\);

-- Location: FF_X72_Y4_N20
\rh_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(3));

-- Location: LABCELL_X73_Y4_N9
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !d_reg(3) $ (rh_reg(3)) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( !d_reg(3) $ (rh_reg(3)) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~15\ = SHARE((!d_reg(3) & rh_reg(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(3),
	datac => ALT_INV_rh_reg(3),
	cin => \Add1~10\,
	sharein => \Add1~11\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\,
	shareout => \Add1~15\);

-- Location: LABCELL_X73_Y4_N12
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( !d_reg(4) $ (rh_reg(4)) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( !d_reg(4) $ (rh_reg(4)) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~19\ = SHARE((!d_reg(4) & rh_reg(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_d_reg(4),
	datac => ALT_INV_rh_reg(4),
	cin => \Add1~14\,
	sharein => \Add1~15\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\,
	shareout => \Add1~19\);

-- Location: LABCELL_X73_Y4_N57
\rh_reg[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rh_reg[0]~0_combout\ = ( !\state_reg.op~q\ & ( !\state_reg.last~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_state_reg.op~q\,
	combout => \rh_reg[0]~0_combout\);

-- Location: LABCELL_X74_Y4_N57
\Selector6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = ( rh_reg(3) & ( rh_reg(4) & ( !\rh_reg[0]~0_combout\ ) ) ) # ( !rh_reg(3) & ( rh_reg(4) & ( (!\rh_reg[0]~0_combout\ & (((!\LessThan0~4_combout\ & !\LessThan0~6_combout\)) # (\state_reg.last~q\))) ) ) ) # ( rh_reg(3) & ( !rh_reg(4) 
-- & ( (!\rh_reg[0]~0_combout\ & ((!\state_reg.last~q\) # ((!\LessThan0~4_combout\ & !\LessThan0~6_combout\)))) ) ) ) # ( !rh_reg(3) & ( !rh_reg(4) & ( (!\LessThan0~4_combout\ & (!\LessThan0~6_combout\ & !\rh_reg[0]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000111100001000000010000000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => \ALT_INV_rh_reg[0]~0_combout\,
	datad => \ALT_INV_state_reg.last~q\,
	datae => ALT_INV_rh_reg(3),
	dataf => ALT_INV_rh_reg(4),
	combout => \Selector6~1_combout\);

-- Location: LABCELL_X74_Y4_N24
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \Selector6~1_combout\ & ( \LessThan0~6_combout\ ) ) # ( \Selector6~1_combout\ & ( !\LessThan0~6_combout\ & ( ((!\state_reg.last~q\ & (\Add1~13_sumout\)) # (\state_reg.last~q\ & ((\Add1~17_sumout\)))) # (\LessThan0~4_combout\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111010111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_state_reg.last~q\,
	datac => \ALT_INV_Add1~13_sumout\,
	datad => \ALT_INV_Add1~17_sumout\,
	datae => \ALT_INV_Selector6~1_combout\,
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \Selector6~0_combout\);

-- Location: FF_X74_Y4_N26
\rh_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(4));

-- Location: LABCELL_X73_Y4_N15
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( !d_reg(5) $ (rh_reg(5)) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( !d_reg(5) $ (rh_reg(5)) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~23\ = SHARE((!d_reg(5) & rh_reg(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(5),
	datac => ALT_INV_rh_reg(5),
	cin => \Add1~18\,
	sharein => \Add1~19\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\,
	shareout => \Add1~23\);

-- Location: LABCELL_X74_Y4_N54
\Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = ( rh_reg(4) & ( rh_reg(5) & ( !\rh_reg[0]~0_combout\ ) ) ) # ( !rh_reg(4) & ( rh_reg(5) & ( (!\rh_reg[0]~0_combout\ & (((!\LessThan0~4_combout\ & !\LessThan0~6_combout\)) # (\state_reg.last~q\))) ) ) ) # ( rh_reg(4) & ( !rh_reg(5) 
-- & ( (!\rh_reg[0]~0_combout\ & ((!\state_reg.last~q\) # ((!\LessThan0~4_combout\ & !\LessThan0~6_combout\)))) ) ) ) # ( !rh_reg(4) & ( !rh_reg(5) & ( (!\LessThan0~4_combout\ & (!\LessThan0~6_combout\ & !\rh_reg[0]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000111110000000000010001111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => \ALT_INV_state_reg.last~q\,
	datad => \ALT_INV_rh_reg[0]~0_combout\,
	datae => ALT_INV_rh_reg(4),
	dataf => ALT_INV_rh_reg(5),
	combout => \Selector5~1_combout\);

-- Location: LABCELL_X74_Y4_N42
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( \Selector5~1_combout\ & ( \LessThan0~6_combout\ ) ) # ( \Selector5~1_combout\ & ( !\LessThan0~6_combout\ & ( ((!\state_reg.last~q\ & ((\Add1~17_sumout\))) # (\state_reg.last~q\ & (\Add1~21_sumout\))) # (\LessThan0~4_combout\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101111111011100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_Add1~21_sumout\,
	datac => \ALT_INV_state_reg.last~q\,
	datad => \ALT_INV_Add1~17_sumout\,
	datae => \ALT_INV_Selector5~1_combout\,
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \Selector5~0_combout\);

-- Location: FF_X74_Y4_N44
\rh_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(5));

-- Location: LABCELL_X74_Y4_N36
\Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = ( rh_reg(5) & ( \LessThan0~6_combout\ & ( (!\state_reg.last~q\ & ((\state_reg.op~q\))) # (\state_reg.last~q\ & (rh_reg(6))) ) ) ) # ( !rh_reg(5) & ( \LessThan0~6_combout\ & ( (\state_reg.last~q\ & rh_reg(6)) ) ) ) # ( rh_reg(5) & ( 
-- !\LessThan0~6_combout\ & ( (!\state_reg.last~q\ & (((\state_reg.op~q\)))) # (\state_reg.last~q\ & ((!\LessThan0~4_combout\) # ((rh_reg(6))))) ) ) ) # ( !rh_reg(5) & ( !\LessThan0~6_combout\ & ( (!\state_reg.last~q\ & (!\LessThan0~4_combout\ & 
-- ((\state_reg.op~q\)))) # (\state_reg.last~q\ & ((!\LessThan0~4_combout\) # ((rh_reg(6))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010111001101010001011110111100000101000001010000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.last~q\,
	datab => \ALT_INV_LessThan0~4_combout\,
	datac => ALT_INV_rh_reg(6),
	datad => \ALT_INV_state_reg.op~q\,
	datae => ALT_INV_rh_reg(5),
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \Selector4~1_combout\);

-- Location: IOIBUF_X78_Y0_N18
\dvsr[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(6),
	o => \dvsr[6]~input_o\);

-- Location: FF_X73_Y4_N59
\d_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(6));

-- Location: LABCELL_X73_Y4_N18
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !d_reg(6) $ (rh_reg(6)) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( !d_reg(6) $ (rh_reg(6)) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~27\ = SHARE((!d_reg(6) & rh_reg(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_d_reg(6),
	datad => ALT_INV_rh_reg(6),
	cin => \Add1~22\,
	sharein => \Add1~23\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\,
	shareout => \Add1~27\);

-- Location: LABCELL_X74_Y4_N48
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \LessThan0~4_combout\ & ( \Add1~21_sumout\ & ( \Selector4~1_combout\ ) ) ) # ( !\LessThan0~4_combout\ & ( \Add1~21_sumout\ & ( (\Selector4~1_combout\ & (((!\state_reg.last~q\) # (\Add1~25_sumout\)) # (\LessThan0~6_combout\))) ) ) 
-- ) # ( \LessThan0~4_combout\ & ( !\Add1~21_sumout\ & ( \Selector4~1_combout\ ) ) ) # ( !\LessThan0~4_combout\ & ( !\Add1~21_sumout\ & ( (\Selector4~1_combout\ & (((\state_reg.last~q\ & \Add1~25_sumout\)) # (\LessThan0~6_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010101010101010101010101010001010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector4~1_combout\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => \ALT_INV_state_reg.last~q\,
	datad => \ALT_INV_Add1~25_sumout\,
	datae => \ALT_INV_LessThan0~4_combout\,
	dataf => \ALT_INV_Add1~21_sumout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X74_Y4_N50
\rh_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(6));

-- Location: LABCELL_X74_Y4_N18
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \state_reg.op~q\ & ( rh_reg(6) & ( (\LessThan0~6_combout\) # (\LessThan0~4_combout\) ) ) ) # ( !\state_reg.op~q\ & ( rh_reg(6) & ( (rh_reg(7) & (\state_reg.last~q\ & ((\LessThan0~6_combout\) # (\LessThan0~4_combout\)))) ) ) ) # ( 
-- \state_reg.op~q\ & ( !rh_reg(6) & ( (rh_reg(7) & (\state_reg.last~q\ & ((\LessThan0~6_combout\) # (\LessThan0~4_combout\)))) ) ) ) # ( !\state_reg.op~q\ & ( !rh_reg(6) & ( (rh_reg(7) & (\state_reg.last~q\ & ((\LessThan0~6_combout\) # 
-- (\LessThan0~4_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000101000000010000010100000001000001010011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rh_reg(7),
	datab => \ALT_INV_LessThan0~4_combout\,
	datac => \ALT_INV_state_reg.last~q\,
	datad => \ALT_INV_LessThan0~6_combout\,
	datae => \ALT_INV_state_reg.op~q\,
	dataf => ALT_INV_rh_reg(6),
	combout => \Selector3~0_combout\);

-- Location: IOIBUF_X80_Y0_N52
\dvsr[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dvsr(7),
	o => \dvsr[7]~input_o\);

-- Location: FF_X74_Y4_N41
\d_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \dvsr[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \d_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_reg(7));

-- Location: LABCELL_X73_Y4_N21
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( !d_reg(7) $ (rh_reg(7)) ) + ( \Add1~27\ ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(7),
	datad => ALT_INV_rh_reg(7),
	cin => \Add1~26\,
	sharein => \Add1~27\,
	sumout => \Add1~29_sumout\);

-- Location: LABCELL_X74_Y4_N0
\Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = ( \Add1~29_sumout\ & ( \Add1~25_sumout\ & ( (!\LessThan0~6_combout\ & (!\LessThan0~4_combout\ & ((\state_reg.last~q\) # (\state_reg.op~q\)))) ) ) ) # ( !\Add1~29_sumout\ & ( \Add1~25_sumout\ & ( (\state_reg.op~q\ & 
-- (!\LessThan0~6_combout\ & !\LessThan0~4_combout\)) ) ) ) # ( \Add1~29_sumout\ & ( !\Add1~25_sumout\ & ( (!\LessThan0~6_combout\ & (\state_reg.last~q\ & !\LessThan0~4_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000000001000100000000000100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.op~q\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => \ALT_INV_state_reg.last~q\,
	datad => \ALT_INV_LessThan0~4_combout\,
	datae => \ALT_INV_Add1~29_sumout\,
	dataf => \ALT_INV_Add1~25_sumout\,
	combout => \Selector3~1_combout\);

-- Location: LABCELL_X74_Y4_N33
\Selector3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = ( rh_reg(7) & ( \state_reg.done~q\ ) ) # ( !rh_reg(7) & ( \state_reg.done~q\ & ( (\Selector3~1_combout\) # (\Selector3~0_combout\) ) ) ) # ( rh_reg(7) & ( !\state_reg.done~q\ & ( (((!\state_reg.idle~q\ & !\start~input_o\)) # 
-- (\Selector3~1_combout\)) # (\Selector3~0_combout\) ) ) ) # ( !rh_reg(7) & ( !\state_reg.done~q\ & ( (\Selector3~1_combout\) # (\Selector3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111111101110111011101110111011101111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \ALT_INV_Selector3~1_combout\,
	datac => \ALT_INV_state_reg.idle~q\,
	datad => \ALT_INV_start~input_o\,
	datae => ALT_INV_rh_reg(7),
	dataf => \ALT_INV_state_reg.done~q\,
	combout => \Selector3~2_combout\);

-- Location: FF_X74_Y4_N35
\rh_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector3~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(7));

-- Location: LABCELL_X74_Y4_N9
\LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = ( d_reg(6) & ( rh_reg(6) & ( (!rh_reg(7) & (((!rh_reg(5) & d_reg(5))) # (d_reg(7)))) # (rh_reg(7) & (!rh_reg(5) & (d_reg(7) & d_reg(5)))) ) ) ) # ( !d_reg(6) & ( rh_reg(6) & ( (!rh_reg(7) & d_reg(7)) ) ) ) # ( d_reg(6) & ( 
-- !rh_reg(6) & ( (!rh_reg(7)) # (d_reg(7)) ) ) ) # ( !d_reg(6) & ( !rh_reg(6) & ( (!rh_reg(7) & (((!rh_reg(5) & d_reg(5))) # (d_reg(7)))) # (rh_reg(7) & (!rh_reg(5) & (d_reg(7) & d_reg(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010001110101011111010111100001010000010100000101010001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rh_reg(7),
	datab => ALT_INV_rh_reg(5),
	datac => ALT_INV_d_reg(7),
	datad => ALT_INV_d_reg(5),
	datae => ALT_INV_d_reg(6),
	dataf => ALT_INV_rh_reg(6),
	combout => \LessThan0~5_combout\);

-- Location: LABCELL_X73_Y4_N30
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( rh_reg(6) & ( rh_reg(7) & ( (d_reg(7) & (d_reg(6) & (!d_reg(5) $ (rh_reg(5))))) ) ) ) # ( !rh_reg(6) & ( rh_reg(7) & ( (d_reg(7) & (!d_reg(6) & (!d_reg(5) $ (rh_reg(5))))) ) ) ) # ( rh_reg(6) & ( !rh_reg(7) & ( (!d_reg(7) & 
-- (d_reg(6) & (!d_reg(5) $ (rh_reg(5))))) ) ) ) # ( !rh_reg(6) & ( !rh_reg(7) & ( (!d_reg(7) & (!d_reg(6) & (!d_reg(5) $ (rh_reg(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000000001001000000001001000000000000000000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(5),
	datab => ALT_INV_rh_reg(5),
	datac => ALT_INV_d_reg(7),
	datad => ALT_INV_d_reg(6),
	datae => ALT_INV_rh_reg(6),
	dataf => ALT_INV_rh_reg(7),
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X74_Y4_N12
\LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = ( rh_reg(4) & ( \LessThan0~0_combout\ & ( \LessThan0~5_combout\ ) ) ) # ( !rh_reg(4) & ( \LessThan0~0_combout\ & ( (d_reg(4)) # (\LessThan0~5_combout\) ) ) ) # ( rh_reg(4) & ( !\LessThan0~0_combout\ & ( \LessThan0~5_combout\ ) ) ) 
-- # ( !rh_reg(4) & ( !\LessThan0~0_combout\ & ( \LessThan0~5_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100111111001111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_LessThan0~5_combout\,
	datac => ALT_INV_d_reg(4),
	datae => ALT_INV_rh_reg(4),
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \LessThan0~6_combout\);

-- Location: MLABCELL_X72_Y4_N33
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( \Add1~9_sumout\ & ( (\state_reg.last~q\) # (\Add1~5_sumout\) ) ) # ( !\Add1~9_sumout\ & ( (\Add1~5_sumout\ & !\state_reg.last~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~5_sumout\,
	datad => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_Add1~9_sumout\,
	combout => \Selector8~0_combout\);

-- Location: MLABCELL_X72_Y4_N42
\Selector8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = ( !\state_reg.last~q\ & ( (\state_reg.op~q\ & ((!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & ((\Selector8~0_combout\))) # (\LessThan0~6_combout\ & (rh_reg(1))))) # (\LessThan0~4_combout\ & (((rh_reg(1))))))) ) ) # ( 
-- \state_reg.last~q\ & ( (!\LessThan0~4_combout\ & ((!\LessThan0~6_combout\ & (((\Selector8~0_combout\)))) # (\LessThan0~6_combout\ & (rh_reg(2))))) # (\LessThan0~4_combout\ & (((rh_reg(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000111000001110000011100001000000011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~4_combout\,
	datab => \ALT_INV_LessThan0~6_combout\,
	datac => ALT_INV_rh_reg(2),
	datad => ALT_INV_rh_reg(1),
	datae => \ALT_INV_state_reg.last~q\,
	dataf => \ALT_INV_Selector8~0_combout\,
	datag => \ALT_INV_state_reg.op~q\,
	combout => \Selector8~1_combout\);

-- Location: FF_X72_Y4_N44
\rh_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rh_reg(2));

-- Location: MLABCELL_X72_Y4_N30
\LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ( d_reg(2) & ( (rh_reg(2) & (!rh_reg(3) $ (d_reg(3)))) ) ) # ( !d_reg(2) & ( (!rh_reg(2) & (!rh_reg(3) $ (d_reg(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000001100110000000000110000110000000000110011000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rh_reg(2),
	datac => ALT_INV_rh_reg(3),
	datad => ALT_INV_d_reg(3),
	dataf => ALT_INV_d_reg(2),
	combout => \LessThan0~2_combout\);

-- Location: MLABCELL_X72_Y4_N3
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( rh_reg(1) & ( (d_reg(1) & (d_reg(0) & !rh_reg(0))) ) ) # ( !rh_reg(1) & ( ((d_reg(0) & !rh_reg(0))) # (d_reg(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101010101010111110101010100000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_d_reg(1),
	datac => ALT_INV_d_reg(0),
	datad => ALT_INV_rh_reg(0),
	dataf => ALT_INV_rh_reg(1),
	combout => \LessThan0~1_combout\);

-- Location: MLABCELL_X72_Y4_N57
\LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ( d_reg(2) & ( (!rh_reg(3) & ((!rh_reg(2)) # (d_reg(3)))) # (rh_reg(3) & (!rh_reg(2) & d_reg(3))) ) ) # ( !d_reg(2) & ( (!rh_reg(3) & d_reg(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101010100000111110101010000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rh_reg(3),
	datac => ALT_INV_rh_reg(2),
	datad => ALT_INV_d_reg(3),
	dataf => ALT_INV_d_reg(2),
	combout => \LessThan0~3_combout\);

-- Location: LABCELL_X73_Y4_N48
\LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ( \LessThan0~3_combout\ & ( \LessThan0~0_combout\ & ( !rh_reg(4) $ (d_reg(4)) ) ) ) # ( !\LessThan0~3_combout\ & ( \LessThan0~0_combout\ & ( (\LessThan0~2_combout\ & (\LessThan0~1_combout\ & (!rh_reg(4) $ (d_reg(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000011111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~2_combout\,
	datab => \ALT_INV_LessThan0~1_combout\,
	datac => ALT_INV_rh_reg(4),
	datad => ALT_INV_d_reg(4),
	datae => \ALT_INV_LessThan0~3_combout\,
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LABCELL_X73_Y4_N24
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( \rh_reg[0]~0_combout\ & ( \LessThan0~6_combout\ & ( (!\state_reg.done~q\ & (\dvnd[0]~input_o\)) # (\state_reg.done~q\ & ((rl_reg(0)))) ) ) ) # ( !\rh_reg[0]~0_combout\ & ( \LessThan0~6_combout\ & ( (\state_reg.done~q\ & 
-- rl_reg(0)) ) ) ) # ( \rh_reg[0]~0_combout\ & ( !\LessThan0~6_combout\ & ( (!\state_reg.done~q\ & (\dvnd[0]~input_o\)) # (\state_reg.done~q\ & ((rl_reg(0)))) ) ) ) # ( !\rh_reg[0]~0_combout\ & ( !\LessThan0~6_combout\ & ( (!\state_reg.done~q\ & 
-- (!\LessThan0~4_combout\)) # (\state_reg.done~q\ & ((rl_reg(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011110101001000100111011100000000010101010010001001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state_reg.done~q\,
	datab => \ALT_INV_dvnd[0]~input_o\,
	datac => \ALT_INV_LessThan0~4_combout\,
	datad => ALT_INV_rl_reg(0),
	datae => \ALT_INV_rh_reg[0]~0_combout\,
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \Selector15~0_combout\);

-- Location: LABCELL_X73_Y4_N54
\rl_next[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- rl_next(0) = ( \Selector15~0_combout\ & ( (\Selector13~1_combout\) # (rl_next(0)) ) ) # ( !\Selector15~0_combout\ & ( (rl_next(0) & !\Selector13~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rl_next(0),
	datac => \ALT_INV_Selector13~1_combout\,
	dataf => \ALT_INV_Selector15~0_combout\,
	combout => rl_next(0));

-- Location: FF_X73_Y4_N20
\rl_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rl_next(0),
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rl_reg(0));

-- Location: LABCELL_X22_Y36_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;



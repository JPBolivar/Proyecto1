-- Quartus Prime VHDL Template
-- flip_flop

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AVR_109 is
	port 
	(
		data_in	:	in std_logic_vector(7 downto 0);
		ena_in	:	in std_logic;
		clk		:	in std_logic;
		reset_n	:	in std_logic;
		prog_mode: out std_logic;
	   prog_addr: out std_logic_Vector(15 downto 0);
		prog_data: out std_logic_Vector(15 downto 0);
		prog_low : out std_logic;
	   prog_high: out std_logic;
		txd: out std_logic;
		intercept_mode: out std_logic;
		debug: out std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of AVR_109 is
--componente
component avr109 is
	port 
	(
			 rst: in std_logic;
	       clk: in std_logic;
	       rxd: in std_logic;
	       txd: out std_logic;
	       intercept_mode: out std_logic;
	       prog_mode: out std_logic;
	       prog_addr: out std_logic_Vector(15 downto 0);
	       prog_data: out std_logic_Vector(15 downto 0);
	       --prog_data_in : in std_logic_Vector(15 downto 0);
	       prog_low : out std_logic;
	       prog_high: out std_logic;
	       debug: out std_logic_vector(7 downto 0)
	);
end component;
--
component usart_trans is
	port 
	(
		data_in	:	in std_logic_vector(7 downto 0);
		ena_in	:	in std_logic;
		clk		:	in std_logic;
		reset_n	:	in std_logic;
		data_out	:	out std_logic
	);

end component;
--señal
signal s1,s2: std_logic;


begin
f1: usart_trans
port map(
data_in=>data_in,
ena_in=>ena_in,
clk=>clk,
reset_n=>reset_n,
data_out=>s1
);

s2<=not(reset_n);
f2: avr109
port map(
rst=> s2,
clk=>clk,
rxd=>s1,
txd=>txd,
intercept_mode=>intercept_mode,
prog_mode=>prog_mode,
prog_addr=>prog_addr,
prog_data=>prog_data,
--prog_data_in=>
prog_low=>prog_low,
prog_high=>prog_high,
debug=>debug
);

end rtl;
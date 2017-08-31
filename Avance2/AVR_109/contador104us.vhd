-- Quartus Prime VHDL Template
-- contador104us

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador104us is
		generic(
			DATA_WIDTH: natural:=8;
			MAX_NUM: natural:=157
		);
	port 
	(
		clk	:	in std_logic;
		ena	:	in std_logic;
		reset_n	:	in std_logic;
		out_cont	:	out std_logic	
	);
end entity;

architecture rtl of contador104us is
--componentes
component registro is
		generic (
			DATA_WIDTH: natural:=8
		);
	port 
	(
		D	   : in std_logic_vector(DATA_WIDTH-1 downto 0);
		clk   : in std_logic;	
		ena   : in std_logic;
		reset_n : in std_logic;
		Q     : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);

end component;

--señales
signal s1,s2,s3	:	std_logic_vector(DATA_WIDTH-1 downto 0);
signal s4	:	std_logic;
begin

f1: registro
generic map(
DATA_WIDTH=>DATA_WIDTH
)
port map(
D=>s2,
clk=>clk,
ena=>ena,
reset_n=>reset_n,
Q=>s1
);

S4<= '1' when unsigned(s1) = MAX_NUM else '0';

with s4 select
s2<= s3 when '0', (others=>'0') when '1', (others=>'0') when others;

s3<= std_logic_vector( unsigned(s1)+ to_unsigned(1,DATA_WIDTH));
out_cont<=s4;

end rtl;

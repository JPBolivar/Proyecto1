-- Quartus Prime VHDL Template
-- registro

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usart_trans is
	generic(
			--tamaño de palabra contador 104us
			DATA_WIDTH: natural:=7;
			--numero de comparacion en el contador de 104us
			MAX_NUM: natural:=105
		);
	port 
	(
		data_in	:	in std_logic_vector(7 downto 0);
		ena_in	:	in std_logic;
		clk		:	in std_logic;
		reset_n	:	in std_logic;
		data_out	:	out std_logic
		
	);

end entity;

architecture rtl of usart_trans is
--componentes
component registro8 is
	port 
	(
		D	   : in std_logic_vector(7 downto 0);
		clk   : in std_logic;	
		ena   : in std_logic;
		reset_n : in std_logic;
		Q     : out std_logic_vector(7 downto 0)
	);
end component;
--
component codificador is
	port
	(
	input	:	in std_logic_Vector(7 downto 0);
	output	:	out std_logic
	);
end component;
--
component usart_trans_sm is
	port 
	(
		clk		: in std_logic;
		reset_n	: in std_logic;
		ena_in   : in std_logic;
		in_cont  : in std_logic;
		ena_cont : out std_logic;
		control_mux : out std_logic_vector(3 downto 0)
	);
end component;
--
component contador104us is
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
end component;

--señales
signal s1	:	std_logic_Vector(7 downto 0);
signal s2	:	std_logic_vector(3 downto 0);
signal s3,s4,s5,start,idle	:	std_logic;	

begin
f1: registro8
port map(
D=>data_in,
clk=>clk,
ena=>ena_in,
reset_n=>reset_n,
Q=>s1
); 

f2: codificador
port map(
input=>s1,
output=>s5
);

f3:usart_trans_sm
port map(
clk=>clk,
reset_n=>reset_n,
ena_in=>ena_in,
in_cont=>s4,
ena_cont=>s3,
control_mux=>s2
);

f4: contador104us
generic map(
DATA_WIDTH=>DATA_WIDTH,
MAX_NUM=>MAX_NUM
)
port map(
clk=>clk,
ena=>s3,
reset_n=>reset_n,
out_cont=>s4
);

start<='0';
idle<='1';

with s2 select
data_out<=	idle when "0000",
				start when "0001",
				s1(0) when "0010",
				s1(1) when "0011",
				s1(2) when "0100",
				s1(3) when "0101",
				s1(4) when "0110",
				s1(5) when "0111",
				s1(6) when "1000",
				s1(7) when "1001",
				s5 when "1010",
				idle when others;
				
end rtl;
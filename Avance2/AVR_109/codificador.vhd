-- Quartus Prime VHDL Template
-- codificador

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codificador is
	port
	(
	input	:	in std_logic_Vector(7 downto 0);
	output	:	out std_logic
	);
end entity;

architecture rtl of codificador is
--señales
signal s1,s2,s3,s4,s5,s6,s7,s8,sum	:	std_logic_vector (3 downto 0);

begin
s1<=("000" & input(0));
s2<=("000" & input(1));
s3<=("000" & input(2));
s4<=("000" & input(3));
s5<=("000" & input(4));
s6<=("000" & input(5));
s7<=("000" & input(6));
s8<=("000" & input(7));
sum<=std_logic_Vector(unsigned(s1)+unsigned(s2)+unsigned(s3)+unsigned(s4)+unsigned(s5)+unsigned(s6)+unsigned(s7)+unsigned(s8));
output<= not(sum(0));
end rtl;

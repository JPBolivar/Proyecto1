-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity usart_trans_sm is
	port 
	(
		clk		: in std_logic;
		reset_n	: in std_logic;
		ena_in   : in std_logic;
		in_cont  : in std_logic;
		ena_cont : out std_logic;
		control_mux : out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of usart_trans_sm is

type usart_trans_sm is (idle,start,d0,d1,d2,d3,d4,d5,d6,d7,p);
signal CS,NS: usart_trans_sm;

begin

	CS<= idle when reset_n='0' else NS when rising_edge(clk);

	--logica de estados
	
	--logica estado siguiente
	process (CS,ena_in,in_cont)
	begin
	case CS is
		when idle=>
			if ena_in='1' then
				NS<=start;
			else
				Ns<=idle;
			end if;
		when start=> 
			if in_cont='1' then
				NS<=d0;
			else
				NS<=start;
			end if;
		when d0=>
			if in_cont='1' then
				NS<=d1;
			else
				Ns<=d0;
			end if;
		when d1=>
			if in_cont='1' then
				NS<=d2;
			else
			NS<=d1;
			end if;
		when d2=>
			if in_cont='1' then
				NS<=d3;
			else
			NS<=d2;
			end if;
		when d3=>
			if in_cont='1' then
				NS<=d4;
			else
			NS<=d3;
			end if;
		when d4=>
			if in_cont='1' then
				NS<=d5;
			else
			NS<=d4;
			end if;
		when d5=>
			if in_cont='1' then
				NS<=d6;
			else
			NS<=d5;
			end if;	
		when d6=>
			if in_cont='1' then
				NS<=d7;
			else
			NS<=d6;
			end if;
		when d7=>
			if in_cont='1' then
				NS<=p;
			else
			NS<=d7;
			end if;
		when p=>
			if in_cont='1' then
				NS<=idle;
			else
			NS<=p;
			end if;
		end case;
	end process;

	--logica de salida
	process(CS)
	begin
		case CS is
			when idle=>
				ena_cont<='0';
				control_mux<="0000";
			when start=>
				ena_cont<='1';
				control_mux<="0001";
			when d0=>
				ena_cont<='1';
				control_mux<="0010";
			when d1=>
				ena_cont<='1';
				control_mux<="0011";
			when d2=>
				ena_cont<='1';
				control_mux<="0100";
			when d3=>
				ena_cont<='1';
				control_mux<="0101";
			when d4=>
				ena_cont<='1';
				control_mux<="0110";
			when d5=>
				ena_cont<='1';
				control_mux<="0111";
			when d6=>
				ena_cont<='1';
				control_mux<="1000";
			when d7=>
				ena_cont<='1';
				control_mux<="1001";
			when p=>
				ena_cont<='1';
				control_mux<="1010";
		end case;	
	end process;	
end rtl;
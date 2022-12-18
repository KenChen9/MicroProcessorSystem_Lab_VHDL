library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu8 is
	port(
		opcode : in std_logic_vector(3 downto 0);
		a, b : in unsigned(7 downto 0);
		cin : in std_logic;
		cout : out std_logic;
		r : out unsigned(7 downto 0)
	);
end entity;

architecture rtl of alu8 is
	
	signal a_inv, b_inv : unsigned(7 downto 0);
	signal sum : unsigned(8 downto 0);
	signal slt : std_logic;
	
begin
	
	a_inv <= not a when opcode(3) = '1' else a;
	b_inv <= not b when opcode(2) = '1' else b;
	
	with opcode(1 downto 0) select r <=
		a_inv and b_inv when "00",
		a_inv or b_inv when "01",
		sum(7 downto 0) when "10",
		"0000000" & slt when others;
	
	sum <= ("0" & a_inv) + b_inv + ("" & cin);
	cout <= sum(8);
	slt <= '1' when a < b else '0';
	
end architecture;
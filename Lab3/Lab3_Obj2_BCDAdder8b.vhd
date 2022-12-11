library ieee;
use ieee.std_logic_1164.all;
use work.Lab3_2_package.all;

entity BCDAdder8b is
	port(
		signal a, b: in std_logic_vector(7 downto 0);
		signal cin: in std_logic;
		signal s: out std_logic_vector(7 downto 0);
		signal cout: out std_logic
	);
end entity BCDAdder8b;

architecture logic of BCDAdder8b is
	signal c: std_logic;
begin
	BCDAdder4b0: BCDAdder4b port map (
		a => a(3 downto 0),
		b => b(3 downto 0),
		cin => cin,
		s => s(3 downto 0),
		cout => c
	);
	BCDAdder4b1: BCDAdder4b port map (
		a => a(7 downto 4),
		b => b(7 downto 4),
		cin => c,
		s => s(7 downto 4),
		cout => cout
	);
end architecture logic;
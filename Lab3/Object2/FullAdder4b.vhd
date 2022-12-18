library ieee;
use ieee.std_logic_1164.all;
use work.Lab3_2_package.all;

entity FullAdder4b is
	port(
		signal a, b: in std_logic_vector(3 downto 0);
		signal cin: in std_logic;
		signal s: out std_logic_vector(3 downto 0);
		signal cout: out std_logic
	);
end entity FullAdder4b;

architecture logic of FullAdder4b is
	signal c: std_logic_vector(3 downto 0);
begin
	FA0: FullAdder1b port map (
		a => a(0),
		b => b(0),
		cin => cin,
		s => s(0),
		cout => c(0)
	);
	FA1: FullAdder1b port map (
		a => a(1),
		b => b(1),
		cin => c(0),
		s => s(1),
		cout => c(1)
	);
	FA2: FullAdder1b port map (
		a => a(2),
		b => b(2),
		cin => c(1),
		s => s(2),
		cout => c(2)
	);
	FA3: FullAdder1b port map (
		a => a(3),
		b => b(3),
		cin => c(2),
		s => s(3),
		cout => c(3)
	);
	cout <= c(3);
end architecture logic;
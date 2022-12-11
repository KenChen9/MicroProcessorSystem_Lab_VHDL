library ieee;
use ieee.std_logic_1164.all;
use work.Lab3_2_package.all;

entity Lab3_2_BCDAdder8bTo7Seg is
	port(
		signal a, b: in std_logic_vector(7 downto 0);
		signal led0, led1: out std_logic_vector(6 downto 0)
	);
end entity Lab3_2_BCDAdder8bTo7Seg;

architecture logic of Lab3_2_BCDAdder8bTo7Seg is
	signal s: std_logic_vector(7 downto 0);
begin
	BCDAdder8b0: BCDAdder8b port map (
		a => a,
		b => b,
		cin => '0',
		s => s,
		cout => open
	);
	C7Seg0: C7Seg port map (
		sw => s(3 downto 0),
		led => led0
	);
	C7Seg1: C7Seg port map (
		sw => s(7 downto 4),
		led => led1
	);
end architecture logic;
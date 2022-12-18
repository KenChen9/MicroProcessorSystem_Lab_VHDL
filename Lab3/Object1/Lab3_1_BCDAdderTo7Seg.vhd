library ieee;
use ieee.std_logic_1164.all;
use work.Lab3_1_package.all;

entity Lab3_1_BCDAdderTo7Seg is
	port(
		signal a, b: in std_logic_vector(3 downto 0);
		signal led0, led1: out std_logic_vector(6 downto 0)
	);
end entity Lab3_1_BCDAdderTo7Seg;

architecture logic of Lab3_1_BCDAdderTo7Seg is
	signal sBCD: std_logic_vector(3 downto 0);
	signal tens: std_logic;
begin
	BCDAdder4b0: BCDAdder4b port map (
		a => a,
		b => b,
		cin => '0',
		s => sBCD,
		cout => tens
	);
	C7Seg0: C7Seg port map (
		sw => sBCD,
		led => led0
	);
	C7Seg1: C7Seg port map (
		sw => "000" & tens,
		led => led1
	);
end architecture logic;
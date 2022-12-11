library ieee;
use ieee.std_logic_1164.all;
use work.Lab3_1_package.all;

entity BCDAdder4b is
	port(
		signal a, b: in std_logic_vector(3 downto 0);
		signal cin: in std_logic;
		signal s: out std_logic_vector(3 downto 0);
		signal cout: out std_logic
	);
end entity BCDAdder4b;

architecture logic of BCDAdder4b is
	signal sBIN: std_logic_vector(3 downto 0);
	signal coutBIN, coutComp: std_logic;
begin
	-- FullAdder4b
	FA4bBIN: FullAdder4b port map (
		a => a,
		b => b,
		cin => cin,
		s => sBIN,
		cout => coutBIN
	);
	
	-- Compensate Circuit
	coutComp <= coutBIN or (sBIN(3) and sBIN(2)) or (sBIN(3) and sBIN(1));
	cout <= coutComp;
	
	-- FullAdder4b Compensate
	FA4bComp: FullAdder4b port map (
		a => sBIN,
		b => '0' & coutComp & coutComp & '0',
		cin => '0',
		s => s,
		cout => open
	);
end architecture logic;
library ieee;
use ieee.std_logic_1164.all;

entity seg_display is
	port(
		sw : in std_logic_vector(3 downto 0);
		seg : out std_logic_vector(6 downto 0)
	);
end entity seg_display;

architecture behavioral of seg_display is
begin
	
	with sw select seg <=
		"0000001" when "0000",
		"1001111" when "0001",
		"0010010" when "0010",
		"0000110" when "0011",
		"1001100" when "0100",
		"0100100" when "0101",
		"0100000" when "0110",
		"0001111" when "0111",
		"0000000" when "1000",
		"0000100" when "1001",
		"1111110" when "1111",
		"0110000" when others;
	
end architecture behavioral;
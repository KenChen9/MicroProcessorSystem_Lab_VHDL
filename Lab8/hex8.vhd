library ieee;
use ieee.std_logic_1164.all;

entity hex8 is
	port(
		bin : in std_logic_vector(7 downto 0);
		hex1, hex0 : out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of hex8 is
begin

	with bin(7 downto 4) select hex1 <=
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
	
	with bin(3 downto 0) select hex0 <=
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

end architecture;
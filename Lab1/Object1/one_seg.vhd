library ieee;
use ieee.std_logic_1164.all;

entity one_seg is
	port(
		signal sw : in std_logic_vector(3 downto 0); -- (MSB)abcd(LSB)
		signal led : out std_logic_vector(6 downto 0) -- abcdefg
	);
end entity one_seg;

architecture logic of one_seg is
begin -- a = sw(3), b = sw(2), c = sw(1), d = sw(0)
	led(6) <= (sw(3) and sw(2) and not sw(1)) or (sw(3) and not sw(2) and sw(1) and sw(0)) or (not sw(3) and not sw(2) and not sw(1) and sw(0)) or (sw(2) and not sw(1) and not sw(0));
	led(5) <= (sw(3) and sw(2) and sw(1)) or (sw(3) and sw(2) and not sw(0)) or (sw(3) and sw(1) and sw(0)) or (not sw(3) and sw(2) and not sw(1) and sw(0)) or (sw(2) and sw(1) and not sw(0));
	led(4) <= (sw(3) and sw(2) and sw(1)) or (sw(3) and sw(2) and not sw(0)) or (not sw(3) and not sw(2) and sw(1) and not sw(0));
	led(3) <= (sw(3) and not sw(2) and sw(1) and not sw(0)) or (not sw(3) and sw(2) and not sw(1) and not sw(0)) or (not sw(3) and not sw(2) and not sw(1) and sw(0)) or (sw(2) and sw(1) and sw(0));
	led(2) <= (not sw(3) and sw(2) and not sw(1)) or (not sw(3) and sw(0)) or (not sw(2) and not sw(1) and sw(0));
	led(1) <= (sw(3) and sw(2) and not sw(1)) or (not sw(3) and not sw(2) and sw(1)) or (not sw(3) and not sw(2) and sw(0)) or (not sw(3) and sw(1) and sw(0));
	led(0) <= (not sw(3) and sw(2) and sw(1) and sw(0)) or (not sw(3) and not sw(2) and not sw(1));
end architecture logic;

configuration one_seg_conf of one_seg is
	for logic
	end for;
end configuration one_seg_conf;
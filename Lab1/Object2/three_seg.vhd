library ieee;
use ieee.std_logic_1164.all;

entity three_seg is
	port(
		signal sw1, sw2, sw3 : in std_logic_vector(3 downto 0);
		signal led1, led2, led3 : out std_logic_vector(6 downto 0)
	);
end entity three_seg;

architecture logic of three_seg is
begin
	led1(6) <= (sw1(3) and sw1(2) and not sw1(1)) or (sw1(3) and not sw1(2) and sw1(1) and sw1(0)) or (not sw1(3) and not sw1(2) and not sw1(1) and sw1(0)) or (sw1(2) and not sw1(1) and not sw1(0));
	led1(5) <= (sw1(3) and sw1(2) and sw1(1)) or (sw1(3) and sw1(2) and not sw1(0)) or (sw1(3) and sw1(1) and sw1(0)) or (not sw1(3) and sw1(2) and not sw1(1) and sw1(0)) or (sw1(2) and sw1(1) and not sw1(0));
	led1(4) <= (sw1(3) and sw1(2) and sw1(1)) or (sw1(3) and sw1(2) and not sw1(0)) or (not sw1(3) and not sw1(2) and sw1(1) and not sw1(0));
	led1(3) <= (sw1(3) and not sw1(2) and sw1(1) and not sw1(0)) or (not sw1(3) and sw1(2) and not sw1(1) and not sw1(0)) or (not sw1(3) and not sw1(2) and not sw1(1) and sw1(0)) or (sw1(2) and sw1(1) and sw1(0));
	led1(2) <= (not sw1(3) and sw1(2) and not sw1(1)) or (not sw1(3) and sw1(0)) or (not sw1(2) and not sw1(1) and sw1(0));
	led1(1) <= (sw1(3) and sw1(2) and not sw1(1)) or (not sw1(3) and not sw1(2) and sw1(1)) or (not sw1(3) and not sw1(2) and sw1(0)) or (not sw1(3) and sw1(1) and sw1(0));
	led1(0) <= (not sw1(3) and sw1(2) and sw1(1) and sw1(0)) or (not sw1(3) and not sw1(2) and not sw1(1));
	
	led2(6) <= (sw2(3) and sw2(2) and not sw2(1)) or (sw2(3) and not sw2(2) and sw2(1) and sw2(0)) or (not sw2(3) and not sw2(2) and not sw2(1) and sw2(0)) or (sw2(2) and not sw2(1) and not sw2(0));
	led2(5) <= (sw2(3) and sw2(2) and sw2(1)) or (sw2(3) and sw2(2) and not sw2(0)) or (sw2(3) and sw2(1) and sw2(0)) or (not sw2(3) and sw2(2) and not sw2(1) and sw2(0)) or (sw2(2) and sw2(1) and not sw2(0));
	led2(4) <= (sw2(3) and sw2(2) and sw2(1)) or (sw2(3) and sw2(2) and not sw2(0)) or (not sw2(3) and not sw2(2) and sw2(1) and not sw2(0));
	led2(3) <= (sw2(3) and not sw2(2) and sw2(1) and not sw2(0)) or (not sw2(3) and sw2(2) and not sw2(1) and not sw2(0)) or (not sw2(3) and not sw2(2) and not sw2(1) and sw2(0)) or (sw2(2) and sw2(1) and sw2(0));
	led2(2) <= (not sw2(3) and sw2(2) and not sw2(1)) or (not sw2(3) and sw2(0)) or (not sw2(2) and not sw2(1) and sw2(0));
	led2(1) <= (sw2(3) and sw2(2) and not sw2(1)) or (not sw2(3) and not sw2(2) and sw2(1)) or (not sw2(3) and not sw2(2) and sw2(0)) or (not sw2(3) and sw2(1) and sw2(0));
	led2(0) <= (not sw2(3) and sw2(2) and sw2(1) and sw2(0)) or (not sw2(3) and not sw2(2) and not sw2(1));
	
	led3(6) <= (sw3(3) and sw3(2) and not sw3(1)) or (sw3(3) and not sw3(2) and sw3(1) and sw3(0)) or (not sw3(3) and not sw3(2) and not sw3(1) and sw3(0)) or (sw3(2) and not sw3(1) and not sw3(0));
	led3(5) <= (sw3(3) and sw3(2) and sw3(1)) or (sw3(3) and sw3(2) and not sw3(0)) or (sw3(3) and sw3(1) and sw3(0)) or (not sw3(3) and sw3(2) and not sw3(1) and sw3(0)) or (sw3(2) and sw3(1) and not sw3(0));
	led3(4) <= (sw3(3) and sw3(2) and sw3(1)) or (sw3(3) and sw3(2) and not sw3(0)) or (not sw3(3) and not sw3(2) and sw3(1) and not sw3(0));
	led3(3) <= (sw3(3) and not sw3(2) and sw3(1) and not sw3(0)) or (not sw3(3) and sw3(2) and not sw3(1) and not sw3(0)) or (not sw3(3) and not sw3(2) and not sw3(1) and sw3(0)) or (sw3(2) and sw3(1) and sw3(0));
	led3(2) <= (not sw3(3) and sw3(2) and not sw3(1)) or (not sw3(3) and sw3(0)) or (not sw3(2) and not sw3(1) and sw3(0));
	led3(1) <= (sw3(3) and sw3(2) and not sw3(1)) or (not sw3(3) and not sw3(2) and sw3(1)) or (not sw3(3) and not sw3(2) and sw3(0)) or (not sw3(3) and sw3(1) and sw3(0));
	led3(0) <= (not sw3(3) and sw3(2) and sw3(1) and sw3(0)) or (not sw3(3) and not sw3(2) and not sw3(1));
end architecture logic;

configuration three_seg_conf of three_seg is
	for logic
	end for;
end configuration three_seg_conf;
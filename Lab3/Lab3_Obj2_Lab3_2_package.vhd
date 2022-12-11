library ieee;
use ieee.std_logic_1164.all;

package Lab3_2_package is
	component FullAdder1b
		port(
			signal a, b, cin: in std_logic;
			signal s, cout: out std_logic
		);
	end component FullAdder1b;
	component FullAdder4b
		port(
			signal a, b: in std_logic_vector(3 downto 0);
			signal cin: in std_logic;
			signal s: out std_logic_vector(3 downto 0);
			signal cout: out std_logic
		);
	end component FullAdder4b;
	component BCDAdder4b is
		port(
			signal a, b: in std_logic_vector(3 downto 0);
			signal cin: in std_logic;
			signal s: out std_logic_vector(3 downto 0);
			signal cout: out std_logic
		);
	end component BCDAdder4b;
	component BCDAdder8b is
		port(
			signal a, b: in std_logic_vector(7 downto 0);
			signal cin: in std_logic;
			signal s: out std_logic_vector(7 downto 0);
			signal cout: out std_logic
		);
	end component BCDAdder8b;
	component C7Seg is
		port(
			signal sw: in std_logic_vector(3 downto 0);
			signal led: out std_logic_vector(6 downto 0)
		);
	end component C7Seg;
end package Lab3_2_package;
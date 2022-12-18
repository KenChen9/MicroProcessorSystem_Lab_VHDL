library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Lab7_package is
	
	component divider is
		generic(
			N : integer := 8
		);
		port(
			clk, rst : in std_logic;
			dividend_data, divisor_data : in unsigned(N-1 downto 0);
			remainder, divisor : buffer unsigned(2*N-1 downto 0);
			quotient : out unsigned(N-1 downto 0);
			done : out std_logic
		);
	end component divider;
	
	component shift_reg is
		generic(
			N : integer := 8
		);
		port(
			clk, rst, load, shift, lr_sel, sdi : in std_logic;
			di : in unsigned(N-1 downto 0);
			qo : buffer unsigned(N-1 downto 0)
		);
	end component shift_reg;
	
	component seg_display is
		port(
			sw : in std_logic_vector(3 downto 0);
			seg : out std_logic_vector(6 downto 0)
		);
	end component seg_display;
	
end package Lab7_package;
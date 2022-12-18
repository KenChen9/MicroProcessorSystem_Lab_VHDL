library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Lab7_package.all;

entity Lab7 is
	generic(
		N : integer := 8
	);
	port(
		clk, rst : in std_logic;
		dividend_data, divisor_data : in unsigned(N-1 downto 0);
		remainder_leds, quotient_leds : out std_logic_vector(N-1 downto 0);
		remainder_seg1, remainder_seg0, quotient_seg1, quotient_seg0 : out std_logic_vector(6 downto 0)
	);
end entity Lab7;

architecture behavioral of Lab7 is
	
	signal remainder, divisor : unsigned(2*N-1 downto 0);
	signal quotient : unsigned(N-1 downto 0);
	signal done : std_logic;
	
	signal remainder_seg1_sw, remainder_seg0_sw, quotient_seg1_sw, quotient_seg0_sw : std_logic_vector(3 downto 0);
	
begin
	
	remainder_leds <= std_logic_vector(remainder(N-1 downto 0));
	quotient_leds <= std_logic_vector(quotient);
	
	my_divider: divider
	generic map(
		N => 8
	)
	port map(
		clk => clk,
		rst => rst,
		dividend_data => dividend_data,
		divisor_data => divisor_data,
		remainder => remainder,
		divisor => divisor,
		quotient => quotient,
		done => done
	);
	
	remainder_seg1_sw <= std_logic_vector(remainder(N-1 downto N/2)) when done = '1' else (others => '1');
	remainder_seg0_sw <= std_logic_vector(remainder(N/2-1 downto 0)) when done = '1' else (others => '1');
	quotient_seg1_sw <= std_logic_vector(quotient(N-1 downto N/2)) when done = '1' else (others => '1');
	quotient_seg0_sw <= std_logic_vector(quotient(N/2-1 downto 0)) when done = '1' else (others => '1');
	
	remainder_seg_display1: seg_display
	port map(
		sw => remainder_seg1_sw,
		seg => remainder_seg1
	);
	
	remainder_seg_display0: seg_display
	port map(
		sw => remainder_seg0_sw,
		seg => remainder_seg0
	);
	
	quotient_seg_display1: seg_display
	port map(
		sw => quotient_seg1_sw,
		seg => quotient_seg1
	);
	
	quotient_seg_display0: seg_display
	port map(
		sw => quotient_seg0_sw,
		seg => quotient_seg0
	);
	
end architecture behavioral;
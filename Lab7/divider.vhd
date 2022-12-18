library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Lab7_package.all;

entity divider is
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
end entity divider;

architecture behavioral of divider is
	
	type state_type is (start, s1, s2a, s2b, s3, s4);
	attribute enum_encoding : string;
	attribute enum_encoding of state_type : type is "default";
	signal current_state, next_state : state_type;
	
	signal load, div_shift, quo_sdi, quo_shift : std_logic;
	
	signal counter : integer range 0 to 3*N+1;
	constant counter_max : integer := 3*N+1;
	
begin
	
	div_shift_reg: shift_reg
	generic map(
		N => 2*N
	)
	port map(
		clk => clk,
		rst => rst,
		load => load,
		shift => div_shift,
		lr_sel => '0',
		sdi => '0',
		di(2*N-1 downto N) => divisor_data,
		di(N-1 downto 0) => (others => '0'),
		qo => divisor
	);
	
	quo_shift_reg: shift_reg
	generic map(
		N => N
	)
	port map(
		clk => clk,
		rst => rst,
		load => load,
		shift => quo_shift,
		lr_sel => '1',
		sdi => quo_sdi,
		di => (others => '0'),
		qo => quotient
	);
	
	process(current_state, dividend_data, divisor_data, remainder, divisor, counter)
	begin
		load <= '0';
		div_shift <= '0';
		quo_sdi <= '0';
		quo_shift <= '0';
		done <= '0';
		next_state <= current_state;
		case current_state is
		when start =>
			load <= '1';
			next_state <= s1;
		when s1 =>
			next_state <= s2a;
			if remainder < divisor then
				next_state <= s2b;
			end if;
		when s2a =>
			div_shift <= '1';
			quo_sdi <= '1';
			quo_shift <= '1';
			next_state <= s3;
		when s2b =>
			div_shift <= '1';
			quo_sdi <= '0';
			quo_shift <= '1';
			next_state <= s3;
		when s3 =>
			next_state <= s1;
			if counter = counter_max then
				next_state <= s4;
			end if;
		when s4 =>
			done <= '1';
		end case;
	end process;
	
	process(clk, rst, current_state, remainder)
	begin
		if rising_edge(clk) then
			case current_state is
			when start =>
				remainder(2*N-1 downto N) <= (others => '0');
				remainder(N-1 downto 0) <= dividend_data;
			when s2a =>
				remainder <= remainder - divisor;
			when others =>
				-- do nothing
			end case;
		end if;
	end process;
	
	process(clk, rst, counter)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				counter <= 0;
			elsif counter /= counter_max then
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	process(clk, rst, next_state)
	begin
		if rising_edge(clk) then
			current_state <= next_state;
			if rst = '1' then
				current_state <= start;
			end if;
		end if;
	end process;
	
end architecture behavioral;
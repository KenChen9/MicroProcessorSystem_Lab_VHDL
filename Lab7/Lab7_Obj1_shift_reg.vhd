library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg is
	generic(
		N : integer := 8
	);
	port(
		clk, rst, load, shift, lr_sel, sdi : in std_logic;
		di : in unsigned(N-1 downto 0);
		qo : buffer unsigned(N-1 downto 0)
	);
end entity shift_reg;

architecture behavioral of shift_reg is
begin
	
	process(clk, rst, load, shift, lr_sel, sdi, di)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				qo <= (others => '0');
			elsif load = '1' then
				qo <= di;
			elsif shift = '1' then
				qo <= sdi & qo(N-1 downto 1);
				if lr_sel = '1' then
					qo <= qo(N-2 downto 0) & sdi;
				end if;
			end if;
		end if;
	end process;
	
end architecture behavioral;
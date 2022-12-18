library ieee;
use ieee.std_logic_1164.all;

entity Lab5 is
	generic (N : integer := 8);
	port(
		signal clk : in std_logic;
		signal clear : in std_logic;
		signal load : in std_logic;
		signal lr_sel : in std_logic;
		signal di : in std_logic_vector(N-1 downto 0);
		signal sdi : in std_logic;
		signal qo : buffer std_logic_vector(N-1 downto 0)
	);
end entity Lab5;

architecture LogicFunc of Lab5 is
begin
	process
	begin
		wait until clk'event and clk = '1';
		
		if clear = '1' then
			qo <= (others => '0');
		else
			if load = '1' then
				qo <= di;
			else
				if lr_sel = '1' then
					shiftLeft: for i in N-2 downto 0 loop
						qo(i+1) <= qo(i);
					end loop;
					qo(0) <= sdi;
				else
					shiftRight: for i in 0 to N-2 loop
						qo(i) <= qo(i+1);
					end loop;
					qo(N-1) <= sdi;
				end if;
			end if;
		end if;
	end process;
end architecture LogicFunc;
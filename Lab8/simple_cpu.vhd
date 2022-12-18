library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_cpu is
	port(
		clk : in std_logic;
		data : in unsigned(7 downto 0);
		I : in std_logic_vector(3 downto 0);
		rs_sel, rt_sel : in std_logic_vector(1 downto 0);
		bus_hex1, bus_hex0 : out std_logic_vector(6 downto 0);
		rs_hex1, rs_hex0 : out std_logic_vector(6 downto 0);
		rt_hex1, rt_hex0 : out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of simple_cpu is
	
	component alu8 is
		port(
			opcode : in std_logic_vector(3 downto 0);
			a, b : in unsigned(7 downto 0);
			cin : in std_logic;
			cout : out std_logic;
			r : out unsigned(7 downto 0)
		);
	end component;
	
	component hex8 is
		port(
			bin : in std_logic_vector(7 downto 0);
			hex1, hex0 : out std_logic_vector(6 downto 0)
		);
	end component;
	
	type state_type is (T0, T1, T2);
	signal current_state, next_state : state_type;
	
	signal opcode : std_logic_vector(3 downto 0);
	signal A, G : unsigned(7 downto 0);
	
	signal data_bus : unsigned(7 downto 0);
	
	type register_array_type is array(0 to 3) of unsigned(7 downto 0);
	signal registers : register_array_type;
	
begin
	
	alu8_s0: alu8 port map(
		opcode => opcode,
		a => (others => '0'),
		b => (others => '0'),
		cin => '0',
		cout => open,
		r => open
	);
	
	hex8_s2: hex8 port map(
		bin => std_logic_vector(data_bus),
		hex1 => bus_hex1,
		hex0 => bus_hex0
	);
	
	hex8_s1: hex8 port map(
		bin => std_logic_vector(registers(to_integer(unsigned(rs_sel)))),
		hex1 => rs_hex1,
		hex0 => rs_hex0
	);
	
	hex8_s0: hex8 port map(
		bin => std_logic_vector(registers(to_integer(unsigned(rt_sel)))),
		hex1 => rt_hex1,
		hex0 => rt_hex0
	);
	
	process(current_state, I)
	begin
		case current_state is
			when T0 =>
				next_state <= T1;
				
				opcode <= "0000";
				
				
				case I is
					when "0000" => -- load
						
					when "0001" => -- move
						
					when "0010" => -- and
						opcode <= 
					when "0011" => -- add
						
					when "0100" => -- sub, (A-B)
						
					when "0101" => -- sub, (B-A)
						
					when others => -- slt
						
				end case;
				
			when T1 =>
				next_state <= T2;
				
				case I is
					when "0000" => -- load
						
					when "0001" => -- move
						
					when "0010" => -- and
						
					when "0011" => -- add
						
					when "0100" => -- sub, (A-B)
						
					when "0101" => -- sub, (B-A)
						
					when others => -- slt
						
				end case;
				
			when T2 =>
				next_state <= T0;
				
				case I is
					when "0000" => -- load
						
					when "0001" => -- move
						
					when "0010" => -- and
						
					when "0011" => -- add
						
					when "0100" => -- sub, (A-B)
						
					when "0101" => -- sub, (B-A)
						
					when others => -- slt
						
				end case;
				
		end case;
	end process;
	
	process(clk, next_state)
	begin
		if rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;
	
	with I select opcode <=
		"0000" when "0000", -- load
		"0000" when "0001", -- move
		"0000" when "0010", -- and
		"0010" when "0011", -- add
		"0110" when "0100", -- sub == (A-B)
		"1010" when "0101", -- sub and negate == -(A-B) == (B-A)
		"0111" when others; -- slt
	
end architecture;
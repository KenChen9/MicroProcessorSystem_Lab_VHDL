library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity freq_div_100M is
    generic(
        CLK_DIV_BY: integer := 100_000_000
    );
    port(
        clk_in: in std_logic;
        clk_out: out std_logic
    );
end entity;

architecture rtl of freq_div_100M is
    signal counter, next_count: unsigned(63 downto 0) := (others => '0');
    signal clk_tmp: std_logic := '0';
begin
    next_count <= (others => '0') when counter = CLK_DIV_BY-1 else counter+1;
    counter <= next_count when rising_edge(clk_in);
    clk_tmp <= not clk_tmp when rising_edge(clk_in) and (counter = CLK_DIV_BY-1);
    clk_out <= clk_tmp;
end architecture;
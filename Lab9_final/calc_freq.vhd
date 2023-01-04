library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity calc_freq is
    port(
        rst: in std_logic;
        clk_05Hz: in std_logic;
        clk_nHz: in std_logic;
        count_nHz: out unsigned(63 downto 0)
    );
end entity;

architecture rtl of calc_freq is
    signal counter, next_count: unsigned(63 downto 0) := (others => '0');
begin
    next_count <= counter+1;
    counter <= 
        (others => '0') when (rst = '1') else
        next_count when rising_edge(clk_nHz) and (clk_05Hz = '1');
    count_nHz <= counter;
end architecture;
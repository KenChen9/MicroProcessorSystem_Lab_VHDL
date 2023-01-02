library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calc_freq is
  generic(
    COUNTER_BITS : integer := 64
  );
  port(
    rst : in std_logic;
    clk_nHz : in std_logic;
    clk_05Hz : in std_logic;
    nHz : out unsigned(COUNTER_BITS-1 downto 0)
  );
end entity;

architecture rtl of calc_freq is
  signal counter, next_count : unsigned(COUNTER_BITS-1 downto 0) := (others => '0');
begin
  next_count <= (others => '0') when (rst = '1') else (counter+1);
  counter <= next_count when (clk_05Hz = '1' and rising_edge(clk_nHz));
  nHz <= counter;
end architecture;
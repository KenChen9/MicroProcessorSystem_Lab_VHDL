library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_div_n is
  generic(
    CLK_DIV : integer := 50000000
  );
  port(
    clk_in : in std_logic;
    clk_out : buffer std_logic
  );
end entity;

architecture rtl of freq_div_n is
  signal counter, next_count : integer range 0 to CLK_DIV/2-1;
begin
  next_count <= 0 when (counter = CLK_DIV/2-1) else counter+1;
  counter <= next_count when rising_edge(clk_in);
  clk_out <= (not clk_out) when (counter = CLK_DIV/2-1);
end architecture;
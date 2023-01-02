library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_n is
  generic(
    DATA_BITS : integer := 8;
    SELECT_BITS : integer := 3
  );
  port(
    w : in std_logic_vector(DATA_BITS-1 downto 0);
    s : in std_logic_vector(SELECT_BITS-1 downto 0);
    f : out std_logic
  );
end entity;

architecture rtl of mux_n is
begin
  f <= w(to_integer(unsigned(s)));
end architecture;
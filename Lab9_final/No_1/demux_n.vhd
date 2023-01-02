library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_n is
  generic(
    DATA_BITS : integer := 8;
    SELECT_BITS : integer := 3
  );
  port(
    w : in std_logic;
    s : in std_logic_vector(SELECT_BITS-1 downto 0);
    f : out std_logic_vector(DATA_BITS-1 downto 0)
  );
end entity;

architecture rtl of demux_n is
begin
  demux_generate:
  for i in 0 to DATA_BITS-1 generate
    f(i) <= w when (to_integer(unsigned(s)) = i) else 'Z';
  end generate;
end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_n is
  generic(
    OPERAND_BITS : integer := 1
  );
  port(
    a, b : in unsigned(OPERAND_BITS-1 downto 0);
    f : out std_logic
  );
end entity;

architecture rtl of comp_n is
begin
  f <= '1' when (a > b) else '0';
end architecture;
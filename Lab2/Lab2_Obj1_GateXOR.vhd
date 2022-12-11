library ieee;
use ieee.std_logic_1164.all;

entity GateXOR is
    port(
        signal a, b: in std_logic;
        signal s: out std_logic
    );
end entity GateXOR;

architecture logic of GateXOR is
begin
    s <= a xor b;
end architecture logic;
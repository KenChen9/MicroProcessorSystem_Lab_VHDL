library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        signal a, b, cin: in std_logic;
        signal s, cout: out std_logic
    );
end entity FullAdder;

architecture logic of FullAdder is
begin
    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end architecture logic;
library ieee;
use ieee.std_logic_1164.all;

package Suber8bTo7Seg_package is
    component FullAdder
        port(
            signal a, b, cin: in std_logic;
            signal s, cout: out std_logic
        );
    end component FullAdder;
    component C7Seg
        port(
            signal sw: in std_logic_vector(3 downto 0);
            signal led: out std_logic_vector(6 downto 0)
        );
    end component C7Seg;
    component GateXOR
        port(
            signal a, b: in std_logic;
            signal s: out std_logic
        );
    end component GateXOR;
end package Suber8bTo7Seg_package;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY LED7 IS
    PORT(
        SIGNAL sw : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        SIGNAL led : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ENTITY LED7;

ARCHITECTURE Behavior OF LED7 IS
BEGIN
    led(6) <= (sw(3) and sw(2) and not sw(1)) or (sw(3) and not sw(2) and sw(1) and sw(0)) or (not sw(3) and not sw(2) and not sw(1) and sw(0)) or (sw(2) and not sw(1) and not sw(0));
    led(5) <= (sw(3) and sw(2) and sw(1)) or (sw(3) and sw(2) and not sw(0)) or (sw(3) and sw(1) and sw(0)) or (not sw(3) and sw(2) and not sw(1) and sw(0)) or (sw(2) and sw(1) and not sw(0));
    led(4) <= (sw(3) and sw(2) and sw(1)) or (sw(3) and sw(2) and not sw(0)) or (not sw(3) and not sw(2) and sw(1) and not sw(0));
    led(3) <= (sw(3) and not sw(2) and sw(1) and not sw(0)) or (not sw(3) and sw(2) and not sw(1) and not sw(0)) or (not sw(3) and not sw(2) and not sw(1) and sw(0)) or (sw(2) and sw(1) and sw(0));
    led(2) <= (not sw(3) and sw(2) and not sw(1)) or (not sw(3) and sw(0)) or (not sw(2) and not sw(1) and sw(0));
    led(1) <= (sw(3) and sw(2) and not sw(1)) or (not sw(3) and not sw(2) and sw(1)) or (not sw(3) and not sw(2) and sw(0)) or (not sw(3) and sw(1) and sw(0));
    led(0) <= (not sw(3) and sw(2) and sw(1) and sw(0)) or (not sw(3) and not sw(2) and not sw(1));
END ARCHITECTURE Behavior;
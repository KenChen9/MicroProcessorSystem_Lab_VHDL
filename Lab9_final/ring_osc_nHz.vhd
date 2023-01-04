library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ring_osc_nHz is
    generic(
        LEVEL: integer := 7
    );
    port(
        enable: in std_logic;
        clk_nHz: out std_logic
    );
end entity;

architecture rtl of ring_osc_nHz is
    signal ro_array: std_logic_vector(LEVEL-1 downto 0) := (others => '0');
    attribute syn_keep: boolean;
    attribute syn_keep of ro_array: signal is true;
begin
    gen_rest_ring:
    for i in 0 to LEVEL-2 generate
        ro_array(i+1) <= not ro_array(i) after ((i+2)*1)*1 ns;
    end generate;
    ro_array(0) <= enable and (not ro_array(LEVEL-1)) after 1 ns;
    clk_nHz <= ro_array(0);
end architecture;

-- Top-level PUF
-- Requirements: freq_div_100M, ring_osc_nHz, calc_freq(counter)
-- Expected output: 1, 0, 1, 1, 0, 1, 1, 0
-- Operation sequence:
--  1. 000(0)reset
--  2. 001(1)reset
--  3. 011
--  4. 010(1)reset
--  5. 011(3)reset
--  6. 111
--  7. 101
--  8. 100(4)reset
--  9. 101(5)reset
-- 10. 111
-- 11. 110(6)reset
-- 12. 111(7)reset

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PUF is
    port(
        rst: in std_logic;
        clk_50MHz: in std_logic;
        sel: in integer range 0 to 7;
        leds: out std_logic_vector(0 to 7)
    );
end entity;

architecture rtl of PUF is
	 type ID_t is array(0 to 7) of integer range 0 to 7;
    constant ID0: ID_t := (1, 1, 0, 5, 7, 0, 0, 6); -- 110590065
    constant ID1: ID_t := (6, 0, 1, 9, 5, 1, 1, 1); -- 110590062
    signal clk_05Hz: std_logic := '0';
    signal clk_nHz_array0, clk_nHz_array1: std_logic_vector(0 to 7) := (others => '0');
    signal count_nHz0, count_nHz1: unsigned(63 downto 0) := (others => '0');
    signal comp_result: std_logic := '0';
    signal leds_data_storage: std_logic_vector(0 to 7) := (others => 'Z');
begin
    i_freq_div_100M: work.freq_div_100M(rtl)
    port map(
        clk_in => clk_50MHz,
        clk_out => clk_05Hz
    );
    gen_ro_array_for_ID0:
    for i in 0 to 7 generate
        i_ring_osc_nHz: work.ring_osc_nHz(rtl)
        generic map(
            LEVEL => 2*ID0(i)+7
        )
        port map(
            enable => clk_05Hz,
            clk_nHz => clk_nHz_array0(i)
        );
    end generate;
    gen_ro_array_for_ID1:
    for i in 0 to 7 generate
        i_ring_osc_nHz: work.ring_osc_nHz(rtl)
        generic map(
            LEVEL => 2*ID1(i)+7
        )
        port map(
            enable => clk_05Hz,
            clk_nHz => clk_nHz_array1(i)
        );
    end generate;
    i0_calc_freq: work.calc_freq(rtl)
    port map(
        rst => rst,
        clk_05Hz => clk_05Hz,
        clk_nHz => clk_nHz_array0(sel),
        count_nHz => count_nHz0
    );
    i1_calc_freq: work.calc_freq(rtl)
    port map(
        rst => rst,
        clk_05Hz => clk_05Hz,
        clk_nHz => clk_nHz_array1(sel),
        count_nHz => count_nHz1
    );
    comp_result <= '1' when (count_nHz0 > count_nHz1) else '0';
    process(sel, comp_result)
    begin
        leds_data_storage(sel) <= comp_result;
    end process;
    leds <= leds_data_storage;
end architecture;
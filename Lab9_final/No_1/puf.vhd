library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Lab9_package.all;

entity puf is
  generic(
    ID_LENGTH : integer := 8;
	 COUNTER_BITS : integer := 64
  );
  port(
    rst : in std_logic;
    clk_50MHz : in std_logic;
    sel : in std_logic_vector(2 downto 0);
    leds : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of puf is
  signal clk_1Hz, clk_05Hz : std_logic;
  signal mux0_8_w, mux1_8_w : std_logic_vector(ID_LENGTH-1 downto 0);
  signal mux0_8_f, mux1_8_f : std_logic;
  signal nHz0, nHz1 : unsigned(COUNTER_BITS-1 downto 0);
  signal comp_1_f : std_logic;
  
  type std_logic_aoa is array(0 to ID_LENGTH-1) of std_logic_vector(3 downto 0);
  constant ID_1 : std_logic_aoa := (x"1", x"1", x"0", x"5", x"9", x"0", x"0", x"6");
  constant ID_2 : std_logic_aoa := (x"2", x"6", x"0", x"0", x"9", x"5", x"0", x"1");
begin
  -- ===== freq_div_50M =====

  freq_div_50M: freq_div_n
  generic map(
    CLK_DIV => 50000000
  )
  port map(
    clk_in => clk_50MHz,
    clk_out => clk_1Hz
  );
  
  -- ===== freq_div_2 =====
  
  freq_div_2: freq_div_n
  generic map(
    CLK_DIV => 2
  )
  port map(
    clk_in => clk_1Hz,
    clk_out => clk_05Hz
  );
  
  -- ===== ring_osc_array0 =====
  
  ring_osc_array0:
  for i in ID_LENGTH-1 downto 0 generate
    ring_osc0_i: entity work.ring_osc_n(rtl)
    generic map(
      LEVEL => to_integer(unsigned(ID_1(i)))
    )
    port map(
      enable => clk_05Hz,
      clk_nHz => mux0_8_w(i)
    );
  end generate;
  
  -- ===== ring_osc_array1 =====
  
  ring_osc_array1:
  for i in ID_LENGTH-1 downto 0 generate
    ring_osc1_i: entity work.ring_osc_n(rtl)
    generic map(
      LEVEL => to_integer(unsigned(ID_2(i)))
    )
    port map(
      enable => clk_05Hz,
      clk_nHz => mux1_8_w(i)
    );
  end generate;
  
  -- ===== mux0_8 =====
  
  mux0_8: mux_n
  generic map(
    DATA_BITS => ID_LENGTH,
    SELECT_BITS => 3 -- cannot easily take log2 function in VHDL
  )
  port map(
    w => mux0_8_w,
    s => sel,
    f => mux0_8_f
  );
  
  -- ===== mux1_8 =====
  
  mux1_8: mux_n
  generic map(
    DATA_BITS => ID_LENGTH,
    SELECT_BITS => 3 -- cannot easily take log2 function in VHDL
  )
  port map(
    w => mux1_8_w,
    s => sel,
    f => mux1_8_f
  );
  
  -- ===== calc_freq0 =====
  
  calc_freq0: calc_freq
  generic map(
    COUNTER_BITS => COUNTER_BITS
  )
  port map(
    rst => rst,
	 clk_nHz => mux0_8_f,
	 clk_05Hz => clk_05Hz,
	 nHz => nHz0
  );
  
  -- ===== calc_freq1 =====
  
  calc_freq1: calc_freq
  generic map(
    COUNTER_BITS => COUNTER_BITS
  )
  port map(
    rst => rst,
	 clk_nHz => mux1_8_f,
	 clk_05Hz => clk_05Hz,
	 nHz => nHz1
  );
  
  -- ===== comp_1 =====
  
  comp_1: comp_n
  generic map(
    OPERAND_BITS => COUNTER_BITS
  )
  port map(
    a => nHz0,
    b => nHz1,
    f => comp_1_f
  );
  
  -- ===== demux_8 =====
  
  demux_8: demux_n
  generic map(
    DATA_BITS => ID_LENGTH,
    SELECT_BITS => 3 -- cannot easily take log2 function in VHDL
  )
  port map(
    w => comp_1_f,
    s => sel,
    f => leds
  );
end architecture;
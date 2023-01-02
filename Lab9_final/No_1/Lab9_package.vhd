library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Lab9_package is
  component freq_div_n is
    generic(
      CLK_DIV : integer := 50000000
    );
    port(
      clk_in : in std_logic;
      clk_out : buffer std_logic
    );
  end component;
  component ring_osc_n is
    generic(
      LEVEL : integer := 0
    );
    port(
      enable : in std_logic;
      clk_nHz : out std_logic
    );
  end component;
  component mux_n is
    generic(
      DATA_BITS : integer := 8;
      SELECT_BITS : integer := 3
    );
    port(
      w : in std_logic_vector(DATA_BITS-1 downto 0);
      s : in std_logic_vector(SELECT_BITS-1 downto 0);
      f : out std_logic
    );
  end component;
  component calc_freq is
    generic(
      COUNTER_BITS : integer := 64
    );
    port(
      rst : in std_logic;
      clk_nHz : in std_logic;
      clk_05Hz : in std_logic;
      nHz : out unsigned(COUNTER_BITS-1 downto 0)
    );
  end component;
  component comp_n is
    generic(
      OPERAND_BITS : integer := 1
    );
    port(
      a, b : in unsigned(OPERAND_BITS-1 downto 0);
      f : out std_logic
    );
  end component;
  component demux_n is
    generic(
      DATA_BITS : integer := 8;
      SELECT_BITS : integer := 3
    );
    port(
      w : in std_logic;
      s : in std_logic_vector(SELECT_BITS-1 downto 0);
      f : out std_logic_vector(DATA_BITS-1 downto 0)
    );
  end component;
end package;
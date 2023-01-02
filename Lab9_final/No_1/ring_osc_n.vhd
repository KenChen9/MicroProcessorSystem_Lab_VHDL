library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ring_osc_n is
  generic(
    LEVEL : integer := 3
  );
  port(
    enable : in std_logic;
    clk_nHz : out std_logic
  );
end entity;

architecture tff of ring_osc_n is
  signal chain : std_logic_vector((2*(LEVEL-1)+7)-1 downto 0);
  attribute syn_keep : boolean;
  attribute syn_keep of chain : signal is true;
begin
  
end architecture;

architecture rtl of ring_osc_n is
  signal chain : std_logic_vector((2*(LEVEL-1)+7)-1 downto 0);
  attribute syn_keep : boolean;
  attribute syn_keep of chain : signal is true;
begin
  -- after 10 ns
  -- after (10*(i+2))*1 ns
  rest_chain:
  for i in 0 to (2*(LEVEL-1)+7)-2 generate
    chain(i+1) <= not chain(i) after (10*(i+2))*1 ns;
  end generate;
  chain(0) <= enable and (not chain((2*(LEVEL-1)+7)-1)) after 10 ns;
  clk_nHz <= chain(0);
end architecture;
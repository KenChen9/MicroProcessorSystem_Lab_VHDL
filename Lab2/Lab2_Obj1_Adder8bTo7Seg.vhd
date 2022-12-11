library ieee;
use ieee.std_logic_1164.all;
use work.Adder8bTo7Seg_package.all;

entity Adder8bTo7Seg is
    port(
        signal Aouter, Bouter: in std_logic_vector(7 downto 0);
        signal LEDouter1, LEDouter2: out std_logic_vector(6 downto 0);
		  signal overflow: out std_logic
    );
end entity Adder8bTo7Seg;

architecture logic of Adder8bTo7Seg is
    signal Sinner, COUTinner: std_logic_vector(7 downto 0);
begin
    stage0: FullAdder port map (Aouter(0), Bouter(0), '0', Sinner(0), COUTinner(0));
    stage1: FullAdder port map (Aouter(1), Bouter(1), COUTinner(0), Sinner(1), COUTinner(1));
    stage2: FullAdder port map (Aouter(2), Bouter(2), COUTinner(1), Sinner(2), COUTinner(2));
    stage3: FullAdder port map (Aouter(3), Bouter(3), COUTinner(2), Sinner(3), COUTinner(3));
    stage4: FullAdder port map (Aouter(4), Bouter(4), COUTinner(3), Sinner(4), COUTinner(4));
    stage5: FullAdder port map (Aouter(5), Bouter(5), COUTinner(4), Sinner(5), COUTinner(5));
    stage6: FullAdder port map (Aouter(6), Bouter(6), COUTinner(5), Sinner(6), COUTinner(6));
    stage7: FullAdder port map (Aouter(7), Bouter(7), COUTinner(6), Sinner(7), COUTinner(7));
    
    stage8: C7Seg port map (Sinner(3 downto 0), LEDouter1);
    stage9: C7Seg port map (Sinner(7 downto 4), LEDouter2);
	 
	 stage10: GateXOR port map (COUTinner(7), COUTinner(6), overflow);
end architecture logic;
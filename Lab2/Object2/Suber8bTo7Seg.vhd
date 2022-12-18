library ieee;
use ieee.std_logic_1164.all;
use work.Suber8bTo7Seg_package.all;

entity Suber8bTo7Seg is
    port(
        signal Aouter, Bouter: in std_logic_vector(7 downto 0);
        signal LEDouter1, LEDouter2: out std_logic_vector(6 downto 0);
		  signal overflow: out std_logic
    );
end entity Suber8bTo7Seg;

architecture logic of Suber8bTo7Seg is
    signal Sinner, COUTinner: std_logic_vector(7 downto 0);
	 signal BouterInverse: std_logic_vector(7 downto 0);
begin
    stage0: GateXOR port map (Bouter(0), '1', BouterInverse(0));
    stage1: GateXOR port map (Bouter(1), '1', BouterInverse(1));
    stage2: GateXOR port map (Bouter(2), '1', BouterInverse(2));
    stage3: GateXOR port map (Bouter(3), '1', BouterInverse(3));
    stage4: GateXOR port map (Bouter(4), '1', BouterInverse(4));
    stage5: GateXOR port map (Bouter(5), '1', BouterInverse(5));
    stage6: GateXOR port map (Bouter(6), '1', BouterInverse(6));
    stage7: GateXOR port map (Bouter(7), '1', BouterInverse(7));
	 
	 stage8: FullAdder port map (Aouter(0), BouterInverse(0), '1', Sinner(0), COUTinner(0));
    stage9: FullAdder port map (Aouter(1), BouterInverse(1), COUTinner(0), Sinner(1), COUTinner(1));
    stage10: FullAdder port map (Aouter(2), BouterInverse(2), COUTinner(1), Sinner(2), COUTinner(2));
    stage11: FullAdder port map (Aouter(3), BouterInverse(3), COUTinner(2), Sinner(3), COUTinner(3));
    stage12: FullAdder port map (Aouter(4), BouterInverse(4), COUTinner(3), Sinner(4), COUTinner(4));
    stage13: FullAdder port map (Aouter(5), BouterInverse(5), COUTinner(4), Sinner(5), COUTinner(5));
    stage14: FullAdder port map (Aouter(6), BouterInverse(6), COUTinner(5), Sinner(6), COUTinner(6));
    stage15: FullAdder port map (Aouter(7), BouterInverse(7), COUTinner(6), Sinner(7), COUTinner(7));
    
    stage16: C7Seg port map (Sinner(3 downto 0), LEDouter1);
    stage17: C7Seg port map (Sinner(7 downto 4), LEDouter2);
	 
	 stage18: GateXOR port map (COUTinner(7), COUTinner(6), overflow);
end architecture logic;
library ieee;
use ieee.std_logic_1164.all;

entity FSM is
    port(
        signal clk, reset, w : in std_logic;
        signal output : out std_logic_vector(2 downto 0)
    );
end entity;

architecture Behavior of FSM is
    type State_type is (Start, S1, S2a, S2b, S3, S4);
    attribute enum_encoding : string;
    attribute enum_encoding of State_type : type is "sequential";
    signal y_present, y_next : State_type;
begin
    state_change: process (y_present, w)
    begin
        case y_present is
            when Start =>
                if w = '0' then
                    y_next <= Start;
                else
                    y_next <= S1;
                end if;
            when S1 =>
                if w = '0' then
                    y_next <= S2a;
                else
                    y_next <= S2b;
                end if;
            when S2a =>
                y_next <= S3;
            when S2b =>
                y_next <= S3;
            when S3 =>
                if w = '0' then
                    y_next <= S1;
                else
                    y_next <= S4;
                end if;
            when S4 =>
                y_next <= S4;
        end case;
    end process;
    
    clk_behavior: process (clk, reset)
    begin
        if reset = '0' then
            y_present <= Start;
        elsif clk'event and clk = '1' then
            y_present <= y_next;
        end if;
    end process;
    
    convert_state_type_to_output: process (y_present)
    begin
        case y_present is
            when Start =>
                output <= "000";
            when S1 =>
                output <= "001";
            when S2a =>
                output <= "010";
            when S2b =>
                output <= "011";
            when S3 =>
                output <= "100";
            when S4 =>
                output <= "101";
        end case;
    end process;
end architecture;
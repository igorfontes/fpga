library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister is
    port(
        d: in std_logic;
        clock: in std_logic;
        clear: in std_logic;
        q: inout std_logic_vector(3 downto 0);
        RtoL: in std_logic
    );
end ShiftRegister;

architecture behv of ShiftRegister is
begin
    process(d, RtoL, clock, clear)
    begin
        if (clear = '1') then
            q <= "0000";
        elsif (clock'event and clock = '1' and RtoL = '1') then
            q(3) <= d;
            q(2 downto 0) <= q(3 downto 1);
        elsif (clock'event and clock = '1' and RtoL = '0') then
            q(0) <= d;
            q(3 downto 1) <= q(2 downto 0);
        end if;
    end process;
end behv;
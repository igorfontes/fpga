library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister is
    generic(n: natural:=4);
    port(
        d: in std_logic;
        clock: in std_logic;
        clear: in std_logic;
        q: inout std_logic_vector(n downto 0);
        RtoL: in std_logic
    );
end ShiftRegister;

architecture behv of ShiftRegister is
begin
    process(d, clock, clear, RtoL)
    begin
        if (clear = '1') then
            q <= (q'range => "0");
        elsif (clock'event and clock = '1' and RtoL = '1') then
            q(n-1) <= d;
            q(n-2 downto 0) <= q(n-1 downto 1);
        elsif (clock'event and clock = '1' and RtoL = '0') then
            q(0) <= d;
            q(n-1 downto 1) <= q(n-2 downto 0);
        end if;
    end process;
end behv;
            
            
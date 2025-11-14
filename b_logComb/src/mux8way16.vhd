library ieee;
use ieee.std_logic_1164.all;

entity Mux8Way16 is
    port (
        a, b, c, d, e, f, g, h: in  std_logic_vector(15 downto 0);
        sel:                    in  std_logic_vector(2 downto 0);
        q:                      out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavioral of Mux8Way16 is
begin
    process(a, b, c, d, e, f, g, h, sel)
    begin
        case sel is
            when "000" => q <= a;
            when "001" => q <= b;
            when "010" => q <= c;
            when "011" => q <= d;
            when "100" => q <= e;
            when "101" => q <= f;
            when "110" => q <= g;
            when "111" => q <= h;
            when others => q <= (others => 'X'); -- Indefinido
        end case;
    end process;
end architecture;
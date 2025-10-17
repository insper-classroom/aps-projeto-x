library ieee;
use ieee.std_logic_1164.all;

entity DMux8Way is
    port (
        a:   in  std_logic;
        sel: in  std_logic_vector(2 downto 0);
        q0:  out std_logic;
        q1:  out std_logic;
        q2:  out std_logic;
        q3:  out std_logic;
        q4:  out std_logic;
        q5:  out std_logic;
        q6:  out std_logic;
        q7:  out std_logic
    );
end entity;

architecture behavioral of DMux8Way is
begin
    process(a, sel)
    begin
        -- Define um valor padrão para todas as saídas
        q0 <= '0'; q1 <= '0'; q2 <= '0'; q3 <= '0';
        q4 <= '0'; q5 <= '0'; q6 <= '0'; q7 <= '0';

        case sel is
            when "000" => q0 <= a;
            when "001" => q1 <= a;
            when "010" => q2 <= a;
            when "011" => q3 <= a;
            when "100" => q4 <= a;
            when "101" => q5 <= a;
            when "110" => q6 <= a;
            when "111" => q7 <= a;
            when others => null;
        end case;
    end process;
end architecture;
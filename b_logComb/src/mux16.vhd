library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
  port (
    a   : in  std_logic_vector(15 downto 0);
    b   : in  std_logic_vector(15 downto 0);
    sel : in  std_logic;
    q   : out std_logic_vector(15 downto 0)
  );
end entity mux16;

architecture arch of mux16 is
begin
  with sel select
    q <= a when '0',
         b when others;
end architecture;

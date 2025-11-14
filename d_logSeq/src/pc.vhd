-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0) 
    );
end entity;

architecture arch of PC is


    signal current_out        : std_logic_vector(15 downto 0); 
    signal incremented_out    : std_logic_vector(15 downto 0); 
    signal inc_or_hold        : std_logic_vector(15 downto 0); 
    signal load_or_func       : std_logic_vector(15 downto 0); 
    signal next_value         : std_logic_vector(15 downto 0); 
    
    component Inc16 is
        port(
            a   :  in STD_LOGIC_VECTOR(15 downto 0);
            q   : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;

    component Register16 is
        port(
            clock:   in STD_LOGIC;
            input:   in STD_LOGIC_VECTOR(15 downto 0);
            load:    in STD_LOGIC;
            output: out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;

    component Mux16 is
        port (
            a:   in STD_LOGIC_VECTOR(15 downto 0);
            b:   in STD_LOGIC_VECTOR(15 downto 0);
            sel: in  STD_LOGIC;
            q:   out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;


begin

    output <= current_out;


    INC1: Inc16 port map(
        a => current_out,
        q => incremented_out
    );

    MUX_INC: Mux16 port map(
        a => current_out,
        b => incremented_out,
        sel => increment,
        q => inc_or_hold
    );


    MUX_LOAD: Mux16 port map(
        a => inc_or_hold,
        b => input,
        sel => load,
        q => load_or_func
    );


    with reset select
        next_value <= (others => '0') when '1', 
                      load_or_func    when others; 


    REG: Register16 port map(
        clock  => clock,
        input  => next_value,
        load   => '1', 
        output => current_out 
    );

end architecture;
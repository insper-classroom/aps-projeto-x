-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
    port(
        clock:   in  STD_LOGIC;
        input:   in  STD_LOGIC_VECTOR(15 downto 0);
        load:    in  STD_LOGIC;
        address: in  STD_LOGIC_VECTOR(11 downto 0);
        output:  out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of Ram4K is

    component Ram512 is
        port(
            clock:   in  STD_LOGIC;
            input:   in  STD_LOGIC_VECTOR(15 downto 0);
            load:    in  STD_LOGIC;
            address: in  STD_LOGIC_VECTOR( 8 downto 0);
            output:  out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Mux8Way16 is
        port (
                a:   in  STD_LOGIC_VECTOR(15 downto 0);
                b:   in  STD_LOGIC_VECTOR(15 downto 0);
                c:   in  STD_LOGIC_VECTOR(15 downto 0);
                d:   in  STD_LOGIC_VECTOR(15 downto 0);
                e:   in  STD_LOGIC_VECTOR(15 downto 0);
                f:   in  STD_LOGIC_VECTOR(15 downto 0);
                g:   in  STD_LOGIC_VECTOR(15 downto 0);
                h:   in  STD_LOGIC_VECTOR(15 downto 0);
                sel: in  STD_LOGIC_VECTOR( 2 downto 0);
                q:   out STD_LOGIC_VECTOR(15 downto 0));
    end component;

    component DMux8Way is
        port (
            a:   in  STD_LOGIC;
            sel: in  STD_LOGIC_VECTOR(2 downto 0);
            q0:  out STD_LOGIC;
            q1:  out STD_LOGIC;
            q2:  out STD_LOGIC;
            q3:  out STD_LOGIC;
            q4:  out STD_LOGIC;
            q5:  out STD_LOGIC;
            q6:  out STD_LOGIC;
            q7:  out STD_LOGIC);
    end component;

    signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
    signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);
    signal address_sel : STD_LOGIC_VECTOR(2 downto 0);
    signal address_ram : STD_LOGIC_VECTOR(8 downto 0);

begin

    -- Mapeia os bits de endereço para a seleção do banco (3 MSB) e endereço interno (9 LSB)
    address_sel <= address(11 downto 9);
    address_ram <= address(8 downto 0);

    -- O DMux direciona o sinal de 'load' para o Ram512 correto
    dmux_load : DMux8Way
        port map(
            a   => load,
            sel => address_sel,
            q0  => load0,
            q1  => load1,
            q2  => load2,
            q3  => load3,
            q4  => load4,
            q5  => load5,
            q6  => load6,
            q7  => load7
        );

    -- Instanciação dos 8 bancos de memória Ram512
    ram0 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load0,
            address => address_ram,
            output  => output0
        );

    ram1 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load1,
            address => address_ram,
            output  => output1
        );

    ram2 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load2,
            address => address_ram,
            output  => output2
        );

    ram3 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load3,
            address => address_ram,
            output  => output3
        );

    ram4 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load4,
            address => address_ram,
            output  => output4
        );

    ram5 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load5,
            address => address_ram,
            output  => output5
        );

    ram6 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load6,
            address => address_ram,
            output  => output6
        );

    ram7 : Ram512
        port map(
            clock   => clock,
            input   => input,
            load    => load7,
            address => address_ram,
            output  => output7
        );

    -- O Mux seleciona a saída do Ram512 correto para a saída geral
    mux_output : Mux8Way16
        port map(
            a   => output0,
            b   => output1,
            c   => output2,
            d   => output3,
            e   => output4,
            f   => output5,
            g   => output6,
            h   => output7,
            sel => address_sel,
            q   => output
        );

end architecture;
-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC :='0'               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is


  signal jgt : STD_LOGIC; --  pulo se resultado > 0 (NOT ng AND NOT zr)
  signal jeq : STD_LOGIC; -- pulo se resultado = 0 (zr)
  signal jlt : STD_LOGIC; -- pulo se resultado < 0 (ng)
  signal jump_cond : STD_LOGIC; -- pulo

begin
    

  loadD <= instruction(17) and instruction(4);


  loadM <= instruction(17) and instruction(5);


  loadA <= (not instruction(17)) or (instruction(17) and instruction(3));

  muxALUI_A <= not instruction(17);
  muxAM <= instruction(17) and instruction(13);
  zx <= instruction(17) and instruction(12);
    

  nx <= instruction(17) and instruction(11);
    
  zy <= instruction(17) and instruction(10);
    

  ny <= instruction(17) and instruction(9);
    

  f <= instruction(17) and instruction(8);
    

  no <= instruction(17) and instruction(7);

    

  jgt <= (not ng) and (not zr); -- Salta se > 0
  jeq <= zr;                    -- Salta se = 0
  jlt <= ng;                    -- Salta se < 0

  jump_cond <= (instruction(2) and jlt) or (instruction(1) and jeq) or (instruction(0) and jgt);

  loadPC <= instruction(17) and jump_cond;

end architecture;

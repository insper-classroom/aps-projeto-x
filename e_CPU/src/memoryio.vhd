-- Elementos de Sistemas
-- Módulo: MemoryIO
-- Descrição: Implementa o mapa de memória para a CPU Z01.
--            Decodifica endereços para acessar a RAM, o controlador de tela (Screen)
--            e um registrador para os LEDs.
-- Autor: (Seu Nome/Grupo)
-- Data: 17/10/2025

library ieee;
use ieee.std_logic_1164.all;

entity MemoryIO is
    port (
        -- Entradas de Controle e Clocks
        CLK_FAST   : in std_logic;
        CLK_SLOW   : in std_logic;
        RESET      : in std_logic; -- Necessário para o componente Screen
        LOAD       : in std_logic; -- Sinal de escrita da CPU (writeM)
        SW         : in std_logic; -- Chave para selecionar a saída (conforme diagrama)

        -- Barramentos Principais da CPU
        ADDRESS    : in std_logic_vector(15 downto 0);
        INPUT      : in std_logic_vector(15 downto 0);

        -- Saídas para a CPU e Periféricos
        OUTPUT     : out std_logic_vector(15 downto 0);
        LED        : out std_logic_vector(9 downto 0);
        
        -- Saídas Físicas para o LCD (do componente Screen)
        LCD_CS_N     : out   std_logic;
        LCD_D        : inout std_logic_vector(15 downto 0);
        LCD_RD_N     : out   std_logic;
        LCD_RESET_N  : out   std_logic;
        LCD_RS       : out   std_logic;
        LCD_WR_N     : out   std_logic;
        LCD_INIT_OK  : out   std_logic
    );
end entity MemoryIO;

architecture Behavioral of MemoryIO is

    -- ===================================================================
    -- 1. DECLARAÇÃO DE CONSTANTES E COMPONENTES
    -- ===================================================================

    -- Constante para o endereço do periférico LED
    constant LED_ADDRESS : std_logic_vector(15 downto 0) := x"52C0"; -- Endereço 21184

    -- Declaração dos componentes utilizados
    component RAM16K is
        port (
            address : in  std_logic_vector(13 downto 0);
            clock   : in  std_logic;
            data    : in  std_logic_vector(15 downto 0);
            wren    : in  std_logic;
            q       : out std_logic_vector(15 downto 0)
        );
    end component;

    component Screen is
        port (
            INPUT       : in    std_logic_vector(15 downto 0);
            LOAD        : in    std_logic;
            ADDRESS     : in    std_logic_vector(13 downto 0);
            LCD_INIT_OK : out   std_logic;
            CLK_SLOW    : in    std_logic;
            CLK_FAST    : in    std_logic;
            RST         : in    std_logic;
            LCD_CS_N    : out   std_logic;
            LCD_D       : inout std_logic_vector(15 downto 0);
            LCD_RD_N    : out   std_logic;
            LCD_RESET_N : out   std_logic;
            LCD_RS      : out   std_logic;
            LCD_WR_N    : out   std_logic
        );
    end component;

    component Register16 is
        port (
            clock  : in  std_logic;
            input  : in  std_logic_vector(15 downto 0);
            load   : in  std_logic;
            output : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Sinais internos para conectar os componentes e lógica
    signal ram_write_enable   : std_logic;
    signal screen_load_enable : std_logic;
    signal led_load_enable    : std_logic;
    signal ram_data_out       : std_logic_vector(15 downto 0);
    signal reg_led_output     : std_logic_vector(15 downto 0);

begin

    -- ===================================================================
    -- 2. LÓGICA DE DECODIFICAÇÃO DE ENDEREÇO (MAPA DE MEMÓRIA)
    -- ===================================================================
    -- Esta é a lógica central do MemoryIO. Ela ativa o sinal de escrita
    -- ('load' ou 'wren') do periférico correto com base no endereço.
    -- A escrita só ocorre se o sinal geral 'LOAD' da CPU estiver ativo.

    -- RAM (0x0000 a 0x3FFF): Ativa se os 2 bits mais altos do endereço forem "00"
    ram_write_enable <= '1' when LOAD = '1' and ADDRESS(15 downto 14) = "00" else '0';

    -- Screen (0x4000 a 0x7FFF): Ativa se os 2 bits mais altos forem "01"
    screen_load_enable <= '1' when LOAD = '1' and ADDRESS(15 downto 14) = "01" else '0';
    
    -- LED (endereço 0x52C0): Ativa se o endereço for exatamente 21184
    led_load_enable <= '1' when LOAD = '1' and ADDRESS = LED_ADDRESS else '0';


    -- ===================================================================
    -- 3. INSTANCIAÇÃO DOS COMPONENTES
    -- ===================================================================

    -- Instancia a RAM16K
    U_RAM16K: RAM16K
        port map (
            address => ADDRESS(13 downto 0),
            clock   => CLK_FAST,
            data    => INPUT,
            wren    => ram_write_enable,
            q       => ram_data_out
        );

    -- Instancia o controlador da Screen
    U_SCREEN: Screen
        port map (
            INPUT       => INPUT,
            LOAD        => screen_load_enable,
            ADDRESS     => ADDRESS(13 downto 0),
            CLK_SLOW    => CLK_SLOW,
            CLK_FAST    => CLK_FAST,
            RST         => RESET,
            LCD_INIT_OK => LCD_INIT_OK,
            LCD_CS_N    => LCD_CS_N,
            LCD_D       => LCD_D,
            LCD_RD_N    => LCD_RD_N,
            LCD_RESET_N => LCD_RESET_N,
            LCD_RS      => LCD_RS,
            LCD_WR_N    => LCD_WR_N
        );

    -- Instancia um Registrador de 16 bits para controlar os LEDs
    U_LED_REGISTER: Register16
        port map (
            clock  => CLK_SLOW,
            input  => INPUT,
            load   => led_load_enable,
            output => reg_led_output
        );


    -- ===================================================================
    -- 4. LÓGICA DAS SAÍDAS
    -- ===================================================================

    -- Conecta os 10 bits menos significativos da saída do registrador aos LEDs
    LED <= reg_led_output(9 downto 0);

    -- A saída principal 'OUTPUT' permite ler dados. Conforme o diagrama,
    -- a CPU só pode ler da RAM. A chave SW serve para bypassar
    -- a RAM e mostrar a entrada INPUT diretamente (útil para debug).
    OUTPUT <= INPUT when SW = '1' else ram_data_out;

end architecture Behavioral;
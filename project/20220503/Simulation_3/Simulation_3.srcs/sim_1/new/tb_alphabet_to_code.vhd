------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.bus_multiplexer_pkg.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_alphabet_to_code is
    -- Entity of testbench is always empty
end entity tb_alphabet_to_code;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_alphabet_to_code is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset : std_logic;
    
    signal s_code   : array_vector;
    signal s_text : string(32 downto 1);

begin
    -- Connecting testbench signals with driver_7seg_8characters
    -- entity (Unit Under Test)

    uut_alphabet_code : entity work.alphabet_code
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            text_i => s_text,
            code_o => s_code
        );


    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 1000 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
         
        -- Reset activated
        s_reset <= '1';
        wait for 12 ns;
        s_reset <= '0';
 
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- TEST INPUT VALUE "01234567"
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
       s_text <= "Ahoj Ahoj Ahoj Ahoj Ahoj Ahoj Ah";
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        

end architecture testbench;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2022 17:40:57
-- Design Name: 
-- Module Name: tb_newtop - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.bus_multiplexer_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_newtop is
--  Port ( );
end tb_newtop;

architecture Behavioral of tb_newtop is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset : std_logic;
    signal CA : STD_LOGIC;
    signal CB : STD_LOGIC;
    signal       CC : STD_LOGIC;
          signal CD : STD_LOGIC;
       signal    CE : STD_LOGIC;
    signal       CF : STD_LOGIC;
          signal CG : STD_LOGIC;
   signal        AN : std_logic_vector (7 downto 0);
     signal      SW :  STD_LOGIC_vector(15 downto 0);
     signal BTND : std_logic;
    
    
begin
uut_newtop : entity work.newtop
        port map(
            CLK100MHZ => s_clk_100Mhz,
            CA => CA,
           CB => CB,
           CC => CC,
           CD => CD,
           CE => CE,
           CF => CF,
           CG => CG,
           AN => AN,
           BTNC => s_reset,
           SW => SW,
           BTND => btnd
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
        wait for 300 ns;
        btnd <= '1';
        wait for 12 ns;
        btnd <= '0';
 
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- TEST INPUT VALUE "01234567"
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        SW <= "0000000000000000";
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;




end Behavioral;

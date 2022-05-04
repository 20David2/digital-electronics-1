----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2022 09:03:05
-- Design Name: 
-- Module Name: top - Behavioral
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

package bus_multiplexer_pkg is
        type array_std_logic is array(natural range <>) of std_logic_vector;
end package;

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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out std_logic_vector (7 downto 0);
           BTNC : in std_logic;
           SW : in STD_LOGIC_vector(15 downto 0));
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

signal length : integer := 63;
signal text : String(63 downto 0);
signal code : array_std_logic(63 downto 0)(5 downto 0);
signal data_7seg : array_std_logic(7 downto 0)(5 downto 0);

begin

    -- Instance of switch_to_message
    
--    switch : entity work.switch_to_message
--        generic map(
--            default_length => 63 
--        )
--        port map(
--            clk   => CLK100MHZ,   -- Main clock
--            reset => BTNC, -- Synchronous reset
--            sw_state_i => SW, 
--            text_o => text,
--            text_length => length
--        );
        
--    -- Instance of alphabet_to_code
    
--    alphabet : entity work.alphabet_to_code 
--        generic map(
--            text_length_i => length 
--        )
--        port map(
--            text_i => text(length-1 downto 0),
--            code_o  => code
--        );
        
--    -- Instance of move_text
    
--    move : entity work.move_text 
--        generic map(
--            default_speed => 50000000,
--            code_length_i => length    
--        )
--        port map(
--            clk     => CLK100MHZ,
--            reset   => BTNC,
--            code_i => code,
--            data_o => data_7seg
--        );   
        
        
    -- Instance of driver_7seg_8characters

    driver : entity work.driver_7seg_8characters
        port map(
            clk     => CLK100MHZ,
            reset   => BTNC,
            data0_i => data_7seg(0),
            data1_i => data_7seg(1),
            data2_i => data_7seg(2),
            data3_i => data_7seg(3),
            data4_i => data_7seg(4),
            data5_i => data_7seg(5),
            data6_i => data_7seg(6),
            data7_i => data_7seg(7),
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,
            dig_o    => AN
            );
        -- Connect one common anode to 3.3V
        --  AN <= b"1111_1110";

end architecture Behavioral;
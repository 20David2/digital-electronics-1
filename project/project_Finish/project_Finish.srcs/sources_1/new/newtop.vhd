----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2022 09:03:05
-- Design Name: 
-- Module Name: newtop - Behavioral
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

entity newtop is
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
           SW : in STD_LOGIC_vector(15 downto 0);
           BTND : in std_logic
           );
end newtop;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of newtop is

signal length : integer;
signal text_text : String(32 downto 1);
signal code : array_vector;
signal data0 :  std_logic_vector (5 downto 0);
signal data1 :  std_logic_vector (5 downto 0);
signal data2 :  std_logic_vector (5 downto 0);
signal data3 :  std_logic_vector (5 downto 0);
signal data4 :  std_logic_vector (5 downto 0);
signal data5 :  std_logic_vector (5 downto 0);
signal data6 :  std_logic_vector (5 downto 0);
signal data7 :  std_logic_vector (5 downto 0);

begin

    -- Instance of switch_to_message
    
    switch : entity work.switch_to_message
        generic map(
            default_length => 32 
        )
        port map(
            sw_state_i => SW, 
            text_o => text_text,
            text_length => length
        );
        
    -- Instance of alphabet_to_code
    
    alphabet : entity work.alphabet_code
        port map(
            clk => CLK100MHZ,
            reset => BTNC,            
            text_i => text_text,
            code_o => code
        );
        
    -- Instance of move_text
    
    move : entity work.move_text 
        generic map(
            default_speed => 50000000
        )
        port map(
            clk     => CLK100MHZ,
            reset   => BTND,
            code_i => code,
--            code_i => ("000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000"), 
            code_length_i => length,
            data0_o => data0,
            data1_o => data1,
            data2_o => data2,
            data3_o => data3,
            data4_o => data4,
            data5_o => data5,
            data6_o => data6,
            data7_o => data7
        );   
        
        
    -- Instance of driver_7seg_8characters

    driver : entity work.driver_7seg_8characters
        port map(
            clk     => CLK100MHZ,
            reset   => BTNC,
            data0_i => data0,
            data1_i => data1,
            data2_i => data2,
            data3_i => data3,
            data4_i => data4,
            data5_i => data5,
            data6_i => data6,
            data7_i => data7,
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
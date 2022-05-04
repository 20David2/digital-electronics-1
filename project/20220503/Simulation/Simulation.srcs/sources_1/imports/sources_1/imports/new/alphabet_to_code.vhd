----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 10:09:07 AM
-- Design Name: 
-- Module Name: alphabet_to_code - Behavioral
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

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

--package bus_multiplexer_pkg2 is
--        type array_std_logic is array(natural range <>) of std_logic_vector;
--end package;

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

    --------------------------------------------------------
    -- Instance (copy) of char_to_code entity

entity alphabet_to_code is
    generic(
        base_text_length_i : in integer := 64
    );
    Port (
        text_i : in string (32 downto 1);
        text_length_i : integer;
        full_code_o : out array_vector
    );
end alphabet_to_code;

architecture Behavioral of alphabet_to_code is

signal char : character;
signal code_char : std_logic_vector(5 downto 0);
--signal code_1 : std_logic_vector(5 downto 0);
--signal code_2 : std_logic_vector(5 downto 0);
--signal code_3 : std_logic_vector(5 downto 0);
--signal code_4 : std_logic_vector(5 downto 0);
--signal code_5 : std_logic_vector(5 downto 0);
--signal code_6 : std_logic_vector(5 downto 0);
--signal code_7 : std_logic_vector(5 downto 0);
--signal code_8 : std_logic_vector(5 downto 0);
--signal code_9 : std_logic_vector(5 downto 0);
--signal code_10 : std_logic_vector(5 downto 0);
--signal code_11 : std_logic_vector(5 downto 0);
--signal code_12 : std_logic_vector(5 downto 0);
--signal code_13 : std_logic_vector(5 downto 0);
--signal code_14 : std_logic_vector(5 downto 0);
--signal code_15 : std_logic_vector(5 downto 0);
--signal code_16 : std_logic_vector(5 downto 0);
--signal code_17 : std_logic_vector(5 downto 0);
--signal code_18 : std_logic_vector(5 downto 0);
--signal code_19 : std_logic_vector(5 downto 0);
--signal code_20 : std_logic_vector(5 downto 0);
--signal code_21 : std_logic_vector(5 downto 0);
--signal code_22 : std_logic_vector(5 downto 0);
--signal code_23 : std_logic_vector(5 downto 0);
--signal code_24 : std_logic_vector(5 downto 0);
--signal code_25 : std_logic_vector(5 downto 0);
--signal code_26 : std_logic_vector(5 downto 0);
--signal code_27 : std_logic_vector(5 downto 0);
--signal code_28 : std_logic_vector(5 downto 0);
--signal code_29 : std_logic_vector(5 downto 0);
--signal code_30 : std_logic_vector(5 downto 0);
--signal code_31 : std_logic_vector(5 downto 0);
--signal code_32 : std_logic_vector(5 downto 0);
signal code : array_vector;

begin   
    --------------------------------------------------------
    
    char_to_code : entity work.char_to_code
    port map(
        char_i => char,
        code_o => code_char
    );
    
    
    p_mux : process(text_i)
    
    begin
    
--        for I in 1 to text_length_i+1 loop
--            char <= text_i(I);
--            code(I) <= code_char;
--        end loop;

--        char <= text_i(1);
        char <= '1';
        code(1) <= code_char;
        char <= '2';
        code(2) <= code_char;
        char <= '3';
        code(3) <= code_char;
        char <= '4';
        code(4) <= code_char;
        
        full_code_o <= code;
        
--    code_1 <= code_1_o;
--    code_2 <= code_2_o;
--    code_3 <= code_3_o;
--    code_4 <= code_4_o;
--    code_5 <= code_5_o;
--    code_6 <= code_6_o;
--    code_7 <= code_7_o;
--    code_8 <= code_8_o;
--    code_9 <= code_9_o;
--    code_10 <= code_10_o;
--    code_11 <= code_11_o;
--    code_12 <= code_12_o;
--    code_13 <= code_13_o;
--    code_14 <= code_14_o;
--    code_15 <= code_15_o;
--    code_16 <= code_16_o;
--    code_17 <= code_17_o;
--    code_18 <= code_18_o;
--    code_19 <= code_19_o;
--    code_20 <= code_20_o;
--    code_21 <= code_21_o;
--    code_22 <= code_22_o;
--    code_23 <= code_23_o;
--    code_24 <= code_24_o;
--    code_25 <= code_25_o;
--    code_26 <= code_26_o;
--    code_27 <= code_27_o;
--    code_28 <= code_28_o;
--    code_29 <= code_29_o;
--    code_30 <= code_30_o;
--    code_31 <= code_31_o;
--    code_32 <= code_32_o;

end process p_mux;


end Behavioral;

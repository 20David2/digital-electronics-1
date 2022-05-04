
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

entity alphabet_2_code is
    generic(
        base_text_length_i : in integer := 64
    );
    Port (
        text_i : in string (32 downto 1);
        text_length_i : integer;
        full_code_o : out array_vector
    );
end alphabet_2_code;

architecture Behavioral of alphabet_2_code is

signal char : character;
signal code_char : std_logic_vector(5 downto 0);
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
    
        for I in 1 to text_length_i+1 loop
            char <= 'A';
            code(1) <= code_char;
        end loop;

--        char <= text_i(1);
--        char <= '1';
--        code(1) <= code_char;
--        char <= '2';
--        code(2) <= code_char;
--        char <= '3';
--        code(3) <= code_char;
--        char <= '4';
--        code(4) <= code_char;
        
        full_code_o <= code;

end process p_mux;


end Behavioral;

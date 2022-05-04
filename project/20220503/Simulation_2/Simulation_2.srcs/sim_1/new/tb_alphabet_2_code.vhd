library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.bus_multiplexer_pkg.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_alphabet_2_code is
    -- Entity of testbench is always empty
end entity tb_alphabet_2_code;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_alphabet_2_code is

    -- Local signals
    constant base_text_length : integer := 32;
    
    signal s_text_i : string (32 downto 1);
    signal s_text_length_i : integer := 1;
    
    signal s_code : array_vector;
    
        
begin
    -- Connecting testbench signals withalphabet_to_code entity
    -- (Unit Under Test)
    uut_alphabet : entity work.alphabet_2_code
        generic map(
            base_text_length_i  => base_text_length
        )
        port map(
            text_i           => s_text_i,
            text_length_i    => s_text_length_i,
            full_code_o      => s_code
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- TEST INPUT VALUES
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_text_length_i <= 1;
        s_text_i(1) <= '1';
--        wait for 100 ns;
--        s_text_i(2) <= '2';
--        wait for 100 ns; 
--        s_text_i(3) <= '3';
--        wait for 100 ns; 
--        s_text_i(4) <= '4';
--        wait for 100 ns;
--        s_text_i(5) <= '5';
--        wait for 100 ns; 
--        s_text_i(6) <= '6'; 
--        wait for 100 ns; 
   
        
--        wait for 100 ns;
--        s_text_length_i <= 1;
--        s_text_i(1) <= '2';
        
--        wait for 100 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        

end architecture testbench;
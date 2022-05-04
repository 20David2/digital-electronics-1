library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
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

    -- Local signals
    constant base_text_length : integer := 32;
    
    signal s_text_i : string (32 downto 1);
    signal s_text_length_i : integer;
    
    signal s_code : array_vector;

--    signal s_code_1_o : std_logic_vector (5 downto 0);
--    signal s_code_2_o : std_logic_vector (5 downto 0);
--    signal s_code_3_o : std_logic_vector (5 downto 0);
--    signal s_code_4_o : std_logic_vector (5 downto 0);
--    signal s_code_5_o : std_logic_vector (5 downto 0);
--    signal s_code_6_o : std_logic_vector (5 downto 0);
--    signal s_code_7_o : std_logic_vector (5 downto 0);
--    signal s_code_8_o : std_logic_vector (5 downto 0);
--    signal s_code_9_o : std_logic_vector (5 downto 0);
--    signal s_code_10_o : std_logic_vector (5 downto 0);
--    signal s_code_11_o : std_logic_vector (5 downto 0);
--    signal s_code_12_o : std_logic_vector (5 downto 0);
--    signal s_code_13_o : std_logic_vector (5 downto 0);
--    signal s_code_14_o : std_logic_vector (5 downto 0);
--    signal s_code_15_o : std_logic_vector (5 downto 0);
--    signal s_code_16_o : std_logic_vector (5 downto 0);
--    signal s_code_17_o : std_logic_vector (5 downto 0);
--    signal s_code_18_o : std_logic_vector (5 downto 0);
--    signal s_code_19_o : std_logic_vector (5 downto 0);
--    signal s_code_20_o : std_logic_vector (5 downto 0);
--    signal s_code_21_o : std_logic_vector (5 downto 0);
--    signal s_code_22_o : std_logic_vector (5 downto 0);
--    signal s_code_23_o : std_logic_vector (5 downto 0);
--    signal s_code_24_o : std_logic_vector (5 downto 0);
--    signal s_code_25_o : std_logic_vector (5 downto 0);
--    signal s_code_26_o : std_logic_vector (5 downto 0);
--    signal s_code_27_o : std_logic_vector (5 downto 0);
--    signal s_code_28_o : std_logic_vector (5 downto 0);
--    signal s_code_29_o : std_logic_vector (5 downto 0);
--    signal s_code_30_o : std_logic_vector (5 downto 0);
--    signal s_code_31_o : std_logic_vector (5 downto 0);
--    signal s_code_32_o : std_logic_vector (5 downto 0);
    
        
begin
    -- Connecting testbench signals withalphabet_to_code entity
    -- (Unit Under Test)
    uut_char : entity work.alphabet_to_code
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
        wait for 100 ns;
        s_text_i(2) <= '2';
        wait for 100 ns; 
        s_text_i(3) <= '3';
        wait for 100 ns; 
        s_text_i(4) <= '4';
        wait for 100 ns;
        s_text_i(5) <= '5';
        wait for 100 ns; 
        s_text_i(6) <= '6'; 
        wait for 100 ns; 
   
        
--        wait for 100 ns;
--        s_text_length_i <= 1;
--        s_text_i(1) <= '2';
        
--        wait for 100 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        

end architecture testbench;
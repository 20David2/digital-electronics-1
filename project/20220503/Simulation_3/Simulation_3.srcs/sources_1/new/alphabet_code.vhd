
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bus_multiplexer_pkg.all;

--------------------------------------------------------
entity alphabet_code is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        text_i  : in string(32 downto 1);
        code_o  : out array_vector
--        data0_i : in  std_logic_vector(5 downto 0);
--        data1_i : in  std_logic_vector(5 downto 0);
--        data2_i : in  std_logic_vector(5 downto 0);
--        data3_i : in  std_logic_vector(5 downto 0);
--        data4_i : in  std_logic_vector(5 downto 0);
--        data5_i : in  std_logic_vector(5 downto 0);
--        data6_i : in  std_logic_vector(5 downto 0);
--        data7_i : in  std_logic_vector(5 downto 0);
--        seg_o   : out std_logic_vector(6 downto 0);
--        dig_o   : out std_logic_vector(7 downto 0)
    );
end entity alphabet_code;

------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------
architecture Behavioral of alphabet_code is

    -- Internal clock enable
    signal s_en  : std_logic;
    -- Internal 5-bit counter for multiplexing 8 digits
    signal s_cnt : std_logic_vector(4 downto 0);
    signal s_char : character;
    signal code_char : std_logic_vector(5 downto 0);

begin
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 1    -- FOR SIMULATION, CHANGE THIS VALUE TO 4
            --g_MAX => 200000 -- FOR IMPLEMENTATION, KEEP THIS VALUE TO 400,000    
        )
        port map(
            clk   => clk,   -- Main clock
            reset => reset, -- Synchronous reset
            ce_o  => s_en
        );

    --------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 3-bit
    -- up-down counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 5
        )
        port map(
            clk      => clk,        -- Main clock
            reset    => reset,      -- Synchronous reset
            en_i     => clk,       -- Enable input
            cnt_up_i => '0',        -- Direction of the counter
            cnt_o    => s_cnt       -- Output of the counter 

        );

    --------------------------------------------------------
    
    char_to_code : entity work.char_to_code
    port map(
        char_i => s_char,
        code_o => code_char
    );
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                
            else
                case s_cnt is
                        
                    when "00001" =>
                        s_char <= text_i(1);
                        code_o(1) <= code_char;

                    when "00010" =>
                        s_char <= text_i(2);
                        code_o(2) <= code_char;
                    
                    when "00011" =>
                        s_char <= text_i(3);
                        code_o(3) <= code_char;

                    when "00100" =>
                        s_char <= text_i(4);
                        code_o(4) <= code_char;
                        
                    when "00101" =>
                        s_char <= text_i(5);
                        code_o(5) <= code_char;

                    when "00110" =>
                        s_char <= text_i(6);
                        code_o(6) <= code_char;
                    
                    when "00111" =>
                        s_char <= text_i(7);
                        code_o(7) <= code_char;

                    when "01000" =>
                        s_char <= text_i(8);
                        code_o(8) <= code_char;
                        
                    when "01001" =>
                        s_char <= text_i(9);
                        code_o(9) <= code_char;

                    when "01010" =>
                        s_char <= text_i(10);
                        code_o(10) <= code_char;
                    
                    when "01011" =>
                        s_char <= text_i(11);
                        code_o(11) <= code_char;

                    when "01100" =>
                        s_char <= text_i(12);
                        code_o(12) <= code_char;
                        
                    when "01101" =>
                        s_char <= text_i(13);
                        code_o(13) <= code_char;

                    when "01110" =>
                        s_char <= text_i(14);
                        code_o(14) <= code_char;
                    
                    when "01111" =>
                        s_char <= text_i(15);
                        code_o(15) <= code_char;

                    when "10000" =>
                        s_char <= text_i(16);
                        code_o(16) <= code_char;
   
                    when "10001" =>
                        s_char <= text_i(17);
                        code_o(17) <= code_char;

                    when "10010" =>
                        s_char <= text_i(18);
                        code_o(18) <= code_char;
                    
                    when "10011" =>
                        s_char <= text_i(19);
                        code_o(19) <= code_char;

                    when "10100" =>
                        s_char <= text_i(20);
                        code_o(20) <= code_char;
                        
                    when "10101" =>
                        s_char <= text_i(21);
                        code_o(21) <= code_char;

                    when "10110" =>
                        s_char <= text_i(22);
                        code_o(22) <= code_char;
                    
                    when "10111" =>
                        s_char <= text_i(23);
                        code_o(23) <= code_char;

                    when "11000" =>
                        s_char <= text_i(24);
                        code_o(24) <= code_char;
                        
                    when "11001" =>
                        s_char <= text_i(25);
                        code_o(25) <= code_char;

                    when "11010" =>
                        s_char <= text_i(26);
                        code_o(26) <= code_char;
                    
                    when "11011" =>
                        s_char <= text_i(27);
                        code_o(27) <= code_char;

                    when "11100" =>
                        s_char <= text_i(28);
                        code_o(28) <= code_char;
                        
                    when "11101" =>
                        s_char <= text_i(29);
                        code_o(29) <= code_char;

                    when "11110" =>
                        s_char <= text_i(30);
                        code_o(30) <= code_char;
                    
                    when "11111" =>
                        s_char <= text_i(31);
                        code_o(31) <= code_char;
                    
                    when "00000" =>
                        s_char <= text_i(32);
                        code_o(32) <= code_char;

                    when others =>
                end case;
            end if;
        end if;
    end process p_mux;

end architecture Behavioral;

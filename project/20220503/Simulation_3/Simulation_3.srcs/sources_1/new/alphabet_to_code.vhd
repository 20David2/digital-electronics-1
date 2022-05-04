
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
        base_text_length_i : in integer := 32
    );
    Port (
        clk : in std_logic;
        reset : in std_logic;
        text_i : in string (32 downto 1);
        
        code_1_o : out std_logic_vector(5 downto 0);
        code_2_o : out std_logic_vector(5 downto 0); 
        code_3_o : out std_logic_vector(5 downto 0); 
        code_4_o : out std_logic_vector(5 downto 0); 
        code_5_o : out std_logic_vector(5 downto 0); 
        code_6_o : out std_logic_vector(5 downto 0); 
        code_7_o : out std_logic_vector(5 downto 0); 
        code_8_o : out std_logic_vector(5 downto 0);
        code_9_o : out std_logic_vector(5 downto 0);
        code_10_o : out std_logic_vector(5 downto 0); 
        code_11_o : out std_logic_vector(5 downto 0); 
        code_12_o : out std_logic_vector(5 downto 0); 
        code_13_o : out std_logic_vector(5 downto 0); 
        code_14_o : out std_logic_vector(5 downto 0); 
        code_15_o : out std_logic_vector(5 downto 0); 
        code_16_o : out std_logic_vector(5 downto 0);
        code_17_o : out std_logic_vector(5 downto 0);
        code_18_o : out std_logic_vector(5 downto 0); 
        code_19_o : out std_logic_vector(5 downto 0); 
        code_20_o : out std_logic_vector(5 downto 0); 
        code_21_o : out std_logic_vector(5 downto 0); 
        code_22_o : out std_logic_vector(5 downto 0); 
        code_23_o : out std_logic_vector(5 downto 0); 
        code_24_o : out std_logic_vector(5 downto 0);
        code_25_o : out std_logic_vector(5 downto 0);
        code_26_o : out std_logic_vector(5 downto 0); 
        code_27_o : out std_logic_vector(5 downto 0); 
        code_28_o : out std_logic_vector(5 downto 0); 
        code_29_o : out std_logic_vector(5 downto 0); 
        code_30_o : out std_logic_vector(5 downto 0); 
        code_31_o : out std_logic_vector(5 downto 0); 
        code_32_o : out std_logic_vector(5 downto 0);
        
        test_o : out std_logic_vector(5 downto 0)
    );
end alphabet_to_code;

architecture Behavioral of alphabet_to_code is

signal s_char : character;
signal code_char : std_logic_vector(5 downto 0);
signal test : std_logic_vector(5 downto 0);
signal s_en : std_logic;
signal s_cnt : std_logic_vector(5-1 downto 0);


begin   
    --------------------------------------------------------
    
    char_to_code : entity work.char_to_code
    port map(
        char_i => s_char,
        code_o => code_char
    );
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 4    -- FOR SIMULATION, CHANGE THIS VALUE TO 4
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
            en_i     => s_en,       -- Enable input
            cnt_up_i => '1',          -- Direction of the counter
            cnt_o    => s_cnt       -- Output of the counter 

        );        
        
    p_code : process(clk, s_cnt)
    begin
    
        if rising_edge(clk) then
        case s_cnt is
        
                when "00000" =>
                    s_char <= 'b';
                    code_1_o <= code_char;
                           
                when "00001" =>
                  s_char <= '0';
                  code_2_o <= code_char;
                  
                when others => 
        end case;
        end if;
        
--        test_o <= code_char;

--        char <= text_i(1);
--        char <= '1';
--        code(1) <= code_char;
--        char <= '2';
--        code(2) <= code_char;
--        char <= '3';
--        code(3) <= code_char;
--        char <= '4';
--        code(4) <= code_char;


end process p_code;


end Behavioral;

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_switch_to_message is
    -- Entity of testbench is always empty
end entity tb_switch_to_message;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_switch_to_message is

    -- Local constants
    constant default_length : integer  := 63;

    -- Local signals
    signal s_sw_state_i     : std_logic_vector(15 downto 0); 
    signal s_text_o         : string(63 downto 1);
    signal s_text_length    : integer;
    
begin
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_switch : entity work.switch_to_message
        generic map(
            default_length  => default_length
        )
        port map(
            sw_state_i      => s_sw_state_i,
            text_o          => s_text_o,
            text_length     => s_text_length
        );


    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- TEST INPUT VALUES
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_sw_state_i <= "0000000000000001";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000000000010";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000000000100";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000000001000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000000010000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000000100000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000001000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000010000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000000100000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000001000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000010000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0000100000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0001000000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0010000000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "0100000000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "1000000000000000";
        wait for 20 ns;
        
        s_sw_state_i <= "1111111111111111";
        wait for 20 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        

end architecture testbench;
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_char_to_code is
    -- Entity of testbench is always empty
end entity tb_char_to_code;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_char_to_code is

    -- Local signals
    signal s_char_i     : character; 
    signal s_code_o     : std_logic_vector(6 - 1 downto 0);
    
begin
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_char : entity work.char_to_code
            port map ( 
                char_i => s_char_i,
                code_o => s_code_o
            );


    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- TEST INPUT VALUES
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_char_i <= '0'; wait for 5 ns;
        s_char_i <= '1'; wait for 5 ns;
        s_char_i <= '2'; wait for 5 ns;
        s_char_i <= '3'; wait for 5 ns;
        s_char_i <= '4'; wait for 5 ns;
        s_char_i <= '5'; wait for 5 ns;
        s_char_i <= '6'; wait for 5 ns;
        s_char_i <= '7'; wait for 5 ns;
        s_char_i <= '8'; wait for 5 ns;
        s_char_i <= '9'; wait for 5 ns;
        s_char_i <= 'a'; wait for 5 ns;
        s_char_i <= 'A'; wait for 5 ns;
        s_char_i <= 'b'; wait for 5 ns;
        s_char_i <= 'B'; wait for 5 ns;
        s_char_i <= 'c'; wait for 5 ns;
        s_char_i <= 'C'; wait for 5 ns;
        s_char_i <= 'd'; wait for 5 ns;
        s_char_i <= 'D'; wait for 5 ns;
        s_char_i <= 'e'; wait for 5 ns;
        s_char_i <= 'E'; wait for 5 ns;
        s_char_i <= 'f'; wait for 5 ns;
        s_char_i <= 'F'; wait for 5 ns;
        s_char_i <= 'g'; wait for 5 ns;
        s_char_i <= 'G'; wait for 5 ns;
        s_char_i <= 'h'; wait for 5 ns;
        s_char_i <= 'H'; wait for 5 ns;
        s_char_i <= 'i'; wait for 5 ns;
        s_char_i <= 'I'; wait for 5 ns;
        s_char_i <= 'j'; wait for 5 ns;
        s_char_i <= 'J'; wait for 5 ns;
        s_char_i <= 'k'; wait for 5 ns;
        s_char_i <= 'K'; wait for 5 ns;
        s_char_i <= 'l'; wait for 5 ns;
        s_char_i <= 'L'; wait for 5 ns;
        s_char_i <= 'm'; wait for 5 ns;
        s_char_i <= 'M'; wait for 5 ns;
        s_char_i <= 'N'; wait for 5 ns;
        s_char_i <= 'o'; wait for 5 ns;
        s_char_i <= 'O'; wait for 5 ns;
        s_char_i <= 'p'; wait for 5 ns;
        s_char_i <= 'P'; wait for 5 ns;
        s_char_i <= 'q'; wait for 5 ns;
        s_char_i <= 'Q'; wait for 5 ns;
        s_char_i <= 'r'; wait for 5 ns;
        s_char_i <= 'R'; wait for 5 ns;
        s_char_i <= 's'; wait for 5 ns;
        s_char_i <= 'S'; wait for 5 ns;
        s_char_i <= 't'; wait for 5 ns;
        s_char_i <= 'T'; wait for 5 ns;
        s_char_i <= 'u'; wait for 5 ns;
        s_char_i <= 'U'; wait for 5 ns;
        s_char_i <= 'v'; wait for 5 ns;
        s_char_i <= 'V'; wait for 5 ns;
        s_char_i <= 'w'; wait for 5 ns;
        s_char_i <= 'W'; wait for 5 ns;
        s_char_i <= 'x'; wait for 5 ns;
        s_char_i <= 'X'; wait for 5 ns;
        s_char_i <= 'y'; wait for 5 ns;
        s_char_i <= 'Y'; wait for 5 ns;
        s_char_i <= 'z'; wait for 5 ns;
        s_char_i <= 'Z'; wait for 5 ns;
        s_char_i <= ' '; wait for 5 ns;
        s_char_i <= '*'; wait for 5 ns;        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        

end architecture testbench;
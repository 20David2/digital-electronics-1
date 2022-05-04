----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 10:56:32 AM
-- Design Name: 
-- Module Name: move_text - Behavioral
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
--package bus_multiplexer_pkg3 is
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

entity move_text is
    generic(
        default_speed : integer := 50000000;
        code_length_i : integer := 63
    );
        Port (
        clk     : in  std_logic;
        reset   : in  std_logic; 
        code_i : in array_std_logic(code_length_i downto 0)(5 downto 0);
        data_o : out array_std_logic(7 downto 0)(5 downto 0)
    );
end move_text;

architecture Behavioral of move_text is

    signal code : array_std_logic := code_i ;
    -- Internal clock enable
    signal s_en  : std_logic;
    
begin

    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => default_speed     
        )
        port map(
            clk   => clk,   -- Main clock
            reset => reset, -- Synchronous reset
            ce_o  => s_en
        );

    p_move_text: process(s_en)
    begin
        
        if rising_edge(s_en) then
           if(reset ='1') then
              code<=code_i;
           else
              code<=code(code'length-2 downto 0) & code(code'length-1);
           end if;
        end if;
    
    data_o <= code(7 downto 0);
    
    end process p_move_text;

end Behavioral;

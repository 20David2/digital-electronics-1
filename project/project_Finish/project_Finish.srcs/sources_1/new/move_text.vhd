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
        default_speed : integer := 50000000
    );
        Port (
        clk     : in  std_logic;
        reset   : in  std_logic; 
        code_i : in array_vector;
        code_length_i : in integer;
        data0_o : out std_logic_vector (5 downto 0);
        data1_o : out std_logic_vector (5 downto 0);
        data2_o : out std_logic_vector (5 downto 0);
        data3_o : out std_logic_vector (5 downto 0);
        data4_o : out std_logic_vector (5 downto 0);
        data5_o : out std_logic_vector (5 downto 0);
        data6_o : out std_logic_vector (5 downto 0);
        data7_o : out std_logic_vector (5 downto 0) 
    );
end move_text;

architecture Behavioral of move_text is

    signal code : array_vector := code_i ;
    -- Internal clock enable
    signal s_en  : std_logic;
    
begin
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 50000000    
        )
        port map(
            clk   => clk,   -- Main clock
            reset => reset, -- Synchronous reset
            ce_o  => s_en
        );

    p_move_text: process(clk)
    begin
--        code<=code_i;
        if rising_edge(clk) then
           if(reset ='1') then
              code<=code_i;
           elsif(s_en = '1') then 
              code<=code(31 downto 1) & code(32);
          
           end if;
        end if;
    
    end process p_move_text;
    
    data0_o <= code(1);
    data1_o <= code(2);
    data2_o <= code(3);
    data3_o <= code(4);
    data4_o <= code(5);
    data5_o <= code(6);
    data6_o <= code(7);
    data7_o <= code(8);

end Behavioral;

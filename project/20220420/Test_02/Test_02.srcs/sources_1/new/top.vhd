----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2022 09:03:05
-- Design Name: 
-- Module Name: top - Behavioral
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

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out std_logic_vector (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

  -- Internal clock enable
  signal clk  : std_logic;
  signal data0 : std_logic_vector(5 downto 0);
  signal data1 : std_logic_vector(5 downto 0);
  signal data2 : std_logic_vector(5 downto 0);
  signal data3 : std_logic_vector(5 downto 0);
  signal data4 : std_logic_vector(5 downto 0);
  signal data5 : std_logic_vector(5 downto 0);
  signal data6 : std_logic_vector(5 downto 0);
  signal data7 : std_logic_vector(5 downto 0);
  signal reset : std_logic;
  
  -- Internal counter
--  signal s_cnt : std_logic_vector(4 - 1 downto 0);
                    --ahoj jak se mas
              type rl is array(15 downto 0) of std_logic_vector(5 downto 0);
              constant r:rl:=(b"001010",b"010001",b"011000",b"010011",b"111111",b"010011",b"001010",b"010100",b"111111",b"011100",b"001110",b"111111",b"010110",b"001010",b"011100",b"111111");
               --constant r:rl:=(b"000001",b"000010",b"000011",b"000100",b"000101",b"000110",b"000111",b"000000");
              signal rsig:rl:=r;

          begin

             process(clk)
             begin
                if rising_edge(clk) then
                   if(BTNC='1') then
                      rsig<=r;
                   else
                      rsig<=rsig(14 downto 0)&rsig(15);
                   end if;
                end if;
             end process;

             data0<=rsig(0);
             data1<=rsig(1);
             data2<=rsig(2);
             data3<=rsig(3);
             data4<=rsig(4);
             data5<=rsig(5);
             data6<=rsig(6);
             data7<=rsig(7);
---------------------------------------------------------
 
  clk_en0 : entity work.clock_enable
        generic map(
            --g_MAX => 4    -- FOR SIMULATION, CHANGE THIS VALUE TO 4
            g_MAX => 50000000 -- FOR IMPLEMENTATION, KEEP THIS VALUE TO 400,000    
        )
        port map(
            clk   => CLK100MHZ,   -- Main clock
            reset => BTNC, -- Synchronous reset
            ce_o  => clk
        );

-- Instance of driver_7seg_8characters

    driver : entity work.driver_7seg_8characters
        port map(
            clk     => CLK100MHZ,
            reset   => BTNC,
            data0_i => data0,
            data1_i => data1,
            data2_i => data2,
            data3_i => data3,
            data4_i => data4,
            data5_i => data5,
            data6_i => data6,
            data7_i => data7,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,
            dig_o    => AN
            );
  -- Connect one common anode to 3.3V
--  AN <= b"1111_1110";

  -- Display counter values on LEDs
--  LED(3 downto 0) <= s_cnt;

end architecture Behavioral;
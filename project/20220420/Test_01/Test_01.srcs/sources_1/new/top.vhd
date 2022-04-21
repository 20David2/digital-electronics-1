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
--  signal s_en  : std_logic;
  -- Internal counter
--  signal s_cnt : std_logic_vector(4 - 1 downto 0);

begin

  --------------------------------------------------------------------
  -- Instance (copy) of clock_enable entity
--  clk_en0 : entity work.clock_enable
--      generic map(
--          g_MAX => 25000000
--      )
--      port map(
--          clk   => CLK100MHZ, -- Main clock
--          reset => BTNC, -- Synchronous reset
--          ce_o  => s_en
--      );

  --------------------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity
--  bin_cnt0 : entity work.cnt_up_down
--     generic map(
--          g_CNT_WIDTH => 4
--      )
--      port map(
--          clk => CLK100MHZ,
--          reset => BTNC,
--          en_i => s_en,
--          cnt_up_i => SW,
--          cnt_o => s_cnt
--      );

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
--  hex2seg : entity work.hex_7seg
--      port map(
--          hex_i    => s_cnt,
--          seg_o(6) => CA,
--          seg_o(5) => CB,
--          seg_o(4) => CC,
--          seg_o(3) => CD,
--          seg_o(2) => CE,
--          seg_o(1) => CF,
--          seg_o(0) => CG
--      );

-- Instance of driver_7seg_8characters

    driver : entity work.driver_7seg_8characters
        port map(
            clk     => CLK100MHZ,
            reset   => BTNC,
            data0_i => b"111111",
            data1_i => b"111111",
            data2_i => b"111111",
            data3_i => b"111111",
            data4_i => b"010011",
            data5_i => b"011000",
            data6_i => b"010001",
            data7_i => b"001010",
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
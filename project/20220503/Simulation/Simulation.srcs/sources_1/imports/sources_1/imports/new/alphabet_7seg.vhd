------------------------------------------------------------
--
-- Made by David Strouhal from:
-- Template for 7-segment display decoder.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2018-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
entity alphabet_7seg is
    port(
        alphabet_i : in  std_logic_vector(6 - 1 downto 0);
        seg_o : out std_logic_vector(7 - 1 downto 0)
    );
end entity alphabet_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of alphabet_7seg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "alphabet_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
    p_7seg_decoder : process(alphabet_i)
    begin
        case alphabet_i is
            when "000000" =>
                seg_o <= "0000001"; -- 0
                
            when "000001" =>
                seg_o <= "1001111"; -- 1
                
	    when "000010" =>
                seg_o <= "0010010"; -- 2

            when "000011" =>
                seg_o <= "0000110"; -- 3

            when "000100" =>
                seg_o <= "1001100"; -- 4

            when "000101" =>
                seg_o <= "0100100"; -- 5

            when "000110" =>
                seg_o <= "0100000"; -- 6

            when "000111" =>
                seg_o <= "0001111"; -- 7

            when "001000" =>
                seg_o <= "0000000"; -- 8

            when "001001" =>
                seg_o <= "0000100"; -- 9

            when "001010" =>
                seg_o <= "0001000"; -- A

            when "001011" =>
                seg_o <= "1100000"; -- b

            when "001100" =>
                seg_o <= "0110001"; -- C

            when "001101" =>
                seg_o <= "1000010"; -- d

            when "001110" =>
                seg_o <= "0110000"; -- E
                
            when "001111" =>
                seg_o <= "0111000"; -- F
                
            when "010000" =>
                seg_o <= "0100001"; -- G
                
            when "010001" =>
                seg_o <= "1101000"; -- h
                
	    when "010010" =>
                seg_o <= "1111001"; -- I

            when "010011" =>
                seg_o <= "1000011"; -- J

            when "010100" =>
                seg_o <= "0101000"; -- k

            when "010101" =>
                seg_o <= "1110001"; -- L

            when "010110" =>
                seg_o <= "0101011"; -- M

            when "010111" =>
                seg_o <= "0001001"; -- n

            when "011000" =>
                seg_o <= "0000001"; -- O

            when "011001" =>
                seg_o <= "0011000"; -- P

            when "011010" =>
                seg_o <= "0001100"; -- q

            when "011011" =>
                seg_o <= "0011001"; -- r

            when "011100" =>
                seg_o <= "0100100"; -- S

            when "011101" =>
                seg_o <= "1110000"; -- t

            when "011110" =>
                seg_o <= "1000001"; -- U
                
            when "011111" =>
                seg_o <= "1000101"; -- V
                
	    when "100000" =>
                seg_o <= "1010101"; -- W

            when "100001" =>
                seg_o <= "1001000"; -- X

            when "100010" =>
                seg_o <= "1000100"; -- y
           
	    when "100011" =>
                seg_o <= "0010110"; -- Z
			
            when "100100" =>
                seg_o <= "1111111"; --  (Space)
                
	    when others =>
                seg_o <= "1111111"; --  (space)
        end case;
    end process p_7seg_decoder;

end architecture Behavioral;

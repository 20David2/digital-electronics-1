----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 10:09:59 AM
-- Design Name: 
-- Module Name: char_to_code - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity char_to_code is
    Port ( 
        char_i : in  character;
        code_o : out std_logic_vector(6 - 1 downto 0)
    );
end char_to_code;

architecture Behavioral of char_to_code is
begin
    p_char_to_code : process(char_i)
    begin
        case char_i is
        
                when '0' =>
                    code_o <= "000000"; -- 0
                   
                when '1' =>
                    code_o <= "000001"; -- 1
                   
			    when '2' =>
                    code_o <= "000010"; -- 2

                when '3' =>
                    code_o <= "000011"; -- 3

                when '4' =>
                    code_o <= "000100"; -- 4

                when '5' =>
                    code_o <= "000101"; -- 5

                when '6' =>
                    code_o <= "000110"; -- 6

                when '7' =>
                    code_o <= "000111"; -- 7
            
                when '8' =>
                    code_o <= "001000"; -- 8
            
                when '9' =>
                    code_o <= "001001"; -- 9
              ------------------------------
                when 'A' =>
                    code_o <= "001010"; -- A
                
                when 'a' =>
                    code_o <= "001010"; -- a
              ------------------------------
                when 'B' =>
                    code_o <= "001011"; -- B
                     
                when 'b' =>
                    code_o <= "001011"; -- b
              ------------------------------    
                when 'C' =>
                    code_o <= "001010"; -- C
                    
                when 'c' =>
                    code_o <= "001010"; -- c
              ----------------------------                
                when 'D' =>
                    code_o <= "001101"; -- D
                
                when 'd' =>
                    code_o <= "001101"; -- d
              ----------------------------
                when 'E' =>
                    code_o <= "001110"; -- E
               
                when 'e' =>
                    code_o <= "001110"; -- e
              -----------------------------
                when 'F' =>
                    code_o <= "001111"; -- F
               
                when 'f' =>
                    code_o <= "001111"; -- f
              -----------------------------
                when 'G' =>
                    code_o <= "010000"; -- G
            
                when 'g' =>
                    code_o <= "010000"; -- g
              ----------------------------- 
                when 'H' =>
                    code_o <= "010001"; -- H
            
                when 'h' =>
                    code_o <= "010001"; -- h
              -----------------------------           
                when 'I' =>
                    code_o <= "010010"; -- I
                
                when 'i' =>
                    code_o <= "010010"; -- i
              -----------------------------
                when 'J' =>
                    code_o <= "010011"; -- J   
                    
                when 'j' =>                 
                    code_o <= "010011"; -- j
              -----------------------------
                when 'K' =>
                    code_o <= "010100"; -- K
                
                when 'k' =>
                    code_o <= "010100"; -- k
              -----------------------------  
                when 'L' =>
                    code_o <= "010101"; -- L
               
                when 'l' =>
                    code_o <= "010101"; -- l
              -----------------------------
                when 'M' =>
                    code_o <= "010110"; -- M
                
                when 'm' =>
                    code_o <= "010110"; -- m
              -----------------------------
                when 'N' =>
                    code_o <= "010111"; -- N
                
                when 'n' =>
                    code_o <= "010111"; -- n
              -----------------------------
                when 'O' =>
                    code_o <= "011000"; -- O
                
                when 'o' =>
                    code_o <= "011000"; -- o
              -----------------------------  
                when 'P' =>
                    code_o <= "011001"; -- P
                
                when 'p' =>
                    code_o <= "011001"; -- p
              -----------------------------
                when 'Q' =>
                    code_o <= "011010"; -- Q
                
                when 'q' =>
                    code_o <= "011010"; -- q
              -----------------------------
                when 'R' =>
                    code_o <= "011011"; -- R
               
                when 'r' =>
                    code_o <= "011011"; -- r
              -----------------------------  
                when 'S' =>
                    code_o <= "011100"; -- S
                
                when 's' =>
                    code_o <= "011100"; -- s
              -----------------------------
                when 'T' =>
                    code_o <= "011101"; -- T
                
                when 't' =>
                    code_o <= "011101"; -- t
              -----------------------------
                when 'U' =>
                    code_o <= "011110"; -- U
                
                when 'u' =>
                    code_o <= "011110"; -- u
              -----------------------------
                when 'V' =>
                    code_o <= "011111"; -- V
                
                when 'v' =>
                    code_o <= "011111"; -- v
              -----------------------------
                when 'W' =>
                    code_o <= "100000"; -- W
                
                when 'w' =>
                    code_o <= "100000"; -- w
              -----------------------------
                when 'X' =>
                    code_o <= "100001"; -- X
                
                when 'x' =>
                    code_o <= "100001"; -- x
              -----------------------------
                when 'Y' =>
                    code_o <= "100010"; -- Y
              
                when 'y' =>
                    code_o <= "100010"; -- y
              -----------------------------
                when 'Z' =>
                    code_o <= "100011"; -- Z
                
                when 'z' =>
                    code_o <= "100011"; -- z
              -----------------------------
                when ' ' =>
                    code_o <= "111111"; --  (Space)
                
			    when others =>
                    code_o <= "111111"; --  (space)
                    
        end case;
    end process p_char_to_code;

end Behavioral;

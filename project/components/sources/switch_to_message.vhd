----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 09:11:44 AM
-- Design Name: 
-- Module Name: switch_to_message - Behavioral
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
--use work.bus_multiplexer_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity switch_to_message is
        generic(
            default_length : in integer := 32 
        );
        Port(
            sw_state_i : in std_logic_vector; 
            text_o : out string;
            text_length : out integer
        );
end switch_to_message;

architecture Behavioral of switch_to_message  is

begin

    p_switch_to_message : process(sw_state_i )
        
        constant NullString : String:= "                                "; 
    
        constant Message1  : String := "Zprava 1 ";
        constant Message2  : String := "Tajna zprava 2 ";
        constant Message3  : String := "Message 3 ";
        constant Message4  : String := "Pozdrav 4 ";
        constant Message5  : String := "Ahoj 5 ";
        constant Message6  : String := "Jak se mas 6 ";
        constant Message7  : String := "Ja se mam dobre 7 ";
        constant Message8  : String := "Empty message 8 ";
        constant Message9  : String := "Empty message 9 ";
        constant Message10 : String := "Empty message 10 ";
        constant Message11 : String := "Empty message 11 ";
        constant Message12 : String := "Empty message 12 ";
        constant Message13 : String := "Empty message 13 ";
        constant Message14 : String := "Empty message 14 ";
        constant Message15 : String := "Empty message 15 ";
        constant Message16 : String := "Empty message 16 ";
        
    begin
   
        case sw_state_i  is          
            
            when "0000000000000001" =>
                text_o <= NullString;
                text_o(Message1'length downto 1) <= Message1;
                text_length <= Message1'length;
           
            when "0000000000000010" =>
                text_o <= NullString;
                text_o(Message2'length downto 1) <= Message2;
                text_length <= Message2'length;
                
            when "0000000000000100" =>
                text_o <= NullString;
                text_o(Message3'length downto 1) <= Message3;
                text_length <= Message3'length; 
                
            when "0000000000001000" =>
                text_o <= NullString;
                text_o(Message4'length downto 1) <= Message4;
                text_length <= Message4'length;                 
                
            when "0000000000010000" =>
                text_o <= NullString;
                text_o(Message5'length downto 1) <= Message5;
                text_length <= Message5'length;                 
                
            when "0000000000100000" =>         
                text_o <= NullString;
                text_o(Message6'length downto 1) <= Message6;
                text_length <= Message6'length;                 
                
            when "0000000001000000" =>
                text_o <= NullString;
                text_o(Message7'length downto 1) <= Message7;
                text_length <= Message7'length;
                
            when "0000000010000000" =>
                text_o <= NullString;
                text_o(Message8'length downto 1) <= Message8;
                text_length <= Message8'length;            
                
            when "0000000100000000" =>
                text_o <= NullString;
                text_o(Message9'length downto 1) <= Message9;
                text_length <= Message9'length;
           
            when "0000001000000000" =>
                text_o <= NullString;
                text_o(Message10'length downto 1) <= Message10;
                text_length <= Message10'length;
                
            when "0000010000000000" =>
                text_o <= NullString;
                text_o(Message11'length downto 1) <= Message11;
                text_length <= Message11'length; 
                
            when "0000100000000000" =>
                text_o <= NullString;
                text_o(Message12'length downto 1) <= Message12;
                text_length <= Message12'length;                 
                
            when "0001000000000000" =>
                text_o <= NullString;
                text_o(Message13'length downto 1) <= Message13;
                text_length <= Message13'length;                 
                
            when "0010000000000000" =>         
                text_o <= NullString;
                text_o(Message14'length downto 1) <= Message14;
                text_length <= Message14'length;                 
                
            when "0100000000000000" =>
                text_o <= NullString;
                text_o(Message15'length downto 1) <= Message15;
                text_length <= Message15'length;
                
            when "1000000000000000" =>
                text_o <= NullString;
                text_o(Message16'length downto 1) <= Message16;
                text_length <= Message16'length;
                
            when others =>
                --text_o(18 downto 1) <= "Invalid selection ";
                text_o(32 downto 1) <= "Bhoj Ahoj Ahoj Ahoj Ahoj Ahoj Ah";
                text_length <= 18;                                                     
                           
        end case;    
    end process p_switch_to_message;

end architecture Behavioral;

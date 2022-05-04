library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package bus_multiplexer_pkg is
--        type array_std_logic is array(natural range <>) of std_logic_vector;
--        type array_string is array(natural range <>) of string;
    type array_vector is array(32 downto 1) of std_logic_vector (5 downto 0);
end package;
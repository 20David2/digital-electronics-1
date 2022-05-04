# switch_to_message

0. Component in/out:

```vhdl
entity switch_to_message is
        generic(
            default_length : in integer := 63 
        );
        Port(
            sw_state_i : in std_logic_vector; 
            text_o : out string;
            text_length : out integer
        );
end switch_to_message;
```
1. Save message to switch 1

```vhdl
 case sw_state_i  is          
            
            when "0000000000000001" =>
                text_o <= NullString;
                text_o(Message1'length downto 1) <= Message1;
                text_length <= Message1'length;
```
2. Simulation 
![screenshot](..images/switch_to_message_simulation_console.png)

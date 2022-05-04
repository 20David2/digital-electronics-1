# TOP

0. Component in/out:

```vhdl
entity newtop is
    Port ( CLK100MHZ : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out std_logic_vector (7 downto 0);
           BTNC : in std_logic;
           SW : in STD_LOGIC_vector(15 downto 0);
           BTND : in STD_logic
           );
end newtop;
```

1. Message in memory of switch

```vhdl
    switch : entity work.switch_to_message
        generic map(
            default_length => 32 
        )
        port map(
            sw_state_i => SW, 
            text_o => text_text,
            text_length => length
        );
        
```

2. Moving text on 7-seg displays

```vhdl
 move : entity work.move_text 
        generic map(
            default_speed => 50000000
        )
        port map(
            clk     => CLK100MHZ,
            reset   => BTND,
            code_i => code,
--            code_i => ("000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000","000001", "000010", "000011", "000100", "000101", "000110", "000111", "001000"), 
            code_length_i => length,
            data0_o => data0,
            data1_o => data1,
            data2_o => data2,
            data3_o => data3,
            data4_o => data4,
            data5_o => data5,
            data6_o => data6,
            data7_o => data7
        );   
        
```

3. Driver text  on 7-seg display by 8 characters

```vhdl

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
        
```


4. Simulation

![screenshot](../images/top.png)

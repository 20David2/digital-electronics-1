# Running text on 7-seg displays

### Team members

David Strouhal 230671
* https://github.com/20David2/digital-electronics-1

Martin Zárecký 230916
* https://github.com/Martinececicek

Michal Marek 195387
* https://github.com/MichalMarek2010/digital-electronics-1


### Content of the project

* [Project goals](#objectives)
* [Hardware description](#hardware)
* [Description of the priject and of the simulation modules of VHDL](#modules)
* [Description of TOP modules and its simulati](#top)
* [Video](#video)
* [Reference](#references)

<a name="objectives"></a>

## Project objectives

* Posouvaní textu po 7-seg dipleji
* Reset textu do výchozí pozice a rychlost
* Zvolit si z možnosti předefinovaných textů 

<a name="hardware"></a>

## Hardware description

* Nexys A7 Board

Pro programování a simulování vytvořených codů využíváme desku Nexys A7 s FPGA Artix 7. Deska zaručuje velkou externí pamět, vysokokapacitní FPGA, sbírku USB a Ethernet protů. Díky tomu mužeme vytvařet navrhy kombinačních obvodů. Kromě toho obsahuje také moduly měření teploty, akcelerometr, digitalní microfon nebo zesilovač reproduktorů. 

<a name="modules"></a>

## VHDL modules description and simulations

Zobrazení znaků na 7-seg displej
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/alphabet_7seg.md

Zprovoznění hodinového signálu
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/clock_enable.md

Čítač
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/cnt_up_down.md

Odesílaní znaků na 7-seg displej
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/driver_7seg_8characters.md

Přiřazení textu do jednotlivých switchu
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/switch_to_message.md

Propojení znaků z klavesnice k znakům v programu
* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/char_to_code.md

<a name="top"></a>

## TOP module description and simulations

* https://github.com/20David2/digital-electronics-1/blob/main/project/docs/top.md

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. Tabulka znaků na 7-seg displeji
* https://codegolf.stackexchange.com/questions/173837/longest-seven-segment-word
2. Nexs A7 Refernce Manual
* https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual
3. Segmenty 7-seg displeje
* https://lastminuteengineers.b-cdn.net/wp-content/uploads/arduino/Common-Cathode-7-Segment-Display-Internal-Working.gif
4. Popis 7-seg displeje
* https://lastminuteengineers.com/seven-segment-arduino-tutorial/
5. Nejdelší 7-seg slovo
* https://codegolf.stackexchange.com/questions/173837/longest-seven-segment-word


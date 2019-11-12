create_clock -name clk -period 10.0 [get_ports clk] -waveform {0 5}
set_input_delay -max 5 -clock clk [get_ports fm]
set_input_delay -min 2 -clock clk [get_ports fm]
set_output_delay -max 1 -clock clk [all_outputs]

create_clock -name clk -period 10.0 [get_ports clk] -waveform {0 5 }
set_input_delay -min 1 -clock clk [all_inputs]
set_input_delay -max 4 -clock clk [all_inputs]
set_output_delay -max 6 -clock clk [all_outputs]
set_load 5.5 [get_ports douta[*]]

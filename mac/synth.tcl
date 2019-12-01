set dirt /home/gsaied/Desktop/verilog_rtl/mac
cd $dirt
read_verilog mac.v 
#synth_design -top mac -rtl
synth_design -top mac -part xc7vx690t -max_dsp 0
report_timing -max_paths 50 -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt


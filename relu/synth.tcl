set dirt /home/gsaied/Desktop/verilog_rtl/relu
cd $dirt
read_verilog relu.v 
synth_design -top relu -rtl
#synth_design -top relu -part xc7vx690t
report_utilization -file $dirt/utiliziation.rpt
report_timing_summary -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt


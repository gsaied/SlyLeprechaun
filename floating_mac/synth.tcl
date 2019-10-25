set dirt /home/gsaied/Desktop/verilog_rtl/floating_mac
cd $dirt
read_verilog  mac.v 
#synth_design -top mac -rtl
synth_design -top mac -part xc7vx690t
report_timing_summary -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt

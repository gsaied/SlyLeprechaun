set dirt /home/gsaied/Desktop/verilog_rtl/relu/gemy
cd $dirt
read_verilog relu.v 
synth_design -top relu -rtl
#synth_design -top relu -part xc7vx690t
report_utilization -file $dirt/utiliziation.rpt
report_timing -max_paths 50 -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt


set dirt /home/gsaied/Desktop/verilog_rtl/pool/bad_pool
cd /
read_verilog [ glob ./home/gsaied/Desktop/verilog_rtl/pool/bad_pool/*.v ] 
synth_design -top new_pool -rtl
#synth_design -top pool -rtl
#synth_design -top pool -part xc7vx690t
#synth_design -top new_pool -part xc7vx690t
#opt_design
report_utilization -file $dirt/utiliziation.rpt
report_timing -max_paths 50 -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
start_gui

set dirt /home/gsaied/Desktop/verilog_rtl/conv10
cd $dirt
read_verilog -sv [ glob *.sv ] 
#synth_design -top rom2 -rtl
#start_gui
#report_timing -max_paths 50 -file $dirt/timing.rpt
synth_design -top rom2 -part xc7vx690t -keep_equivalent_registers -flatten_hierarchy none
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt

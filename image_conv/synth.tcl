set dirt /home/gsaied/Desktop/verilog_rtl/image_conv
cd $dirt
read_verilog -sv [ glob *.sv ] 
synth_design -top rom -part xc7vx690t -keep_equivalent_registers -flatten_hierarchy none
#synth_design -top image_conv -rtl
#start_gui
#report_timing -max_paths 50 -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt

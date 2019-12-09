set dirt /home/gsaied/Desktop/verilog_rtl/fire9/expand3
cd $dirt
read_verilog -sv [ glob *.sv ] 
synth_design -top  fire9_ex_3 -part xc7vx690t -keep_equivalent_registers -flatten_hierarchy none
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt
report_timing -file $dirt/timing.rpt

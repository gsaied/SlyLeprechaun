set dirt /home/gsaied/Desktop/verilog_rtl/pool/pool_sv
cd $dirt
read_verilog [ glob *.sv ]
#synth_design -top pool_wrapper -part xc7vx690t
synth_design -top  pool_wrapper -rtl
#opt_design
report_utilization -file $dirt/utiliziation.rpt
report_timing -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
start_gui

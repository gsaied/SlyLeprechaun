set dirt /home/gsaied/Desktop/verilog_rtl/non_softmax
cd $dirt
read_verilog [ glob *.sv ]
create_fileset -constrset constr
add_files nonsoftmax.xdc
synth_design -top nonsoftmax -part xc7vx690t -constrset constr
#synth_design -top  nonsoftmax -rtl
#opt_design
report_utilization -file $dirt/utiliziation.rpt
report_timing -max_paths 50 -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
#start_gui

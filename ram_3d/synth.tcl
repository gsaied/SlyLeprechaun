set dirt /home/gsaied/Desktop/verilog_rtl/ram_3d
cd $dirt
read_verilog -sv ram_3d.sv
read_verilog -sv ram_dist.sv
#create_fileset -constrset constr
#add_files ram_3d.xdc
#start_gui
synth_design -top ram_3d -part xc7vx690t  
#synth_design -top  ram_3d -rtl
#start_gui
#opt_design

report_utilization -file $dirt/utiliziation.rpt
report_design_analysis -file $dirt/design.rpt
report_timing -file $dirt/timing.rpt

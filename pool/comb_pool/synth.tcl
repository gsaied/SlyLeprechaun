set dirt /home/gsaied/Desktop/verilog_rtl/pool/comb_pool
cd $dirt
read_verilog -sv pool.sv
#create_fileset -constrset constr
#add_files pool.xdc
#start_gui
#synth_design -top pool -part xc7vx690t -constrset constr
synth_design -top  pool -rtl
start_gui
#opt_design

report_utilization -file $dirt/utiliziation.rpt
report_design_analysis -file $dirt/design.rpt

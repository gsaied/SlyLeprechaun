set dirt /home/gsaied/Desktop/verilog_rtl/rom_comb
cd $dirt
read_verilog -sv [ glob *.sv ] 
create_fileset -constrset constr
 add_files rom_comb.xdc
#synth_design -top rom_comb -rtl
#start_gui
#report_timing -max_paths 50 -file $dirt/timing.rpt
synth_design -top rom_comb -part xc7vx690t -keep_equivalent_registers -flatten_hierarchy none -constrset constr
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt
report_timing -file $dirt/timing.rpt

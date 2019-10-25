set dirt /home/gsaied/Desktop/verilog_rtl/pool
cd /
read_verilog [ glob ./home/gsaied/Desktop/verilog_rtl/pool/*.v ] 
synth_design -top pool 
report_timing_summary -file $dirt/timing.rpt
report_design_analysis -file $dirt/design.rpt
report_utilization -file $dirt/utiliziation.rpt


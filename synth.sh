find -name s*.tcl | while read LINE; do sed -i 's/report_timing_summary/report_timing\ -max_paths\ 50/g' $LINE  ; done

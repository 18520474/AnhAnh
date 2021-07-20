onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/number_of_frame
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/rst
add wave -noupdate /top_tb/load
add wave -noupdate /top_tb/first
add wave -noupdate /top_tb/d_in
add wave -noupdate /top_tb/file_in
add wave -noupdate /top_tb/file_out
add wave -noupdate /top_tb/scan_status
add wave -noupdate /top_tb/random_wr
add wave -noupdate /top_tb/random_rd
add wave -noupdate /top_tb/input_fifo_output
add wave -noupdate /top_tb/input_fifo_buff_full
add wave -noupdate /top_tb/input_fifo_buff_empty
add wave -noupdate /top_tb/input_fifo_wr_en
add wave -noupdate /top_tb/input_fifo_rd_en
add wave -noupdate /top_tb/load_weight_done
add wave -noupdate /top_tb/core_d_out
add wave -noupdate /top_tb/core_output_valid
add wave -noupdate /top_tb/core_input_valid
add wave -noupdate /top_tb/core_sof
add wave -noupdate /top_tb/output_fifo_output
add wave -noupdate /top_tb/output_fifo_buff_empty
add wave -noupdate /top_tb/output_fifo_rd_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 43
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {65365 ps} {66365 ps}

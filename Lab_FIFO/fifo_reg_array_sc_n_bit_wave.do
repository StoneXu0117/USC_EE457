onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider PRODUCER
add wave -noupdate /fifo_tb/PROD/reset
add wave -noupdate /fifo_tb/PROD/full
add wave -noupdate /fifo_tb/PROD/wen
add wave -noupdate -radix hexadecimal /fifo_tb/PROD/data_to_send
add wave -noupdate -radix hexadecimal /fifo_tb/PROD/producerptr
add wave -noupdate -radix hexadecimal /fifo_tb/PROD/latency_counter
add wave -noupdate /fifo_tb/PROD/wclk_clock_count
add wave -noupdate -divider FIFO
add wave -noupdate /fifo_tb/FIFO/clk
add wave -noupdate /fifo_tb/FIFO/reset
add wave -noupdate -radix hexadecimal /fifo_tb/FIFO/data_in
add wave -noupdate /fifo_tb/FIFO/wen
add wave -noupdate /fifo_tb/FIFO/ren
add wave -noupdate -radix hexadecimal /fifo_tb/FIFO/data_out
add wave -noupdate /fifo_tb/FIFO/empty
add wave -noupdate /fifo_tb/FIFO/full
add wave -noupdate -radix hexadecimal -childformat {{{/fifo_tb/FIFO/Reg_Array[15]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[14]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[13]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[12]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[11]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[10]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[9]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[8]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[7]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[6]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[5]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[4]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[3]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[2]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[1]} -radix hexadecimal} {{/fifo_tb/FIFO/Reg_Array[0]} -radix hexadecimal}} -subitemconfig {{/fifo_tb/FIFO/Reg_Array[15]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[14]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[13]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[12]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[11]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[10]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[9]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[8]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[7]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[6]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[5]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[4]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[3]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[2]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[1]} {-radix hexadecimal} {/fifo_tb/FIFO/Reg_Array[0]} {-radix hexadecimal}} /fifo_tb/FIFO/Reg_Array
add wave -noupdate -radix hexadecimal -childformat {{{/fifo_tb/FIFO/depth[3]} -radix hexadecimal} {{/fifo_tb/FIFO/depth[2]} -radix hexadecimal} {{/fifo_tb/FIFO/depth[1]} -radix hexadecimal} {{/fifo_tb/FIFO/depth[0]} -radix hexadecimal}} -subitemconfig {{/fifo_tb/FIFO/depth[3]} {-radix hexadecimal} {/fifo_tb/FIFO/depth[2]} {-radix hexadecimal} {/fifo_tb/FIFO/depth[1]} {-radix hexadecimal} {/fifo_tb/FIFO/depth[0]} {-radix hexadecimal}} /fifo_tb/FIFO/depth
add wave -noupdate -radix hexadecimal /fifo_tb/FIFO/rdptr
add wave -noupdate -radix hexadecimal /fifo_tb/FIFO/wrptr
add wave -noupdate /fifo_tb/FIFO/AE_AF_flag
add wave -noupdate /fifo_tb/FIFO/raw_almost_empty
add wave -noupdate /fifo_tb/FIFO/raw_almost_full
add wave -noupdate /fifo_tb/FIFO/wenq
add wave -noupdate /fifo_tb/FIFO/renq
add wave -noupdate -divider CONSUMER
add wave -noupdate /fifo_tb/CONS/reset
add wave -noupdate /fifo_tb/CONS/empty
add wave -noupdate /fifo_tb/CONS/ren
add wave -noupdate -radix hexadecimal /fifo_tb/CONS/data_to_consume
add wave -noupdate -radix hexadecimal /fifo_tb/CONS/con_mem
add wave -noupdate -radix hexadecimal /fifo_tb/CONS/consumeptr
add wave -noupdate -radix hexadecimal /fifo_tb/CONS/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3562700 ps} 0} {{Cursor 2} {9736853 ps} 0} {{Cursor 3} {6153511 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {3385930 ps} {4132138 ps}

vsim datapath
view wave
add wave /clock
add wave /IR_Test
add wave /test_data
add wave /test_destination
add wave /reset
add wave /test_reg_select
add wave /data_source
add wave /destination_select
add wave /rf_select
add wave /rf_test
add wave /RA
add wave /alu_b
add wave /RZ
add wave /stage_five
add wave /instruction
add wave /ir_enable
add wave /data_d
force clock 0 0, 1 50 -repeat 100
force reset 1 0, 0 250
force test_destination 0001 0, 0010 100
force data_source 1 0, 0 250
force destination_select 1 0, 0 250
force test_data 0110010101101011 0, 0001110101101010 100
force IR_Test 001100000000100100011010 0
force rf_select 1 0, 0 250
force rf_test 1 0
force test_reg_select 10 0
run 900
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /alu_avr/alu_data_r_in
add wave -noupdate -radix decimal /alu_avr/alu_data_d_in
add wave -noupdate /alu_avr/alu_c_flag_in
add wave -noupdate /alu_avr/alu_z_flag_in
add wave -noupdate /alu_avr/idc_add
add wave -noupdate /alu_avr/idc_adc
add wave -noupdate /alu_avr/idc_adiw
add wave -noupdate /alu_avr/idc_sub
add wave -noupdate /alu_avr/idc_subi
add wave -noupdate /alu_avr/idc_sbc
add wave -noupdate /alu_avr/idc_sbci
add wave -noupdate /alu_avr/idc_sbiw
add wave -noupdate /alu_avr/adiw_st
add wave -noupdate /alu_avr/sbiw_st
add wave -noupdate /alu_avr/idc_and
add wave -noupdate /alu_avr/idc_andi
add wave -noupdate /alu_avr/idc_or
add wave -noupdate /alu_avr/idc_ori
add wave -noupdate /alu_avr/idc_eor
add wave -noupdate /alu_avr/idc_com
add wave -noupdate /alu_avr/idc_neg
add wave -noupdate /alu_avr/idc_inc
add wave -noupdate /alu_avr/idc_dec
add wave -noupdate /alu_avr/idc_cp
add wave -noupdate /alu_avr/idc_cpc
add wave -noupdate /alu_avr/idc_cpi
add wave -noupdate /alu_avr/idc_cpse
add wave -noupdate /alu_avr/idc_lsr
add wave -noupdate /alu_avr/idc_ror
add wave -noupdate /alu_avr/idc_asr
add wave -noupdate /alu_avr/idc_swap
add wave -noupdate -radix decimal /alu_avr/alu_data_out
add wave -noupdate /alu_avr/alu_c_flag_out
add wave -noupdate /alu_avr/alu_z_flag_out
add wave -noupdate /alu_avr/alu_n_flag_out
add wave -noupdate /alu_avr/alu_v_flag_out
add wave -noupdate /alu_avr/alu_s_flag_out
add wave -noupdate /alu_avr/alu_h_flag_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 237
configure wave -valuecolwidth 183
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {200 ns}



force /alu_avr/alu_data_r_in	00000000
force /alu_avr/alu_data_d_in	00000000
force /alu_avr/alu_c_flag_in	0
force /alu_avr/alu_z_flag_in	0
force /alu_avr/idc_add		0
force /alu_avr/idc_adc		0
force /alu_avr/idc_adiw		0
force /alu_avr/idc_sub		0
force /alu_avr/idc_subi		0
force /alu_avr/idc_sbc		0
force /alu_avr/idc_sbci		0
force /alu_avr/idc_sbiw		0
force /alu_avr/adiw_st		0
force /alu_avr/sbiw_st		0
force /alu_avr/idc_and		0
force /alu_avr/idc_andi		0
force /alu_avr/idc_or		0
force /alu_avr/idc_ori		0
force /alu_avr/idc_eor		0
force /alu_avr/idc_com		0
force /alu_avr/idc_neg		0
force /alu_avr/idc_inc		0
force /alu_avr/idc_dec		0
force /alu_avr/idc_cp		0
force /alu_avr/idc_cpc		0
force /alu_avr/idc_cpi		0
force /alu_avr/idc_cpse		0
force /alu_avr/idc_lsr		0
force /alu_avr/idc_ror		0
force /alu_avr/idc_asr		0
force /alu_avr/idc_swap		0

run 20ns

force /alu_avr/alu_data_r_in	00111010
force /alu_avr/alu_data_d_in	01000011

run 10ns

force /alu_avr/idc_add		1

run 20ns

force /alu_avr/idc_add		0

run 10ns

force /alu_avr/idc_sub		1

run 20ns

force /alu_avr/idc_sub		0

run 20ns





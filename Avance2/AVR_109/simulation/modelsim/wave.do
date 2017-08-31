vsim -t ns AVR_109

add wave AVR_109/data_in
add wave AVR_109/clk
add wave AVR_109/ena_in
add wave AVR_109/reset_n
add wave AVR_109/prog_addr
add wave AVR_109/prog_data
add wave AVR_109/f2/state_d

force /AVR_109/clk 1 0, 0 {500 ns} -r 1000
force /AVR_109/reset_n 0
run 1000
force /AVR_109/reset_n 1
run 1000
force /AVR_109/ena_in 0
run 0.1 ms
force /AVR_109/data_in 00011011
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms
#
force /AVR_109/data_in 10101010
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms
force /AVR_109/data_in 00011011
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms
#
force /AVR_109/data_in 10101010
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms
force /AVR_109/data_in 00011011
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms
#
force /AVR_109/data_in 10101010
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.5 ms

force /AVR_109/data_in 00011011
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms

force /AVR_109/data_in 01000001
run 1000
force /AVR_109/ena_in 1
run 1000
force /AVR_109/ena_in 0
run 1.2 ms


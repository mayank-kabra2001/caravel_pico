## MASTER CLOCKS
create_clock [get_ports $::env(CLOCK_PORT)]  -name $::env(CLOCK_PORT)  -period $::env(CLOCK_PERIOD)

## FALSE PATHS
set_false_path -from [get_port $::env(RESET_PORT)]

## INPUT/OUTPUT DELAYS
set input_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
set output_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
puts "\[INFO\]: Setting output delay to: $output_delay_value"
puts "\[INFO\]: Setting input delay to: $input_delay_value"

## DFFRAM INPUTS
set skew 0.22
set mem_rdata_min_delay 2.85
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[0]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[1]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[2]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[3]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[4]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[5]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[6]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[7]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[8]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[9]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[10]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[11]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[12]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[13]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[14]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[15]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[16]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[17]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[18]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[19]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[20]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[21]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[22]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[23]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[24]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[25]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[26]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[27]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[28]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[29]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[30]]
set_input_delay $mem_rdata_min_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_port mem_rdata[31]]

## HK INPUTS 
set hk_min_input_delay 1 
set_input_delay $hk_min_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports irq[*]]
set_input_delay 5.60  -clock [get_clocks $::env(CLOCK_PORT)] [get_ports flash_io0_di]
set_input_delay 5.80 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports flash_io1_di]
set_input_delay 5.60  -clock [get_clocks $::env(CLOCK_PORT)] [get_ports flash_io2_di]
set_input_delay 5.60 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports flash_io3_di]
set_input_delay 2.38 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports hk_dat_i[*]]
set_input_delay 2.89 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports hk_ack_i]
set_input_delay 5.85 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports ser_tx]
set_input_delay 5.80 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports spi_sdi]
set_input_delay 5.60  -clock [get_clocks $::env(CLOCK_PORT)] [get_ports debug_in]
set_input_delay $hk_min_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports sram_ro_clk]
set_input_delay $hk_min_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports sram_ro_csb]
set_input_delay $hk_min_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports sram_ro_addr[*]]


## USER PROJECT WRAPPER INPUTS
set user_input_delay 1 
set_input_delay $user_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports la_input[*]]
set_input_delay $user_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports mprj_ack_i]
set_input_delay $user_input_delay -clock [get_clocks $::env(CLOCK_PORT)] [get_ports mprj_dat_i[*]]

## PADFRAME INPUTS
set padframe_input_delay 1 
set_input_delay $padframe_input_delay  -clock [get_clocks $::env(CLOCK_PORT)] [get_ports gpio_in_pad]

## OUTPUT DELAYS
set_output_delay $output_delay_value  -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]

## INPUT DRIVER
set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $::env(SYNTH_DRIVING_CELL_PIN) [all_inputs]
set cap_load [expr $::env(SYNTH_CAP_LOAD) / 1000.0]
puts "\[INFO\]: Setting load to: $cap_load"
set_load  $cap_load [all_outputs]

puts "\[INFO\]: Setting clock uncertainity to: $::env(SYNTH_CLOCK_UNCERTAINITY)"
set_clock_uncertainty $::env(SYNTH_CLOCK_UNCERTAINITY) [get_clocks $::env(CLOCK_PORT)]

puts "\[INFO\]: Setting clock transition to: $::env(SYNTH_CLOCK_TRANSITION)"
set_clock_transition $::env(SYNTH_CLOCK_TRANSITION) [get_clocks $::env(CLOCK_PORT)]

puts "\[INFO\]: Setting timing derate to: [expr {$::env(SYNTH_TIMING_DERATE) * 10}] %"
set_timing_derate -early [expr {1-$::env(SYNTH_TIMING_DERATE)}]
set_timing_derate -late [expr {1+$::env(SYNTH_TIMING_DERATE)}]
set_max_fanout $::env(SYNTH_MAX_FANOUT) [current_design]

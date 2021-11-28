set ::env(CLOCK_PORT) "core_clk"
set ::env(CLOCK_PERIOD) "25"

set ::env(IO_PCT) "0.2"
set ::env(SYNTH_DRIVING_CELL) "sky130_fd_sc_hd__inv_1"
set ::env(SYNTH_DRIVING_CELL_PIN) "Y"
set ::env(SYNTH_MAX_FANOUT) "5"
set ::env(SYNTH_CAP_LOAD) "33.442"
set ::env(SYNTH_TIMING_DERATE) 0.05
set ::env(SYNTH_CLOCK_UNCERTAINITY) 0.25
set ::env(SYNTH_CLOCK_TRANSITION) 0.15

## MASTER CLOCKS
#create_clock [get_ports $::env(CLOCK_PORT) ] -name $::env(CLOCK_PORT)  -period 25
create_clock -name __VIRTUAL_CLOCK__  -period 25

## INPUT/OUTPUT DELAYS
set input_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
set output_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]

set clk_indx [lsearch [all_inputs] [get_port $::env(CLOCK_PORT)]]
set all_inputs_wo_clk [lreplace [all_inputs] $clk_indx $clk_indx]
set all_inputs_wo_clk_rst $all_inputs_wo_clk

set ::env(CLOCK_PORT) __VIRTUAL_CLOCK__
## INPUT/OUTPUT DELAYS
set_input_delay $input_delay_value  -clock [get_clocks __VIRTUAL_CLOCK__] [all_inputs]
set_output_delay $output_delay_value  -clock [get_clocks __VIRTUAL_CLOCK__] [all_outputs]

set_max_fanout $::env(SYNTH_MAX_FANOUT) [current_design]

# TODO set this as parameter
set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $::env(SYNTH_DRIVING_CELL_PIN) [all_inputs]
set cap_load [expr $::env(SYNTH_CAP_LOAD) / 1000.0]
puts "\[INFO\]: Setting load to: $cap_load"
set_load  $cap_load [all_outputs]

puts "\[INFO\]: Setting timing derate to: [expr {$::env(SYNTH_TIMING_DERATE) * 10}] %"
set_timing_derate -early [expr {1-$::env(SYNTH_TIMING_DERATE)}]
set_timing_derate -late [expr {1+$::env(SYNTH_TIMING_DERATE)}]

puts "\[INFO\]: Setting clock uncertainity to: $::env(SYNTH_CLOCK_UNCERTAINITY)"
set_clock_uncertainty $::env(SYNTH_CLOCK_UNCERTAINITY) [get_clocks $::env(CLOCK_PORT)]

puts "\[INFO\]: Setting clock transition to: $::env(SYNTH_CLOCK_TRANSITION)"
set_clock_transition $::env(SYNTH_CLOCK_TRANSITION) [get_clocks $::env(CLOCK_PORT)]

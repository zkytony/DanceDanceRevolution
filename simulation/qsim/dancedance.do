onerror {quit -f}
vlib work
vlog -work work dancedance.vo
vlog -work work dancedance.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.score_keep_vlg_vec_tst
vcd file -direction dancedance.msim.vcd
vcd add -internal score_keep_vlg_vec_tst/*
vcd add -internal score_keep_vlg_vec_tst/i1/*
add wave /*
run -all

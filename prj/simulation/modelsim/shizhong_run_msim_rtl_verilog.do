transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/FPGAa/a723/shizhong/src {G:/FPGAa/a723/shizhong/src/beep.v}

vlog -vlog01compat -work work +incdir+G:/FPGAa/a723/shizhong/pro_quartusiii/../sim {G:/FPGAa/a723/shizhong/pro_quartusiii/../sim/beep_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  beep_tb

add wave *
view structure
view signals
run -all

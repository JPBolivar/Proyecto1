transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/jeferson/Documentos/quartusprojects/AVR_109 {/home/jeferson/Documentos/quartusprojects/AVR_109/avr109tx.v}
vlog -vlog01compat -work work +incdir+/home/jeferson/Documentos/quartusprojects/AVR_109 {/home/jeferson/Documentos/quartusprojects/AVR_109/avr109rx.v}
vlog -vlog01compat -work work +incdir+/home/jeferson/Documentos/quartusprojects/AVR_109 {/home/jeferson/Documentos/quartusprojects/AVR_109/avr109.v}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/usart_trans_sm.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/contador104us.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/registro8.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/registro.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/usart_trans.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/codificador.vhd}
vcom -93 -work work {/home/jeferson/Documentos/quartusprojects/AVR_109/AVR_109.vhd}


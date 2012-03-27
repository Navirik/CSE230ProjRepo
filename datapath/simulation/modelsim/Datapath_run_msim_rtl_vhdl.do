transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/MuxA.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/MuxB.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/MuxC.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/MuxTest.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/control_unit_230.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/mux_2to1.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/mux_4to1.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/dff_16bit.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/mux_16to1.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/dec_4to16.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/const.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/mainmemory.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/pc.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/muxpc.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/adder.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/muxinc.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/pc_temp.vhd}
vcom -2008 -work work {C:/Users/Mitchell/Documents/School/CSE/230/datapath/immediate.vhd}

do "C:/Users/Mitchell/Documents/School/CSE/230/datapath/datapath_test.do"

onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib exdes_opt

do {wave.do}

view wave
view structure
view signals

do {exdes.udo}

run -all

quit -force

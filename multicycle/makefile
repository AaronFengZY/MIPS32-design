FILES = $(wildcard unit/*.v main/*.v)

.PHONY: $(FILES)

muticycle: sim/testbench.v $(FILES)
	mkdir -p result
	iverilog -o result/muticycle.vvp -I unit $^
	cd result && vvp muticycle.vvp

clean:
	rm -rf result

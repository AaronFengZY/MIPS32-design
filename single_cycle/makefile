FILES = $(wildcard unit/*.v main/*.v)

.PHONY: $(FILES)

single_cycle: sim/testbench.v $(FILES)
	mkdir -p result
	iverilog -o result/single_cycle.vvp -I unit $^
	cd result && vvp single_cycle.vvp

clean:
	rm -rf result

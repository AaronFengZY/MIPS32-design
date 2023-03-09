`include "defines.v"

module top 
    #(parameter W = `WORD_WIDTH) 
    (
        input wire clk, rst
    );
    
    // split clk for mem_wb
    wire mem_wb_clk = ~clk;

    wire[W-1:0] pc, inst, l_addr, l_data, s_addr, s_data;
    wire load_en, store_en;

    cpu cpu_inst(
        .main_clk(clk), .wb_clk(mem_wb_clk),
        .rst(rst),
        .pc(pc),
        .inst(inst),
        .load_en(load_en),
        .l_addr(l_addr),
        .l_data(l_data),
        .store_en(store_en),
        .s_addr(s_addr),
        .s_data(s_data)
    );

    dbg_imem imem(
        .clk(mem_wb_clk), .rst(rst),
        .addr(pc),
        .data(inst)
    );

    dbg_dmem dmem(
        .clk(mem_wb_clk), .rst(rst),
        .read_en(load_en),
        .read_addr(l_addr),
        .read_data(l_data),
        .write_en(store_en),
        .write_addr(s_addr),
        .write_data(s_data)
    );
endmodule
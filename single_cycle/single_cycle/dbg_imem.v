// dbg_imem.v: instruction memory instance for simulation

`include "defines.v"

module dbg_imem 
    #(
        parameter W = `WORD_WIDTH,
        parameter IMEM_SIZE = 128
    )
    (
        input wire clk, rst,
        input wire[W-1:0] addr,
        output reg[W-1:0] data
    );
    
    // Instruction memory can only be addressed by words
    reg[W-1:0] mem[IMEM_SIZE-1:0];
    
    initial begin
        $readmemh(`IMEM_SIM_FILE, mem);
    end

    always @(*) begin
        data <= mem[addr[12:2]];
    end
endmodule
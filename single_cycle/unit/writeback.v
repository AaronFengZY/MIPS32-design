// writeback.v

`include "defines.v"

module writeback 
    #(parameter W = `WORD_WIDTH) 
    (
        input wire clk, rst,

        input wire reg_write,
        input wire[W-1:0] alu_result, mem_data, pc,
        input wire[`REG_ADDR_W-1:0] rd, rt,
        input wire[`REG_W_SRC_WIDTH-1:0] reg_write_src,
        input wire[`REG_W_DST_WIDTH-1:0] reg_write_dst,

        output wire write_en,
        output reg[`REG_ADDR_W-1:0] reg_write_addr,
        output reg[W-1:0] reg_write_data
    );
    
    assign write_en = reg_write;

    always @(*) begin
        if (reg_write) begin
            case (reg_write_src)
                `REG_W_SRC_ALU:
                    reg_write_data <= alu_result;
                `REG_W_SRC_MEM:
                    reg_write_data <= mem_data;
                `REG_W_SRC_PCA4:
                    reg_write_data <= pc + 4;
                default: reg_write_data <= `ZERO_WORD;
            endcase
            case (reg_write_dst)
                `REG_W_DST_RD:
                    reg_write_addr <= rd;
                `REG_W_DST_RT:
                    reg_write_addr <= rt;
                `REG_W_DST_R31:
                    reg_write_addr <= `REG_ADDR_W'd31;
                default: reg_write_addr <= `REG_ADDR_W'b0;
            endcase
        end
    end
endmodule
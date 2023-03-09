// pc.v: instruction fetch stage

`include "defines.v"

module pc_with_addr_mux 
    #(parameter W = `WORD_WIDTH) 
    (
        input wire clk, rst,

        input wire can_branch,      // if the inst can branch
        input wire jump,            // if the inst must jump
        input wire targ_else_offset,// if the addr is target, true, else offset
        input wire branch_take,     // if the result is take

        input wire pc_addr_src_reg, // MUX condition: addr from reg or imm
        input wire[W-1:0] rs_val,   // MUX v1
        input wire[W-1:0] imm,      // MUX v2

        output reg[W-1:0] pc,
        input wire[W-1:0] read_inst,
        output reg[W-1:0] inst
    );
    wire[W-1:0] pc_targ_addr = (pc_addr_src_reg ? rs_val : imm);
    // posedge pc
    always @(posedge clk) begin
        if (rst) begin
            pc <= `ZERO_WORD;
        end
        else begin
            pc <=   (jump || (can_branch && branch_take)) ?
                    (targ_else_offset ? pc_targ_addr : (pc + pc_targ_addr + 4)) :
                    pc + 4;
        end
    end
    // negedge fetch
    always @(negedge clk) begin
        inst <= read_inst;
    end
endmodule
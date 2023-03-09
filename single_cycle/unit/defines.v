// # Debug and simulations
`define IMEM_SIM_FILE   "../sim/imem.in"
`define DMEM_SIM_FILE   "../sim/dmem.in"

// # High is 1
`define TRUE    1'b1
`define FALSE   1'b0

// # MIPS-C ISA
`define BYTE_WIDTH      8
`define HALF_WORD_WIDTH 16
`define WORD_WIDTH      32
`define WORD_INDEX_W    5
`define REG_ADDR_W      5
`define OP_WIDTH        6
`define FUNCT_WIDTH     6
`define J_ADDR_WIDTH    26
`define IMM_WIDTH       16

`define ZERO_WORD   `WORD_WIDTH'b0
`define REG_ZERO    `REG_ADDR_W'b0

// type encoding
`define T_ERR   2'b00
`define R_TYPE  2'b01
`define I_TYPE  2'b10
`define J_TYPE  2'b11

// # ALU ops
// ## ALU SRC def
`define ALU_SRC_WIDTH   4
`define ALU_OP_SRC_ZERO `ALU_SRC_WIDTH'd0
`define ALU_OP_SRC_IMM  `ALU_SRC_WIDTH'd1
`define ALU_OP_SRC_RS   `ALU_SRC_WIDTH'd2
`define ALU_OP_SRC_RT   `ALU_SRC_WIDTH'd3
`define ALU_OP_SRC_PC   `ALU_SRC_WIDTH'd4 // For jalr
// ## ALU defines
`define ALUOP_WIDTH     5
`define ALUOP_ERR       `ALUOP_WIDTH'd0
// ## Normal OP
`define ALU_ADD         `ALUOP_WIDTH'd1
`define ALU_SUB         `ALUOP_WIDTH'd2
`define ALU_MULT        `ALUOP_WIDTH'd3
`define ALU_DIV         `ALUOP_WIDTH'd4
`define ALU_SL          `ALUOP_WIDTH'd5
`define ALU_ARITH_SR    `ALUOP_WIDTH'd6
`define ALU_LOGIC_SR    `ALUOP_WIDTH'd7
`define ALU_AND         `ALUOP_WIDTH'd8
`define ALU_OR          `ALUOP_WIDTH'd9
`define ALU_XOR         `ALUOP_WIDTH'd10
`define ALU_NOR         `ALUOP_WIDTH'd11
// ## Compare: Equal, NotEqual, Greater, Lower,
//    GreaterEqual, LowerEqual, and Unsigned versions
`define ALU_EQ          `ALUOP_WIDTH'd12
`define ALU_NEQ         `ALUOP_WIDTH'd13
`define ALU_G           `ALUOP_WIDTH'd14
`define ALU_L           `ALUOP_WIDTH'd15
`define ALU_GE          `ALUOP_WIDTH'd16
`define ALU_LE          `ALUOP_WIDTH'd17
`define ALU_G_U         `ALUOP_WIDTH'd18
`define ALU_L_U         `ALUOP_WIDTH'd19
`define ALU_GE_U        `ALUOP_WIDTH'd20
`define ALU_LE_U        `ALUOP_WIDTH'd21

// # Reg MUX types
// Reg write src
`define REG_W_SRC_WIDTH 2
`define REG_W_SRC_ALU   `REG_W_SRC_WIDTH'd0
`define REG_W_SRC_MEM   `REG_W_SRC_WIDTH'd1
`define REG_W_SRC_PCA4  `REG_W_SRC_WIDTH'd2 // for jalr, jal
// Reg write dst
`define REG_W_DST_WIDTH 2
`define REG_W_DST_RD    `REG_W_DST_WIDTH'd0
`define REG_W_DST_RT    `REG_W_DST_WIDTH'd1
`define REG_W_DST_R31   `REG_W_DST_WIDTH'd2 // for jal

// # Mem MUX types
`define L_S_MODE_W      3
`define L_S_WORD        `L_S_MODE_W'd0
`define L_S_HALF        `L_S_MODE_W'd1
`define L_S_HALF_U      `L_S_MODE_W'd2
`define L_S_BYTE        `L_S_MODE_W'd3
`define L_S_BYTE_U      `L_S_MODE_W'd4

// # OP codes
`define OP_ERR  6'b111111
// ## I-type
`define LB      6'b100000
`define LBU     6'b100100
`define LH      6'b100001
`define LHU     6'b100101
`define LW      6'b100011
`define SB      6'b101000
`define SH      6'b101001
`define SW      6'b101011

`define ADDI    6'b001000
`define ADDIU   6'b001001
`define ANDI    6'b001100
`define LUI     6'b001111
`define ORI     6'b001101
`define SLTI    6'b001010
`define SLTIU    6'b001011
`define XORI    6'b001110

`define BEQ     6'b000100
`define BNE     6'b000101

`define BLEZ    6'b000110
`define BGTZ    6'b000111


// ### OP code conflict, must decide with rt field
// BGEZ and BLTZ share the same op code, we should distinguish them by 16-20 bit

`define BGEZ_BLTZ   6'b000001
`define BGEZRT  5'b00001
`define BLTZRT  5'b00000

// ## R-type
`define R_R     6'b000000
// ### R type funct, last 6 bit
// ### R-type jump instructions
`define JALR    6'b001001
`define JR      6'b001000
// ### R-R type
`define ADD     6'b100000
`define ADDU    6'b100001
`define AND     6'b100100
`define DIV     6'b011010
`define DIVU    6'b011011
`define MULT    6'b011000
`define MULTU   6'b011001
`define NOR     6'b100111
`define OR      6'b100101
`define SLL     6'b000000
`define SLLV    6'b000100
`define SLT     6'b101010
`define SLTU    6'b101011
`define SRA     6'b000011
`define SRAV    6'b000111
`define SRL     6'b000010
`define SRLV    6'b000110
`define SUB     6'b100010
`define SUBU    6'b100011
`define XOR     6'b100110

// ## J-type OP codes
`define J       6'b000010
`define JAL     6'b000011
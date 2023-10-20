module IU(
    input logic [31:7] inst,
    input logic [2:0] Immsrc,
    output logic [31:0] ImmExt
);

always_comb
    case(Immsrc)
        3'b000: ImmExt = {20{inst[31]},inst[31:20]};
        3'b001: ImmExt = {20{inst[31]},inst[31:25],inst[11:7]};
        3'b101: ImmExt = {19{inst[31]},inst[31],inst{7},inst[30:25],inst[11:8],1'b0};
        3'b010: ImmExt = {11{inst[31]},inst[31],inst[11],inst[30:21],inst[12],inst[19:13],1'b0};
        3'b110: ImmExt = {12{inst[31]},inst[31:12]};
        3'bxxx: ImmExt = 32'bx;

endmodule
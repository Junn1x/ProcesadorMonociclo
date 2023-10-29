module DM (
    input logic [31:0] address,
    input logic [31:0] DataWr,
    input logic DmWr,
    input logic [2:0] DmCtrl,
    output logic [31:0] DataRd
);

    logic[31:0] mem [63:0];

    always_comb
        if(DmWr)begin
            case(DmCtrl)
                3'b000: mem[address] = (mem[address] & 32'hFFFFFF00) | DataWr[7:0];
                3'b001: mem[address] = (mem[address] & 32'hFFFF0000) | DataWr[15:0];
                3'b010: mem[address] = DataWr;
            endcase
        end
        else begin
            case(DmCtrl)
                3'b000: DataRd = {24{mem[address][7]},mem[address][7:0]};
                3'b001: DataRd = {16{mem[address][15]},mem[address][15:0]};
                3'b010: DataRd = mem[address];
                3'b100: DataRd = {24'b0,mem[address[7:0]]};
                3'b101: DataRd = {16'b0,mem[address[15:0]]};
            endcase
        end

endmodule
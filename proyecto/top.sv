module top(
    input logic clk
);
    //PC
    logic [31:0] address;
    logic [31:0] add;

    //IM
    logic [31:0] Inst;

    //CU
    logic RUwr;
    logic [2:0] Immsrc;
    logic AluAsrc;
    logic AluBsrc;
    logic [3:0] ALUOp;
    logic [4:0] BUOp;
    logic DMWr;
    logic [2:0] DMctrl;
    logic [1:0] RudataWrsrc;

    //RU
    logic [31:0] Ru_rs1;
    logic [31:0] Ru_rs2;

    //IM
    logic [31:0] ImmExt;

    //ALU
    logic [31:0] ALUres;

    //MUX
    logic [31:0] nextPcAdress;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] RUdataWr;

    //BU
    logic nextPcsrc;

    //DM
    logic [31:0] Datard;
    always_comb begin
        if (AluAsrc)
            a = address;
        else
            a = Ru_rs1;
        if (AluBsrc)
            b = address;
        else
            b = Ru_rs2;
        if (nextPcsrc)
            nextPcAdress = ALUres;
        else
            nextPcAdress = add;
    end

    always_comb
    begin
    case(RuDataWrsrc)
    2'b00: RUdataWr = ALUres;
    2'b01: RUdataWr = Datard;
    2'b10: RUdataWr = add;
    endcase
    end

    alu alu1(
    .A(a),
    .B(b),
    .alu_op(ALUOp),
    .alu_out(ALUres)
    );

    RU RU1 (
        .clk(clk_tb),
        .RU_Data_Wr(RUdataWr),
        .rs1(Inst[19:15]),
        .rs2(Inst[24:20]),
        .Rd(Inst[11:7]),
        .RU_Wr(RUwr),
        .ru_RS1(Ru_rs1),
        .ru_RS2(Ru_rs2)
    );

    BU BU1(
        .ru_RS1(Ru_rs1),
        .ru_RS2(Ru_rs2),
        .BUOp(BUOp),
        .nextPcsrc(nextPcsrc)
    );

    CU CU1(
        .Opcode(Inst[6:0]),
        .func3(Inst[14:12]),
        .func7(Inst[31:25]),
        .Immsrc(Immsrc),
        .RuWr(RUwr),
        .ALUAsrc(AluAsrc),
        .ALUBsrc(AluBsrc),
        .ALUOp(ALUOp),
        .DmWr(DMWr),
        .DmCtrl(DMctrl),
        .RuDataWrsrc(RuDataWrsrc)
    );

    IU IU1(
        .inst(Inst[31:7]),
        .Immsrc(Immsrc),
        .ImmExt(ImmExt)
    );

    IM IM1(
        .address(address),
        .inst(Inst)
    );

    PC PC1(
        .clk(clk_tb),
        .nextPcAdress(nextPcAdress),
        .address(address)
    );

    always_ff @( posedge clk ) begin
        address = nextPcAdress;
        add = address + 4;
    end
    
    

endmodule
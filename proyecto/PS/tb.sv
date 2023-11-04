module FU_tb;

    logic [4:0]rs1_de_tb;
    logic [4:0]rs2_de_tb;
    logic [4:0]rd_me_tb;
    logic [4:0]rd_wb_tb;
    logic RUwr_me_tb;
    logic RUwr_wb_tb;
    logic [1:0]rs1_exSrc_tb;
    logic [1:0]rs2_exSrc_tb;

    FU FU1(
        .rs1_de(rs1_de_tb),
        .rs2_de(rs2_de_tb),
        .rd_me(rd_me_tb),
        .rd_wb(rd_wb_tb),
        .RUWr_me(RUwr_me_tb),
        .RUWr_wb(RUwr_wb_tb),
        .rs1_exSrc(rs1_exSrc_tb),
        .rs2_exSrc(rs2_exSrc_tb)
    );

    initial begin
        $dumpfile("FU.vcd");
        $dumpvars(0, FU_tb);

        rs1_de_tb = 3;
        rs2_de_tb = 10;
        rd_me_tb = 2;
        rd_wb_tb = 10;
        RUwr_me_tb = 1;
        RUwr_wb_tb = 1;
        #20;

        $finish;
    end
endmodule
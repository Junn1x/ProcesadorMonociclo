module RU_tb;

    logic clk_tb;
    logic rst_tb;
    logic [31:0] RU_Data_Wr_tb;
    logic [4:0] RS1_tb;
    logic [4:0] RS2_tb;
    logic [4:0] Rd_tb;
    logic RU_Wr_tb;
    logic [31:0] RU_RS1_tb;
    logic [31:0] RU_RS2_tb;

    RU RU_int (
        .clk(clk_tb),.rst(rst_tb),
        .RU_Data_Wr(RU_Data_Wr_tb),
        .rs1(RS1_tb),
        .rs2(RS2_tb),
        .Rd(Rd_tb),
        .RU_Wr(RU_Wr_tb),
        .ru_RS1(RU_RS1_tb),
        .ru_RS2(RU_RS2_tb)
    );

    initial begin
        clk_tb = 1;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        $dumpfile("RU.vcd");
        $dumpvars(0, RU_tb);
        RU_Wr_tb = 0;
        RU_Data_Wr_tb = 32'b00000000000000000000000000001111;
        RS1_tb = 5'b00010;
        RS2_tb = 5'b01000;
        Rd_tb = 5'b01000;
        #20;
        RU_Wr_tb = 1;
        RU_Data_Wr_tb = 32'b00000000000000000000000000011111;
        RS1_tb = 5'b00010;
        RS2_tb = 5'b10010;
        Rd_tb = 5'b00010;
        #20;
        RU_Data_Wr_tb = 32'b00000000000000000000000100000001;
        RS1_tb = 5'b00000;
        Rd_tb = 5'b00000;
        #20;
        RU_Data_Wr_tb = 32'b00000000000000000000000000010001;
        RS1_tb = 5'b00010;
        RS2_tb = 5'b00100;
        Rd_tb = 5'b00100;
        #20;
        RU_Wr_tb=0;
        RU_Data_Wr_tb = 32'b00000000000000000000000010000001;
        RS2_tb = 5'b00010;
        Rd_tb = 5'b00010;
        #20;
        
        $finish;
    end

endmodule

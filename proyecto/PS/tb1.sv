module HDU_tb;

    logic [4:0]rs1_de_tb;
    logic [4:0]rs2_de_tb;
    logic [4:0]rd_ex_tb;
    logic DMrd_ex_tb;
    logic clr_tb;

    HDU HDU1(
        .rs1_de(rs1_de_tb),
        .rs2_de(rs2_de_tb),
        .rd_ex(rd_ex_tb),
        .DMrd_ex(DMrd_ex_tb),
        .clr(clr_tb)
    );

    initial begin
        $dumpfile("HDU.vcd");
        $dumpvars(0, HDU_tb);

        rs1_de_tb = 3;
        rs2_de_tb = 2;
        rd_ex_tb = 2;
        DMrd_ex_tb = 1;
        #20;

        rs1_de_tb = 3;
        rs2_de_tb = 2;
        rd_ex_tb = 2;
        DMrd_ex_tb = 0;
        #20;

        rs1_de_tb = 3;
        rs2_de_tb = 2;
        rd_ex_tb = 3;
        DMrd_ex_tb = 1;
        #20;

        rs1_de_tb = 3;
        rs2_de_tb = 2;
        rd_ex_tb = 12;
        DMrd_ex_tb = 1;
        #20;

        $finish;
    end
endmodule
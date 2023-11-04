module FU(
    input logic [4:0] rs1_de,
    input logic [4:0] rs2_de,
    input logic [4:0] rd_me,
    input logic [4:0] rd_wb,
    input logic RUWr_me,
    input logic RUWr_wb,
    output logic [1:0]rs1_exSrc,
    output logic [1:0]rs2_exSrc
);

    always @(*) begin
        if(RUWr_me)begin
            if(rs1_de == rd_me)
                rs1_exSrc = 2'b01;
            else
                rs1_exSrc = 2'b00;
            if(rs2_de == rd_me)
                rs2_exSrc = 2'b01;
            else
                rs2_exSrc = 2'b00;
        end
        if(RUWr_wb)begin
            if(rs1_de == rd_wb)
                rs1_exSrc = 2'b10;
            else
                rs1_exSrc = 2'b00;
            if(rs2_de == rd_wb)
                rs2_exSrc = 2'b10;
            else
                rs1_exSrc = 2'b00;
        end
    end
    
endmodule
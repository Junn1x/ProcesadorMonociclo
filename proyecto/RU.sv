module RU(
    input logic clk,
    input logic rst,
    input logic [31:0] RU_Data_Wr,
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    input logic [4:0] Rd,
    input logic RU_Wr,
    output logic [31:0] ru_RS1,
    output logic [31:0] ru_RS2
);

logic [31:0] ru [0:31];
    
    initial begin
        for(int i = 0; i < 32; i = i + 1) begin
                ru[i] <= 32'b0;
            end
    end 

    always_ff @( posedge clk ) begin
        if(RU_Wr)begin
            ru[Rd] <= RU_Data_Wr;
            ru[0] <= 0;
        end
    end
    
    assign ru_RS1 = ru[rs1];
    assign ru_RS2 = ru[rs2];


endmodule

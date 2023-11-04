module HDU(
    input logic [4:0] rs1_de,
    input logic [4:0] rs2_de,
    input logic [4:0] rd_ex,
    input logic DMrd_ex,
    output logic clr
);

always @(*) begin
    if(DMrd_ex)begin
        if((rs1_de == rd_ex) | (rs2_de == rd_ex))begin
            clr = 1;
        end
        else
            clr = 0;
    end
    else
        clr = 0;
end
endmodule
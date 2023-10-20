module BU(
    input logic [31:0] ru_RS1,
    input logic [31:0] ru_RS2,
    input logic [4:0] BUOp,
    output logic nextPcsrc
);

    always_comb
        case(BUOp)
            5'b00xxx: nextPcsrc = 0;
            5'b01000:begin
                if(ru_RS1 == ru_RS2)begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b01001:begin
                if(ru_RS1 != ru_RS2)begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b01100:begin
                if($signed(ru_RS1) < $signed(ru_RS2))begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b01101:begin
                if($signed(ru_RS1) >= $signed(ru_RS2))begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b01110:begin
                if(ru_RS1 < ru_RS2)begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b01111:begin
                if(ru_RS1 >= ru_RS2)begin
                    nextPcsrc = 1;
                end
                else begin
                    nextPcsrc = 0;
                end
            end
            5'b1xxxx: nextPcsrc = 1;
        endcase
endmodule
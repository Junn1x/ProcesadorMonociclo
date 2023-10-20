module CU(
    input logic [6:0] func7,
    input logic [2:0] func3,
    input logic [6:0] Opcode,
    output logic [3:0] ALUOp,
    output logic [2:0] Immsrc,
    output logic ALUAsrc,
    output logic ALUBsrc,
    output logic [4:0] BUOp,
    output logic DmWr,
    output logic [2:0] DmCtrl,
    output logic [1:0] RuDataWrsrc,
    output logic RuWr
);

always_comb
    case(Opcode)
        //tipo R
        7'b0110011:begin
            ALUBsrc = 0;
            ALUAsrc = 0;
            BUOp = 5'b00xxx;
            DmWr = 0;
            DmCtrl = 3'bxxx;
            RuDataWrsrc = 2'b00;
            Immsrc = 3'bxxx;
            RuWr = 1;
            if(func7 = 7'b0100000)begin
                case(func3)
                    3'b000: ALUOp = 4'b1000;
                    3'b101: ALUOp = 4'b1101;
                endcase
            else if (func7 = 7'b0000000)begin
                case(func3)
                    3'b000: ALUOp = 4'b0000;
                    3'b001: ALUOp = 4'b0001;
                    3'b010: ALUOp = 4'b0011;
                    3'b011: ALUOp = 4'b0010;
                    3'b100: ALUOp = 4'b0100;
                    3'b101: ALUOp = 4'b0101;
                    3'b110: ALUOp = 4'b0110;
                    3'b111: ALUOp = 4'b0111;
                endcase
            end
            end
        end
        //Tipo i alu
        7'b0010011:begin
            RuWr = 1;
            Immsrc = 3'b000;
            ALUAsrc = 0;
            ALUBsrc = 1;
            BUOp = 5'b00xxx;
            DmCtrl = 3'bxxx;
            DmWr = 0;
            RuDataWrsrc = 2'b00;
            case(func3)
                3'b000: ALUOp = 4'b0000;
                3'b001: ALUOp = 4'b0001;
                3'b010: ALUOp = 4'b0011;
                3'b011: ALUOp = 4'b0010;
                3'b100: ALUOp = 4'b0100;
                3'b101: ALUOp = 4'b0101;
                3'b110: ALUOp = 4'b0110;
                3'b111: ALUOp = 4'b0111;
            endcase
        end
        //tipo i load
        7'b0000011:begin
            RuWr = 1;
            RuDataWrsrc 2'b01;
            Immsrc = 3'b000;
            ALUAsrc = 0;
            ALUBsrc = 1;
            ALUOp = 4'b0000;
            BUOp = 5'b00xxx;
            DmWr = 0;
            DmCtrl <= func3;
        end
        //jalr
        7'b1100111:begin
            RuWr = 1;
            Immsrc = 3'b000;
            ALUAsrc = 0;
            ALUBsrc = 1;
            ALUOp = 4'b0000;
            BUOp = 5'b1xxxx;
            DmWr = 0;
            DmCtrl = 3'bxxx;
            RuDataWrsrc = 2'b10;
        end
        //tipo j
        7'b1101111:begin
            Immsrc = 3'b110;
            RuWr = 1;
            ALUAsrc = 1;
            ALUBsrc = 1;
            BUOp = 5'b1xxxx;
            DmWr = 0;
            DmCtrl = 3'bxxx;
            RuDataWrsrc = 2'b10;
            ALUOp = 4'b0000;
        end
        //tipo s
        7'b0100011:begin
            RuWr = 0;
            Immsrc = 3'b001;
            BUOp = 5'b00xxx;
            ALUAsrc = 0;
            ALUBsrc = 1;
            ALUOp = 4'b0000;
            DmWr = 1;
            DmCtrl <= func3;
            RuDataWrsrc = 2'bxx;
        end
        //tipo b
        7'b1100011:begin
            RuWr = 0;
            Immsrc = 3'b101;
            ALUAsrc = 1;
            ALUBsrc = 1;
            ALUOp = 4'b0000;
            DmWr = 0;
            DmCtrl = 3'bxxx;
            RuDataWrsrc = 2'bxx;
            case(func3)
                3'b000: BUOp = 5'b01000;
                3'b001: BUOp = 5'b01001;
                3'b100: BUOp = 5'b01100;
                3'b101: BUOp = 5'b01101;
                3'b110: BUOp = 5'b01110;
                3'b111: BUOp = 5'b01111;
            endcase
        end
    endcase
    
endmodule
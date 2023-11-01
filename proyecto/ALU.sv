module alu(
    input logic [31:0] A, 
    input logic [31:0] B,  
    input logic [3:0] alu_op,     
    output logic [31:0] alu_out    
);

// Lógica de la ALU
always_comb 
    case (alu_op)
        4'b0000: alu_out = A + B;               
        4'b1000: alu_out = A - B;             
        4'b0001: alu_out = A << B;         
        4'b0101: alu_out = A >> B;         
        4'b1101: alu_out = $signed(A) >>> B;
        4'b0010: alu_out = $signed(A) < $signed(B);  
        4'b0011: alu_out = A < B; 
        4'b0111: alu_out = A & B;              
        4'b0110: alu_out = A | B;               
        4'b0100: alu_out = A ^ B;         
        default: alu_out = 4'b0;               
    endcase

endmodule
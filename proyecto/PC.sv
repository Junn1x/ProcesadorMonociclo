module PC (
    input logic [31:0] nextPcAdress,
    input logic clk,
    output logic [31:0] address = 0
);

    always_ff @( posedge clk ) begin
        address <= nextPcAdress; 
    end

endmodule

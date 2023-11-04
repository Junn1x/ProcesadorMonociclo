module IM (
    input logic [31:0] address,
    output logic [31:0] inst
);
    logic[31:0] mem [0:12];

    initial begin
        $readmemb("addresses.txt",mem);
    end
    assign inst = mem[{2'b00,address[31:2]}];
endmodule


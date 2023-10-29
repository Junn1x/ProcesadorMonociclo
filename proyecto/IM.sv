module IM (
    input logic [31:0] address,
    output logic [31:0] inst
);
    logic[31:0] mem [1023:0];

    always_comb begin
        $readmemb ("addresses.txt",mem);
        inst <= mem[address];
    end
endmodule


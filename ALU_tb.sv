module alu_tb;

  logic [3:0] A_tb = 0;
  logic [3:0] B_tb = 0;
  logic [3:0] alu_op_tb = 4'b0000;
  logic [3:0] alu_out_tb;

  alu alu1 (
    .A(A_tb),
    .B(B_tb),
    .alu_op(alu_op_tb),
    .alu_out(alu_out_tb)
  );

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    #20;
        // Pruebas 1: Suma
    alu_op_tb = 4'b0000; A_tb = 4'b0101; B_tb = 4'b1010; #20;    
    alu_op_tb = 4'b0000; A_tb = 4'b0001; B_tb = 4'b1010; #20;    
    alu_op_tb = 4'b0000; A_tb = 4'b1101; B_tb = 4'b1010; #20;
    alu_op_tb = 4'b0000; A_tb = 4'b0000; B_tb = 4'b1010; #20;

    // Pruebas 2: Resta
    alu_op_tb = 4'b1000; A_tb = 4'b0101; B_tb = 4'b1010; #20;
    alu_op_tb = 4'b1000; A_tb = 4'b0001; B_tb = 4'b1010; #20;
    alu_op_tb = 4'b1000; A_tb = 4'b0011; B_tb = 4'b1010; #20;
    alu_op_tb = 4'b1000; A_tb = 4'b0100; B_tb = 4'b1010; #20;
    
    // Pruebas 3: Corrimiento lógico a la izquierda
    alu_op_tb = 4'b0001; A_tb = 4'b0011; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b0001; A_tb = 4'b0101; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b0001; A_tb = 4'b0111; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b0001; A_tb = 4'b0100; B_tb = 4'b0001; #20;
    
    // Pruebas 4: Corrimiento lógico a la derecha
    alu_op_tb = 4'b0101; A_tb = 4'b1000; B_tb = 4'b0010; #20;    
    alu_op_tb = 4'b0101; A_tb = 4'b1100; B_tb = 4'b0010; #20;
    alu_op_tb = 4'b0101; A_tb = 4'b0100; B_tb = 4'b0010; #20;
    alu_op_tb = 4'b0101; A_tb = 4'b1010; B_tb = 4'b0001; #20;
    
    // Prueba 5: Corrimiento aritmético a la derecha (con signo)
    alu_op_tb = 4'b1101; A_tb = 4'b1010; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b1101; A_tb = 4'b0010; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b1101; A_tb = 4'b1100; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b1101; A_tb = 4'b0010; B_tb = 4'b0001; #20;
    
    // Prueba 6: Comparación < con signo
    alu_op_tb = 4'b0010; A_tb = 4'b1010; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b0010; A_tb = 4'b1010; B_tb = 4'b0011; #20;
    alu_op_tb = 4'b0010; A_tb = 4'b1010; B_tb = 4'b1001; #20;
    alu_op_tb = 4'b0010; A_tb = 4'b1010; B_tb = 4'b1101; #20;
    
    // Prueba 7: Comparación < sin signo
    alu_op_tb = 4'b0011; A_tb = 4'b1001; B_tb = 4'b0110; #20;    
    alu_op_tb = 4'b0011; A_tb = 4'b1001; B_tb = 4'b1110; #20;
    alu_op_tb = 4'b0011; A_tb = 4'b1001; B_tb = 4'b0111; #20;
    alu_op_tb = 4'b0011; A_tb = 4'b1001; B_tb = 4'b1111; #20;

    // Prueba 8: AND
    alu_op_tb = 4'b0111; A_tb = 4'b1001; B_tb = 4'b1001; #20;
    alu_op_tb = 4'b0111; A_tb = 4'b1011; B_tb = 4'b1101; #20;
    alu_op_tb = 4'b0111; A_tb = 4'b1001; B_tb = 4'b0001; #20;
    alu_op_tb = 4'b0111; A_tb = 4'b0001; B_tb = 4'b1001; #20;
    
    // Prueba 9: OR
    alu_op_tb = 4'b0110; A_tb = 4'b1001; B_tb = 4'b1001; #20;
    alu_op_tb = 4'b0110; A_tb = 4'b1101; B_tb = 4'b1011; #20;
    alu_op_tb = 4'b0110; A_tb = 4'b1101; B_tb = 4'b1001; #2
    alu_op_tb = 4'b0110; A_tb = 4'b1011; B_tb = 4'b1001; #20;

    // Prueba 10: XOR
    alu_op_tb = 4'b0100; A_tb = 4'b1001; B_tb = 4'b1001; #20
    alu_op_tb = 4'b0100; A_tb = 4'b1011; B_tb = 4'b1001; #20
    alu_op_tb = 4'b0100; A_tb = 4'b1001; B_tb = 4'b1101; #20
    alu_op_tb = 4'b0100; A_tb = 4'b1011; B_tb = 4'b1101; #20;
    
    // Prueba 11: Valor predeterminado
    alu_op_tb = 4'b0000; A_tb = 4'b0000; B_tb = 4'b0000; #20;
    
    $finish;
  end
endmodule;
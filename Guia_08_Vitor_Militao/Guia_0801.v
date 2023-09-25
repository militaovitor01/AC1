module halfAdder (
    output s0,
    output s1, 
    input a, 
    input b
);
    // descrever por portas
    assign s0 = a ^ b;
    assign s1 = a & b;
endmodule // halfAdder

module fullAdder (
    output s0,
    output s1,
    input a, 
    input b, 
    input carryIn
);
    // descrever por portas e/ou modulos
    halfAdder HA1 (s0_int, carryOut_int, a, b);
    halfAdder HA2 (s0, s1, s0_int, carryIn);
endmodule // fullAdder

module Guia_0801 (
    output [5:0] s,
    input [4:0] a,
    input [4:0] b
);
    reg [5:0] s_int;
    wire carry0;

    // Connect full adders
    fullAdder FA0 (s0_int, s1_int, a[0], b[0], 1'b0);
    fullAdder FA1 (s0_int, s1_int, a[1], b[1], carry0);
    fullAdder FA2 (s0_int, s1_int, a[2], b[2], carry0);
    fullAdder FA3 (s0_int, s1_int, a[3], b[3], carry0);
    fullAdder FA4 (s0_int, s1_int, a[4], b[4], carry0);
    fullAdder FA5 (s0_int, s1_int, 1'b0, 1'b0, carry0); // For the carry out

    assign s = {carry0, s_int};
endmodule

module test_Guia_0801;
    // ------------------------- definir dados
    reg [4:0] x;
    reg [4:0] y;
    wire [5:0] soma;

    Guia_0801 uut (
        .s(soma),
        .a(x),
        .b(y)
    );

    // ------------------------- parte principal
    initial begin

        // Inicializar operandos
        x = 5'b10101;
        y = 5'b01010;

        // Aguardar um pouco para estabilização
        #10;

        // Exibir resultados
        $display("Operandos: x=%b, y=%b", x, y);
        $display("Soma: s=%b", soma);
    end
endmodule // test_Guia_0801
/*
Guia_0101.v
806482 - Vitor Dias de Britto Militão
*/

module Guia_0101a;
// define data
integer x = 26; // decimal
reg [7:0] b = 0; // binary (bits - little endian)
  
// actions
initial
  begin : main
    $display ( "Guia_0101a - Conversão de bases - Base 10 para Base 2" );
    $display ( "x = %d (10)" , x );
    b = x;
    $display ( "b = %8b (2)", b );
  end // main
endmodule // encerra o módulo

module Guia_0101b;
  // define data
integer x = 53; // decimal
reg [7:0] b = 0; // binary (bits - little endian)
  
// actions
initial
  begin : main
    $display ( "Guia_0101b - Conversão de bases" );
    $display ( "x = %d (10)" , x );
    b = x;
    $display ( "b = %8b (2)", b );
  end // main
endmodule // encerra o módulo

module Guia_0101c;
  // define data
integer x = 723; // decimal
  reg [16:0] b = 0; // binary (bits - little endian)
  
// actions
initial
  begin : main
    $display ( "Guia_0101c - Conversão de bases" );
    $display ( "x = %d (10)" , x );
    b = x;
    $display ( "b = %8b (2)", b );
  end // main
endmodule // encerra o módulo

module Guia_0101d;
  // define data
integer x = 312; // decimal
reg [7:0] b = 0; // binary (bits - little endian)
  
// actions
initial
  begin : main
    $display ( "Guia_0101d - Conversão de bases" );
    $display ( "x = %d (10)" , x );
    b = x;
    $display ( "b = %8b (2)", b );
  end // main
endmodule // encerra o módulo

module Guia_0101e;
  // define data
integer x = 365; // decimal
reg [7:0] b = 0; // binary (bits - little endian)
  
// actions
initial
  begin : main
    $display ( "Guia_0101e - Conversão de bases" );
    $display ( "x = %d (10)" , x );
    b = x;
    $display ( "b = %8b (2)", b );
  end // main
endmodule // encerra o módulo
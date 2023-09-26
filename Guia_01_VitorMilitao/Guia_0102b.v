/*
 Guia_0102.v
 806482 - Vitor Dias de Britto Militão - Ciência da Computação
*/

module Guia_0102a;
// define data
  integer d = 0; // decimal
  reg [4:0] b = 5'b10110; // binary (bits - little endian)
  
// actions
  initial
   begin : main
     $display ( "Guia_0102 - Conversão de Binário para Decimal" );
     $display ( "binario = %8b (2)", b );     
     d = b;
     $display ( "decimal = %d (10)", d );
  end // main
endmodule // fim do módulo

module Guia_0102b;
// define data
 integer d = 0; // decimal
  reg [7:0] b = 8'b00011011; // binary (bits - little endian)
  
// actions
  initial
   begin : main
     $display ( "Guia_0102 - Conversão de Binário para Decimal" );
     $display ( "binario = %8b (2)", b );     
     d = b;
     $display ( "decimal = %d (10)", d );
  end // main
endmodule // fim do módulo

module Guia_0102c;
// define data
 integer d = 0; // decimal
  reg [5:0] b = 6'b100100; // binary (bits - little endian)
  
// actions
  initial
   begin : main
     $display ( "Guia_0102 - Conversão de Binário para Decimal" );
     $display ( "binario = %8b (2)", b );     
     d = b;
     $display ( "decimal = %d (10)", d );
  end // main
endmodule // fim do módulo

module Guia_0102d;
// define data
 integer d = 0; // decimal
  reg [5:0] b = 6'b101001; // binary (bits - little endian)
  
// actions
  initial
   begin : main
     $display ( "Guia_0102 - Conversão de Binário para Decimal" );
     $display ( "binario = %8b (2)", b );     
     d = b;
     $display ( "decimal = %d (10)", d );
  end // main
endmodule // fim do módulo

module Guia_0102e;
// define data
 integer d = 0; // decimal
  reg [5:0] b = 6'b110111; // binary (bits - little endian)
  
// actions
  initial
   begin : main
     $display ( "Guia_0102 - Conversão de Binário para Decimal" );
     $display ( "binario = %8b (2)", b );     
     d = b;
     $display ( "decimal = %d (10)", d );
  end // main
endmodule // fim do módulo



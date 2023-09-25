// Guia04 - 2C - Vitor Dias de Britto Militão - 806482

module fxyz (output s1, output s2, input x, y, z);
assign s1 = ( ~y | x ) & ( y | ~x );
assign s2 = (~y | y)& (~x | x);
endmodule // fxyz

module Guia04;
	reg x, y, z;
	wire s1, s2, s3;

	fxyz FXY1 (s1, s2, x, y,z);


	initial begin: start
		x=1'bx; y=1'bx; z=1'bx; // indefinidos
	end

	initial begin: main
		// identificacao
		$display("Exemplo - Guilherme Gomes de Brites - 808721");
        $display("Expressao: ( y + x' )' . ( y + x' )");
        $display(" x  y  z | ( y + x' )' . ( y + x' )");
		
		// sinalizacao
		#1 x=0; y=0;z=0;
		$monitor("%2b %2b %2b = %2b  %2b", x, y, z, s1, s2);
		#1 x=0; y=0;z=1;
		#1 x=0; y=1;z=0;
		#1 x=0; y=1;z=1;
		#1 x=1; y=0;z=0;
		#1 x=1; y=0;z=1;
		#1 x=1; y=1;z=0;
		#1 x=1; y=1;z=1;
	end
endmodule
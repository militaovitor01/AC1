module RAM_1x8 (
  input wire clk,       // Sinal de clock
  input wire reset,     // Sinal de reset
  input wire write_en,  // Sinal de habilitação de escrita
  input wire[0:0] address, // Sinal de endereço (1 bit)
  input wire[7:0] data_in,  // Dados de entrada (8 bits)
  output wire[7:0] data_out // Dados de saída (8 bits)
);

  // Declaração de duas memórias RAM 1x2
  wire [1:0] data_out_ram1, data_out_ram2;
  wire data_out_mux;

  ram_1x2 ram1 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[1:0]),
    .data_out(data_out_ram1)
  );

  ram_1x2 ram2 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[3:2]),
    .data_out(data_out_ram2)
  );

  // Módulo de multiplexação para selecionar os dados corretos
  always @ (address)
  begin
    if (address == 1'b0)
      data_out_mux = data_out_ram1;
    else
      data_out_mux = data_out_ram2;
  end

  // Saída de dados
  assign data_out = {data_out_mux, data_out_mux};

endmodule

module RAM_2x8 (
  input wire clk,       // Sinal de clock
  input wire reset,     // Sinal de reset
  input wire write_en,  // Sinal de habilitação de escrita
  input wire[1:0] address, // Sinal de endereço (2 bits)
  input wire[7:0] data_in,  // Dados de entrada (8 bits)
  output wire[7:0] data_out // Dados de saída (8 bits)
);

  // Declaração de duas memórias RAM 1x4
  wire [3:0] data_out_ram1, data_out_ram2;

  ram_1x4 ram1 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address[0]),
    .data_in(data_in[3:0]),
    .data_out(data_out_ram1)
  );

  ram_1x4 ram2 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address[1]),
    .data_in(data_in[7:4]),
    .data_out(data_out_ram2)
  );

  // Módulo de seleção para escolher entre as duas memórias
  wire[3:0] data_out_mux;
  always @ (address, data_out_ram1, data_out_ram2)
  begin
    if (address[1] == 1'b0)
      data_out_mux = data_out_ram1;
    else
      data_out_mux = data_out_ram2;
  end

  // Saída de dados
  assign data_out = {data_out_mux, data_out_mux};

endmodule

module RAM_4x8 (
  input wire clk,       // Sinal de clock
  input wire reset,     // Sinal de reset
  input wire write_en,  // Sinal de habilitação de escrita
  input wire[1:0] address, // Sinal de endereço (2 bits)
  input wire[7:0] data_in,  // Dados de entrada (8 bits)
  output wire[7:0] data_out // Dados de saída (8 bits)
);

  // Declaração de quatro memórias RAM 2x4
  wire [3:0] data_out_ram1, data_out_ram2, data_out_ram3, data_out_ram4;

  ram_2x4 ram1 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[3:0]),
    .data_out(data_out_ram1)
  );

  ram_2x4 ram2 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[7:4]),
    .data_out(data_out_ram2)
  );

  ram_2x4 ram3 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[11:8]),
    .data_out(data_out_ram3)
  );

  ram_2x4 ram4 (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .address(address),
    .data_in(data_in[15:12]),
    .data_out(data_out_ram4)
  );

  // Módulo de seleção para escolher entre as quatro memórias
  wire[3:0] data_out_mux;
  always @ (address, data_out_ram1, data_out_ram2, data_out_ram3, data_out_ram4)
  begin
    case (address)
      2'b00: data_out_mux = data_out_ram1;
      2'b01: data_out_mux = data_out_ram2;
      2'b10: data_out_mux = data_out_ram3;
      2'b11: data_out_mux = data_out_ram4;
    endcase
  end

  // Saída de dados
  assign data_out = {data_out_mux, data_out_mux};

endmodule

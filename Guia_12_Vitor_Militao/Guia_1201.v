module RAM_1x4 (
  input wire clk,       // Sinal de clock
  input wire reset,     // Sinal de reset
  input wire write_en,  // Sinal de habilitação de escrita
  input wire[1:0] address, // Sinal de endereço (1 bit)
  input wire[3:0] data_in,  // Dados de entrada (4 bits)
  output wire[3:0] data_out // Dados de saída (4 bits)
);

  // Declaração dos flip-flops JK como registradores de dados
  reg [3:0] memory [0:1];

  always @(posedge clk or posedge reset)
  begin
    if (reset) begin
      // Em caso de reset, zere todos os registros
      for (int i = 0; i < 2; i = i + 1) begin
        memory[i] <= 4'b0000;
      end
    end
    else if (write_en) begin
      // Escreva dados na memória baseado no endereço
      memory[address] <= data_in;
    end
  end

  always @(posedge clk)
  begin
    // Leia dados da memória baseado no endereço
    data_out <= memory[address];
  end

endmodule

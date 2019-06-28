module counter(clk, value);

	input wire clk;
	output reg [4:0] value;
	reg counter;

	parameter
	ZERO = 4'b0000, // Início do relogio
	MAX = 4'b1111;  // Fim do relogio

	initial begin
		counter <= 0;
		value <= 4'b0000;
	end

	always@(negedge clk) begin
		if(counter == 0) begin
			if(value == 4'b1111) begin
				counter <=1;
			end else begin
				value <= value + 4'b0001;
			end
		end
	end
endmodule
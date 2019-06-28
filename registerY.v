module registerY(outUla, clk, Ty, outY);
	input wire [3:0] outUla;
	input wire clk;
	input wire [3:0] Ty;
	output reg [3:0] outY;

	parameter
	HOLD = 3'b000,
	LOAD = 3'b001,
	SHIFTR = 3'b010,
	SHIFTL = 3'b011,
	CLEAR = 3'b100;
	
	always @ (negedge clk) begin
		case (Ty)
			LOAD: outY <= outUla;            // Carrega o valor
			SHIFTR: outY <= (outY >> 1);   // Divide o valor por 2
			SHIFTL: outY <= (outY << 1);   // Multiplica por 2
			CLEAR: outY <= 4'b0000;     // Zera o valor
		endcase
	end
endmodule

module registerZ(outY, clk, Tz, outZ);
	input wire [3:0] outY;
	input wire clk;
	input wire [3:0] Tz;
	output reg [3:0] outZ;

	parameter
	HOLD = 3'b000,
	LOAD = 3'b001,
	SHIFTR = 3'b010,
	SHIFTL = 3'b011,
	CLEAR = 3'b100;
	
	always @ (negedge clk) begin
		case (Tz)
			LOAD: outZ <= outY;            // Carrega o valor
			SHIFTR: outZ <= outZ >> 1;   // Divide o valor por 2
			SHIFTL: outZ <= outZ << 1;   // Multiplica por 2
			CLEAR: outZ <= 4'b0000;     // Zera o valor
		endcase
	end
endmodule

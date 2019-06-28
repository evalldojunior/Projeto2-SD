module cpu(clk, outUla, Tx, Ty, Tz, Tula, op, data, outX, outY, outZ);

	input wire clk;

	output wire [3:0] outUla;
	output wire [3:0] Tx, Ty, Tz;
	output wire [3:0] Tula, outX, outY, outZ, op, data;

	counter counter(clk,value);

	memory memory(value, op, data);

	scheduler control(op, clk, Tx, Ty, Tz, Tula);

	registerX X(data, clk, Tx, outX);
	
	registerY Y(outUla, clk, Ty, outY);

	registerZ Z(outY, clk, Tz, outZ);

	alu alu(outX, outY, outUla);

endmodule

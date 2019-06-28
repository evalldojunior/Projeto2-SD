module alu(outX, outY, outUla);

	input wire [4:0] outX, outY;
	output reg [4:0] outUla;
	
	always begin
       outUla <= (outX + outY);
    end

endmodule

module memory(sel, op, data);

	input [4:0] sel;
	output reg[4:0] op;
	output reg[4:0] data;

	parameter
	A = 4,
	B = 2,

	CLEARLD = 4'b0000,
	ADDLD = 4'b0001,
	ADD = 4'b0010,
	SHTR = 4'b0011,
	DISP = 4'b0100;

	always begin
		#2
		case(sel)
			4'b0000:
			begin
				op <= 0;
				data <= A;
			end
			4'b0001:
			begin
				op <= 1;
				data <= B;
			end
			4'b0010:
			begin
				op <= 2;
				data <= 0;
			end
			4'b0011:
			begin
				op <= 3;
				data <= 0;
			end
			4'b0100:
			begin
				op <= 4;
				data <= 0;
			end
		endcase
	end
endmodule

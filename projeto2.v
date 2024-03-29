
module alu(A, B, sel, out);

	input wire [4:0] A, B, sel;
	output reg [4:0] out;
	
	always begin
        out <= A + B;
    end

endmodule

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

module register(data, clk, sel, out);
	input wire [4:0] data;
	input wire clk;
	input wire [4:0] sel;
	output reg [4:0] out;

	parameter
	HOLD = 4'b0000,
	LOAD = 4'b0001,
	SHIFTR = 4'b0010,
	SHIFTL = 4'b0011,
	CLEAR = 4'b0100;
	
	always @ (negedge clk) begin
		case (sel)
			LOAD: out <= data;            // Carrega o valor
			SHIFTR: out <= out >> 1;   // Divide o valor por 2
			SHIFTL: out <= out << 1;   // Multiplica por 2
			CLEAR: out <= 4'b0000;     // Zera o valor
		endcase
	end
endmodule

module scheduler(op, clk, Tx, Ty, Tz, Tula);

	input wire [4:0] op;
	input wire clk;
	output reg [4:0]Tx;
	output reg [4:0]Ty;
	output reg [4:0]Tz;
	output reg [4:0]Tula;

	parameter
    
	mCLEARLD = 4'b0000,
	mADDLD = 4'b0001,
	mADD = 4'b0010,
	mSHTR = 4'b0011,
	mDISP = 4'b0100,
	//registrador
	rHOLD = 4'b0000,
	rLOAD = 4'b0001,
	rSHIFTR = 4'b0010,
	rSHIFTL = 4'b0011,
	rCLEAR = 4'b0100,
	//Tula
   	uADD = 4'b0000;



	always begin 
		case(op)
		
		4'b0000:
		begin
			Tx <= 4'b0001;
			Ty <= 4'b0100;
			Tz <= 4'b0100;
			Tula <= 4'b0000;
		end
		4'b0001:
		begin
			Tx <= 4'b0001;
			Ty <= 4'b0001;
			Tz <= 4'b0000;
			Tula <= 4'b0000;
		end
		4'b0010:
		begin
			Tx <= 4'b0000;
			Ty <= 4'b0001;
			Tz <= 4'b0000;
			Tula <= 4'b0000;
		end
		4'b0011:
		begin
			Tx <= 4'b0000;
			Ty <= 4'b0010;
			Tz <= 4'b0000;
			Tula <= 4'b0000;
		end
		4'b0100:
		begin
			Tx <=4'b0000;
			Ty <=4'b0000;
			Tz <=4'b0001;
			Tula <= 4'b0000;
		end		
	endcase
	end
endmodule


module counter(clk, value);

	input wire clk;
	output reg [4:0] value;
	reg counter;

	parameter
	ZERO = 4'b0000, // In�cio do relogio
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


module cpu(clk, out, Tx, Ty, Tz, Tula,  dataXtoAlu, dataYout, dataAlutoY, op, data);

	input wire clk;

	output wire [3:0] out;

	output wire [3:0] Tx, Ty, Tz, Tula,  dataXtoAlu, dataYout, dataAlutoY, op, data;

	counter counter(clk,value);

	memory memory(value, op, data);

	scheduler control(op, clk, Tx, Ty, Tz, Tula);

	register X(data, Tx, clk, dataXtoAlu);

	register Y(dataAlutoY, Ty, clk, dataYout);

	register Z(dataYout, Tz, clk, out);

	alu alu(dataXtoAlu, dataYout, Tula, dataAlutoY);

endmodule

		

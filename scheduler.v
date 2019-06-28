module scheduler(op, clk, Tx, Ty, Tz, Tula);

	input wire [3:0] op;
	input wire clk;
	output reg [3:0]Tx;
	output reg [3:0]Ty;
	output reg [3:0]Tz;
	output reg [3:0]Tula;

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

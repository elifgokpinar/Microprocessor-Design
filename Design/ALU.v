
module ALU(Opcode,A,B,Output,Zero,Negative,Carry,Overflow);    

input [2:0]  Opcode; // ALU OPCODE
input [7:0]  A,B;    // INPUTS 8 bit

output [7:0] Output; // 8 bit Output
output reg Zero;		// Zero=1 when the result is 0
output reg Carry=1'b0;		
output reg Negative; //Negative=1 when the result is negative
output reg Overflow=1'b0; 

reg [7:0] Result;
assign Output = Result; //When result register is updated, output is updated
reg [7:0] isCarry;		
   

always @ (*)

begin

 case (Opcode)

		  3'b000: begin // ***************ADD=0*************
				Result = A + B;
				isCarry=8'b0;
				isCarry = A[6:0] + B[6:0];
				Carry  = (isCarry[7]&&(A[7]||B[7]))||(A[7]==1 && B[7]==1);
				Overflow= ((A[7]==1 && B[7]==1 && Result[7]==0) || (A[7]==0 && B[7]==0 && Result[7]==1))? 1:0;
		  end
		  
		  3'b001: begin // **************SUB=1***************
				Result = B - A;
				Carry  = (A > B)? 1:0;
				Overflow= ((A[7]==0 && B[7]==1 && Result[7]==0) || (A[7]==1 && B[7]==0 && Result[7]==1))? 1:0;
		  end
		  
		  3'b010:  begin // *************MOVA=2***************
           Result = A;
			  Carry = 1'b0;
			  Overflow = 1'b0;
			    
		  end
        3'b011:  begin // *************SHFLA=3**************
           Result = A<<1;
			  Carry = 1'b0;
			  Overflow = 1'b0;
		  end
        3'b100: begin // **************SHFRA=4***************
           Result = A>>1;
			  Carry = 1'b0;
			  Overflow = 1'b0;
		  end
        3'b101: begin // **************AND=5****************
           Result = A & B;
			  Carry = 1'b0;
			  Overflow = 1'b0;
		  end
        3'b110: begin // **************OR=6****************
           Result = A | B;
			  Carry = 1'b0;
			  Overflow = 1'b0;
		  end
		  3'b111: begin // **************XOR=7****************
           Result = A ^ B; 
			  Carry = 1'b0;
			  Overflow = 1'b0;
		  end


			default: begin

				/*Result = 8'b0;
				Carry  = 1'b0;
				Zero  = 1'b0;*/

			end
 endcase
   
	//Flags
	Zero  = (Result == 8'b0);
	Negative = Result[7];

end

endmodule
module ACC(ResultALU,state,clk,out);
input [7:0] ResultALU; // result of the alu
input clk; 
input [2:0] state;
output reg [7:0] out=8'b0;


always @ (posedge clk)
begin
 if(state==3'b100) //100 EXEC ALU
	begin
	out<=ResultALU;
	end
 else
	begin
	out<=out ;
	end 
end

endmodule

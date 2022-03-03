module PC (clk,count,state);

input	clk;
input [2:0] state;
output reg [0:7] count=8'b00000000;

always @(posedge clk)
begin	
	if(count==8'b11111111) // If the count is 255, reset the PC
	begin
		count<=8'b00000000;
	end
	case(state)
			3'b000 : count <= count + 1; //IF THE STATE IS FETCH STATE
			default : count <= count; //Other states
	endcase
	
end	

endmodule 
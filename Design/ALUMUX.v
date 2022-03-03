module ALUMUX(rd_data,literalOrAddress,instructionType,BInput);
input [7:0] rd_data,literalOrAddress; 
input [1:0] instructionType;
output reg [7:0] BInput=8'b0;


//00 Literal , 01 Register. We can look at the 0.index 
always @(*) 
begin
case(instructionType[0])
	1'b0 : BInput<=literalOrAddress; // literal type instruction
	1'b1 : BInput<=rd_data;          // regitser type instruction
endcase
end


endmodule 
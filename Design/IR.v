module IR(romData,state,clk,instructionCode,instructionType,literalOrAddress);

input [0:12] romData; // instructionType(2)+instruction Code(3) + literal(8)
input clk;
input [2:0] state;
output reg [2:0] instructionCode=3'b000;
output reg [1:0] instructionType=2'b00;
output reg [7:0] literalOrAddress=8'b00000000;


always @ (posedge clk)
begin
 if (state==3'b001) // If the state is DECODE
 begin
 instructionType <= romData[0:1];
 instructionCode <= romData[2:4];
 literalOrAddress <= romData[5:12];
 end

 
end

endmodule
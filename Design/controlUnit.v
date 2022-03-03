module controlUnit(instructionType,instructionCode,clk,state,ma,rd,wd,rw,enram,enrom);
input [1:0] instructionType;
input [2:0] instructionCode;
input clk;
output reg [2:0] state=3'b000;
output reg ma=0;
output reg rd=0;
output reg wd=0;
output reg rw=0;
output reg enram=0;
output reg enrom=1;
//STATES FETCH=000, DECODE=001, READMEM=010, WRITEMEM=011, 
//EXECALU=100, , STOREEXEC=101
//5 states
always @(posedge clk)
begin

 case (state)
		  //FETCH
		  3'b000: begin
					 state=3'b001; // go decode state
					 ma=0;
					 rd=0;
					 wd=0;
					 enram=0;
					 rw=0;
					 enrom=0;
					 end
		  //DECODE STATE
		  3'b001: begin
					//LITERAL TYPE
					   if(instructionType==2'b00) //go execution state
						begin
						state=3'b100; // Execute ALU
						end
					// MemWrite State
						else if(instructionType==2'b01 && instructionCode==3'b111) //lregister type + store ater add the fsr type condition!
						begin
						state=3'b011; // GO WriteMem State
						end
					//ReadMem State, all instructions except STORE
						else if(instructionType==2'b01 )  //later add the fsr type
						begin
						state=3'b010; // GO ReadMem State
						end
					 end
		 //READ MEM STATE
		 3'b010: begin
					ma=1;
					rd=1; // Read Data Register
					wd=0;
					enram=1;
					rw=1; //READ
					enrom=0;
					state=3'b100; // EXEC ALU
				   end
		 //WRITE MEM STATE
		 3'b011: begin
					ma=1;
					rd=0;
					wd=1;
					enram=1;
					rw=0;
					enrom=0;
					state=3'b101;  //EXEC WRITEMEM
					end
		 //EXEC ALU
		 3'b100: begin
					state=3'b000; //GO FETCH
					ma=0;
					rd=0;
					wd=0;
					enram=0;
					rw=0;
					enrom=1;
					end
		
		 //EXEC STOREXEC
		 3'b101: begin
					state=3'b000; //GO FETCH
					ma=0;
					rd=0;
					wd=0;
					enram=0;
					rw=0;
					enrom=1;
					end
		 
 endcase
end                      
 
 endmodule 

module dflipflop(datain,resultOfWrite,dffout);
input datain;
input resultOfWrite;
output reg dffout;


always @ (*)
begin
 case (resultOfWrite)
		  1'b0: dffout=dffout;   
		  1'b1: dffout=datain;	
 endcase
end

endmodule
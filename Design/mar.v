module MAR(address, clk,ma, ma_address);  //MEMORY ADDRESS REGISTER
input [7:0] address; // gelen address
input clk,ma;
output reg [7:0]  ma_address; // it is coming from instruction register

   
always @ (posedge clk) 
	begin
      if (ma)
         ma_address=address;
      else
         ma_address=ma_address;
   end

endmodule
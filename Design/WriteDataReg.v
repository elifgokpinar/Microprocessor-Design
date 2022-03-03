module WriteDataReg(data_in, clk,wd, wd_data);  //WRITE DATA REGISTER
input [7:0] data_in; // Data from RAM
input clk,wd;
output reg [7:0]  wd_data; // Output of the read data register

   
always @ (posedge clk) 
	begin
      if (wd)
         wd_data=data_in;
      else
         wd_data=wd_data;
   end

endmodule
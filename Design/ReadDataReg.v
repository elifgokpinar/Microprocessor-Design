module ReadDataReg(dataout, clk,rd, rd_data);  //READ DATA REGISTER
input [7:0] dataout; // Data from RAM
input clk,rd;
output reg [7:0]  rd_data; // Output of the read data register

   
always @ (*) 
	begin
      if (rd)
         rd_data=dataout;
      else
         rd_data=rd_data;
   end

endmodule
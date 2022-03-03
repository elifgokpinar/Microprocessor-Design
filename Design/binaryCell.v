module binaryCell(datain,select,rw,dataout);//********BINARYCELL***************

input datain;
input select;
input rw; 
output dataout;
wire resultOfWrite; // deciding writing the dff
wire dffout;


and a1(resultOfWrite,select,!rw); //FOR WRITE
dflipflop dff1(datain,resultOfWrite,dffout); // GO TO DFF
assign dataout=select&rw&dffout;


endmodule
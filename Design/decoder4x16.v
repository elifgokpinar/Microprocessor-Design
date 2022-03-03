module decoder4x16(adress,enram,result); //4x16 Decoder

input enram;
input [0:3] adress;
output [0:15] result; //returns the 16 results of decoder

assign result[0]= ~adress[0] & ~adress[1] & ~adress[2] & ~adress[3] & enram; //0000
assign result[1]= ~adress[0] & ~adress[1] & ~adress[2] & adress[3] & enram;  //0001
assign result[2]= ~adress[0] & ~adress[1] & adress[2] & ~adress[3] & enram;  //0010
assign result[3]= ~adress[0] & ~adress[1] & adress[2] & adress[3] & enram; //0011
assign result[4]= ~adress[0] & adress[1] & ~adress[2] & ~adress[3] & enram;  //0100
assign result[5]= ~adress[0] & adress[1] & ~adress[2] & adress[3] & enram; //0101
assign result[6]= ~adress[0] & adress[1] & adress[2] & ~adress[3] & enram; //0110
assign result[7]= ~adress[0] & adress[1] & adress[2] & adress[3] & enram; //0111
assign result[8]= adress[0] & ~adress[1] & ~adress[2] & ~adress[3] & enram; //1000
assign result[9]= adress[0] & ~adress[1] & ~adress[2] & adress[3] & enram; //1001
assign result[10]= adress[0] & ~adress[1] & adress[2] & ~adress[3] & enram; //1010
assign result[11]= adress[0] & ~adress[1] & adress[2] & adress[3] & enram; //1011
assign result[12]= adress[0] & adress[1] & ~adress[2] & ~adress[3] & enram; //1100
assign result[13]= adress[0] & adress[1] & ~adress[2] & adress[3] & enram; //1101
assign result[14]= adress[0] & adress[1] & adress[2] & ~adress[3] & enram; //1110
assign result[15]= adress[0] & adress[1] & adress[2] & adress[3] & enram; //1111


endmodule
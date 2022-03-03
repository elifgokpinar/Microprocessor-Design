module decoder(adress,enram,selectList); // 8x256 DECODER

input enram;
input [0:7] adress;
wire [0:15] result;
wire [0:15] result2 [0:15];
output wire [0:255] selectList;
decoder4x16 d1(adress[0:3],enram,result); 

 
 /* genvar gi;

  generate
  for (gi=0; gi<16; gi=gi+1) 
  begin : gen_loop
	decoder4x16 d2(adress[4:7],result[gi],result2[gi]);
   assign selectList[gi*16:(gi*16)+15]=result2[gi];
	
  end
  endgenerate*/
  
  

	decoder4x16 d2(adress[4:7],result[0],result2[0]);
   assign selectList[0:15]=result2[0];
	decoder4x16 d3(adress[4:7],result[1],result2[1]);
   assign selectList[16:31]=result2[1];
	decoder4x16 d4(adress[4:7],result[2],result2[2]);
   assign selectList[32:47]=result2[2];
	decoder4x16 d5(adress[4:7],result[3],result2[3]);
   assign selectList[48:63]=result2[3];
	decoder4x16 d6(adress[4:7],result[4],result2[4]);
   assign selectList[64:79]=result2[4];
	decoder4x16 d7(adress[4:7],result[5],result2[5]);
   assign selectList[80:95]=result2[5];
	decoder4x16 d8(adress[4:7],result[6],result2[6]);
   assign selectList[96:111]=result2[6];
	decoder4x16 d9(adress[4:7],result[7],result2[7]);
   assign selectList[112:127]=result2[7];
	decoder4x16 d10(adress[4:7],result[8],result2[8]);
   assign selectList[128:143]=result2[8];
	decoder4x16 d11(adress[4:7],result[9],result2[9]);
   assign selectList[144:159]=result2[9];
	decoder4x16 d12(adress[4:7],result[10],result2[10]);
   assign selectList[160:175]=result2[10];
	decoder4x16 d13(adress[4:7],result[11],result2[11]);
   assign selectList[176:191]=result2[11];
	decoder4x16 d14(adress[4:7],result[12],result2[12]);
   assign selectList[192:207]=result2[12];
	decoder4x16 d15(adress[4:7],result[13],result2[13]);
   assign selectList[208:223]=result2[13];
	decoder4x16 d16(adress[4:7],result[14],result2[14]);
   assign selectList[224:239]=result2[14];
	decoder4x16 d17(adress[4:7],result[15],result2[15]);
   assign selectList[240:255]=result2[15];
	



endmodule
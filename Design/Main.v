module Main(clk);

input clk;
wire ma,rd,wd,enram,rw,enrom; //SIGNALS
wire [2:0] state; // fetch decode readmem,writemem,execalu, storeexec
wire Z,N,C,O; // FLAGS
wire [7:0] count; // PC count
wire [0:12] romData; // Data from Rom 
wire [1:0] instructionType;
wire [2:0] instructionCode;
wire [7:0] literalOrAddress;
wire [7:0] ResultALU; //Result of the ALU
wire [7:0] ACCout; // Output of the ACC, It connects the A ALU input
wire [7:0] ma_address; // Output of the MAR register
wire [7:0] wd_data;  //It goes to the RAM as datain
wire [7:0] rd_data;  //It goes to the ALU input (dataout)
wire [7:0] dataoutRAM; //Output of the RAM
wire [7:0] BInput; //Output of the RAM


//******************CONTROL UNIT*****************************************
controlUnit c(instructionType,instructionCode,clk,state,ma,rd,wd,rw,enram,enrom); //instructionType,instructionCode,clk,F,D,E

//*******************PC*************************************************
PC pc(clk,count,state);
//*******************ROM*************************************************
ROM rom(count,enrom,romData);

//******************INSTRUCTION REGISTER*********************************
IR ir(romData,state,clk,instructionCode,instructionType,literalOrAddress);

//********************ALU************************************************
ALU alu(instructionCode,ACCout,BInput,ResultALU,Z,N,C,O);
//********************ACC************************************************
ACC acc(ResultALU,state,clk,ACCout); //It takes result of ALU, E signal
//*********************MAR********************************************
//and a1(ma_s0,ma,instructionCode[0]); //00 literal, 10 fsr ADD LATER
MAR mar(literalOrAddress,clk,ma,ma_address);
//*********************WRITE DATA REGISTER********************************
WriteDataReg wdr(ACCout,clk,wd,wd_data); // Data comes from ACC register, It goes to the RAM
//*************************RAM********************************************
RAM ram(ma_address,wd_data,rw,enram,dataoutRAM);
//*********************READ DATA REGISTER********************************
ReadDataReg rdr(dataoutRAM,clk,rd,rd_data); // Data goes to the ALU input
//*************************ALUMUX*****************************************
ALUMUX alumux(rd_data,literalOrAddress,instructionType,BInput);

endmodule 
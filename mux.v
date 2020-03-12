`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:17 03/12/2020 
// Design Name: 
// Module Name:    mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux2to1_1bits(input in0, input in1, input select, output muxOut);
      wire nselect;
		wire muxt1;
		wire muxt2;
		not n1(nselect,select);
		and b1(muxt1,nselect,in0);
		and b2(muxt2,select,in1);
		
		or o1(muxOut,muxt2,muxt1);
endmodule

module multiplexer4to1_1bit(output X ,input A0, input A1,input A2, input A3,
									  input S1, S0);
	wire t1;
	wire t2;
	mux2to1_1bits m1(A0,A1,S0,t1);
	mux2to1_1bits m2(A2,A3,S0,t2);
	mux2to1_1bits mf(t1,t2,S1,X);

endmodule

module mux2to1_32bits(input [31:0] in0, input [31:0] in1, input select, output [31:0] muxOut);
      wire nselect;
		wire [31:0]muxt1;
		wire [31:0]muxt2;
		not n1(nselect,select);
		and b1(muxt1[0],nselect,in0[0]);
		and b2(muxt1[1],nselect,in0[1]);
		and b3(muxt1[2],nselect,in0[2]);
		and b4(muxt1[3],nselect,in0[3]);
		and b5(muxt1[4],nselect,in0[4]);
		and b6(muxt1[5],nselect,in0[5]);
		and b7(muxt1[6],nselect,in0[6]);
		and b8(muxt1[7],nselect,in0[7]);
		and b9(muxt1[8],nselect,in0[8]);
		and b10(muxt1[9],nselect,in0[9]);
		and b11(muxt1[10],nselect,in0[10]);
		and b12(muxt1[11],nselect,in0[11]);
		and b13(muxt1[12],nselect,in0[12]);
		and b14(muxt1[13],nselect,in0[13]);
		and b15(muxt1[14],nselect,in0[14]);
		and b16(muxt1[15],nselect,in0[15]);
		and b17(muxt1[16],nselect,in0[16]);
		and b18(muxt1[17],nselect,in0[17]);
		and b19(muxt1[18],nselect,in0[18]);
		and b20(muxt1[19],nselect,in0[19]);
		and b21(muxt1[20],nselect,in0[20]);
		and b22(muxt1[21],nselect,in0[21]);
		and b23(muxt1[22],nselect,in0[22]);
		and b24(muxt1[23],nselect,in0[23]);
		and b25(muxt1[24],nselect,in0[24]);
		and b26(muxt1[25],nselect,in0[25]);
		and b27(muxt1[26],nselect,in0[26]);
		and b28(muxt1[27],nselect,in0[27]);
		and b29(muxt1[28],nselect,in0[28]);
		and b30(muxt1[29],nselect,in0[29]);
		and b31(muxt1[30],nselect,in0[30]);
		and b32(muxt1[31],nselect,in0[31]);
		
		
		
		and a1(muxt2[0],select,in1[0]);
		and a2(muxt2[1],select,in1[1]);
		and a3(muxt2[2],select,in1[2]);
		and a4(muxt2[3],select,in1[3]);
		and a5(muxt2[4],select,in1[4]);
		and a6(muxt2[5],select,in1[5]);
		and a7(muxt2[6],select,in1[6]);
		and a8(muxt2[7],select,in1[7]);
		and a9(muxt2[8],select,in1[8]);
		and a10(muxt2[9],select,in1[9]);
		and a11(muxt2[10],select,in1[10]);
		and a12(muxt2[11],select,in1[11]);
		and a13(muxt2[12],select,in1[12]);
		and a14(muxt2[13],select,in1[13]);
		and a15(muxt2[14],select,in1[14]);
		and a16(muxt2[15],select,in1[15]);
		and a17(muxt2[16],select,in1[16]);
		and a18(muxt2[17],select,in1[17]);
		and a19(muxt2[18],select,in1[18]);
		and a20(muxt2[19],select,in1[19]);
		and a21(muxt2[20],select,in1[20]);
		and a22(muxt2[21],select,in1[21]);
		and a23(muxt2[22],select,in1[22]);
		and a24(muxt2[23],select,in1[23]);
		and a25(muxt2[24],select,in1[24]);
		and a26(muxt2[25],select,in1[25]);
		and a27(muxt2[26],select,in1[26]);
		and a28(muxt2[27],select,in1[27]);
		and a29(muxt2[28],select,in1[28]);
		and a30(muxt2[29],select,in1[29]);
		and a31(muxt2[30],select,in1[30]);
		and a32(muxt2[31],select,in1[31]);
		
		or o1(muxOut[0],muxt2[0],muxt1[0]);
		or o2(muxOut[1],muxt2[1],muxt1[1]);
		or o3(muxOut[2],muxt2[2],muxt1[2]);
		or o4(muxOut[3],muxt2[3],muxt1[3]);
		or o5(muxOut[4],muxt2[4],muxt1[4]);
		or o6(muxOut[5],muxt2[5],muxt1[5]);
		or o7(muxOut[6],muxt2[6],muxt1[6]);
		or o8(muxOut[7],muxt2[7],muxt1[7]);
		or o9(muxOut[8],muxt2[8],muxt1[8]);
		or o10(muxOut[9],muxt2[9],muxt1[9]);
		or o11(muxOut[10],muxt2[10],muxt1[10]);
		or o12(muxOut[11],muxt2[11],muxt1[11]);
		or o13(muxOut[12],muxt2[12],muxt1[12]);
		or o14(muxOut[13],muxt2[13],muxt1[13]);
		or o15(muxOut[14],muxt2[14],muxt1[14]);
		or o16(muxOut[15],muxt2[15],muxt1[15]);
		or o17(muxOut[16],muxt2[16],muxt1[16]);
		or o18(muxOut[17],muxt2[17],muxt1[17]);
		or o19(muxOut[18],muxt2[18],muxt1[18]);
		or o20(muxOut[19],muxt2[19],muxt1[19]);
		or o21(muxOut[20],muxt2[20],muxt1[20]);
		or o22(muxOut[21],muxt2[21],muxt1[21]);
		or o23(muxOut[22],muxt2[22],muxt1[22]);
		or o24(muxOut[23],muxt2[23],muxt1[23]);
		or o25(muxOut[24],muxt2[24],muxt1[24]);
		or o26(muxOut[25],muxt2[25],muxt1[25]);
		or o27(muxOut[26],muxt2[26],muxt1[26]);
		or o28(muxOut[27],muxt2[27],muxt1[27]);
		or o29(muxOut[28],muxt2[28],muxt1[28]);
		or o30(muxOut[29],muxt2[29],muxt1[29]);
		or o31(muxOut[30],muxt2[30],muxt1[30]);
		or o32(muxOut[31],muxt2[31],muxt1[31]);
	
endmodule

module multiplexer4to1_32bit(output [31:0] X ,input [31:0] A0, input [31:0] A1,input [31:0] A2, input [31:0] A3,
									  input S1, S0);
	wire [31:0] t1;
	wire [31:0] t2;
	mux2to1_32bits m1(A0,A1,S0,t1);
	mux2to1_32bits m2(A2,A3,S0,t2);
	mux2to1_32bits mf(t1,t2,S1,X);

endmodule

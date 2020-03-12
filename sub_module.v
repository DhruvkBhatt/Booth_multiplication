`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:48 03/12/2020 
// Design Name: 
// Module Name:    sub_module 
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


//shifter 00 for no opration
//01 for right shift
//10 for left shift
//11 for set to 0
module shifter_32(Y, A, S, L, R);
   output [31:0] Y;  // The shifted result.
   input [31:0]  A;  // The value to be shifted.
   input [1:0] 	 S;  // The direction of the shift.
   input 	 L;  // The leftmost bit to shift in.
   input 	 R;  // The rightmost bit to shift in.

   multiplexer4to1_1bit mux0(Y[0], A[0], A[1], L, 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux1(Y[1], A[1], A[2], A[0], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux2(Y[2], A[2], A[3], A[1], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux3(Y[3], A[3], A[4], A[2], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux4(Y[4], A[4], A[5], A[3], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux5(Y[5], A[5], A[6], A[4], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux6(Y[6], A[6], A[7], A[5], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux7(Y[7], A[7], A[8], A[6], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux8(Y[8], A[8], A[9], A[7], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux9(Y[9], A[9], A[10], A[8], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux10(Y[10], A[10], A[11], A[9], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux11(Y[11], A[11], A[12], A[10], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux12(Y[12], A[12], A[13], A[11], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux13(Y[13], A[13], A[14], A[12], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux14(Y[14], A[14], A[15], A[13], 1'b0, S[1], S[0]);
	
	multiplexer4to1_1bit mux15(Y[15], A[15], A[16], A[14], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux16(Y[16], A[16], A[17], A[15], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux17(Y[17], A[17], A[18], A[16], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux18(Y[18], A[18], A[19], A[17], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux19(Y[19], A[19], A[20], A[18], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux20(Y[20], A[20], A[21], A[19], 1'b0, S[1], S[0]);
	multiplexer4to1_1bit mux21(Y[21], A[21], A[22], A[20], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux22(Y[22], A[22], A[23], A[21], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux23(Y[23], A[23], A[24], A[22], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux24(Y[24], A[24], A[25], A[23], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux25(Y[25], A[25], A[26], A[24], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux26(Y[26], A[26], A[27], A[25], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux27(Y[27], A[27], A[28], A[26], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux28(Y[28], A[28], A[29], A[27], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux29(Y[29], A[29], A[30], A[28], 1'b0, S[1], S[0]);
   multiplexer4to1_1bit mux30(Y[30], A[30], A[31], A[29], 1'b0, S[1], S[0]);
  
   multiplexer4to1_1bit mux31(Y[31], A[31], R, A[30], 1'b0, S[1], S[0]);
endmodule // shifter_32



//1-bit full adder
module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;
   xor _i0 (i0, i1, cin, sum);
   and _i1 (i0, i1, t0);
   and _i2 (i1, cin, t1);
   and _i3 (cin, i0, t2);
   or _i4 (t0, t1, t2, cout);
endmodule


module Adder(a,b,sum);
	input [31:0] a,b;
	output [31:0]sum;
	wire cout;
	wire [31:0] q;
	fa fa1(a[0],b[0],1'b0,sum[0],q[0]);
	fa fa2(a[1],b[1],q[0],sum[1],q[1]);
	fa fa3(a[2],b[2],q[1],sum[2],q[2]);
	fa fa4(a[3],b[3],q[2],sum[3],q[3]);
	fa fa5(a[4],b[4],q[3],sum[4],q[4]);
	fa fa6(a[5],b[5],q[4],sum[5],q[5]);
	fa fa7(a[6],b[6],q[5],sum[6],q[6]);
	fa fa8(a[7],b[7],q[6],sum[7],q[7]);
	fa fa9(a[8],b[8],q[7],sum[8],q[8]);
	fa fa10(a[9],b[9],q[8],sum[9],q[9]);
	fa fa11(a[10],b[10],q[9],sum[10],q[10]);
	fa fa12(a[11],b[11],q[10],sum[11],q[11]);
	fa fa13(a[12],b[12],q[11],sum[12],q[12]);
	fa fa14(a[13],b[13],q[12],sum[13],q[13]);
	fa fa15(a[14],b[14],q[13],sum[14],q[14]);
	fa fa16(a[15],b[15],q[14],sum[15],q[15]);
	fa fa17(a[16],b[16],q[15],sum[16],q[16]);
	fa fa18(a[17],b[17],q[16],sum[17],q[17]);
	fa fa19(a[18],b[18],q[17],sum[18],q[18]);
	fa fa20(a[19],b[19],q[18],sum[19],q[19]);
	fa fa21(a[20],b[20],q[19],sum[20],q[20]);
	fa fa22(a[21],b[21],q[20],sum[21],q[21]);
	fa fa23(a[22],b[22],q[21],sum[22],q[22]);
	fa fa24(a[23],b[23],q[22],sum[23],q[23]);
	fa fa25(a[24],b[24],q[23],sum[24],q[24]);
	fa fa26(a[25],b[25],q[24],sum[25],q[25]);
	fa fa27(a[26],b[26],q[25],sum[26],q[26]);
	fa fa28(a[27],b[27],q[26],sum[27],q[27]);
	fa fa29(a[28],b[28],q[27],sum[28],q[28]);
	fa fa30(a[29],b[29],q[28],sum[29],q[29]);
	fa fa31(a[30],b[30],q[29],sum[30],q[30]);
	fa fa32(a[31],b[31],q[30],sum[31],cout);
endmodule

module invert(output ib,input b);
	assign ib = ~b;
endmodule

//subtractor 
//for that first 1's compliment
//then add to the initial value
module subtractor(a,b,sum);
	input [31:0] a,b;
	output [31:0]sum;
	wire [31:0] ib;
	wire cout;
	wire [31:0] q;
	invert b1(ib[0],b[0]);
	invert b2(ib[1],b[1]);
	invert b3(ib[2],b[2]);
	invert b4(ib[3],b[3]);
	invert b5(ib[4],b[4]);
	invert b6(ib[5],b[5]);
	invert b7(ib[6],b[6]);
	invert b8(ib[7],b[7]);
	invert b9(ib[8],b[8]);
	invert b10(ib[9],b[9]);
	invert b11(ib[10],b[10]);
	invert b12(ib[11],b[11]);
	invert b13(ib[12],b[12]);
	invert b14(ib[13],b[13]);
	invert b15(ib[14],b[14]);
	invert b16(ib[15],b[15]);
	invert b17(ib[16],b[16]);
	invert b18(ib[17],b[17]);
	invert b19(ib[18],b[18]);
	invert b20(ib[19],b[19]);
	invert b21(ib[20],b[20]);
	invert b22(ib[21],b[21]);
	invert b23(ib[22],b[22]);
	invert b24(ib[23],b[23]);
	invert b25(ib[24],b[24]);
	invert b26(ib[25],b[25]);
	invert b27(ib[26],b[26]);
	invert b28(ib[27],b[27]);
	invert b29(ib[28],b[28]);
	invert b30(ib[29],b[29]);
	invert b31(ib[30],b[30]);
	invert b32(ib[31],b[31]);

	fa fa1(a[0],ib[0],1'b1,sum[0],q[0]);
	fa fa2(a[1],ib[1],q[0],sum[1],q[1]);
	fa fa3(a[2],ib[2],q[1],sum[2],q[2]);
	fa fa4(a[3],ib[3],q[2],sum[3],q[3]);
	fa fa5(a[4],ib[4],q[3],sum[4],q[4]);
	fa fa6(a[5],ib[5],q[4],sum[5],q[5]);
	fa fa7(a[6],ib[6],q[5],sum[6],q[6]);
	fa fa8(a[7],ib[7],q[6],sum[7],q[7]);
	fa fa9(a[8],ib[8],q[7],sum[8],q[8]);
	fa fa10(a[9],ib[9],q[8],sum[9],q[9]);
	fa fa11(a[10],ib[10],q[9],sum[10],q[10]);
	fa fa12(a[11],ib[11],q[10],sum[11],q[11]);
	fa fa13(a[12],ib[12],q[11],sum[12],q[12]);
	fa fa14(a[13],ib[13],q[12],sum[13],q[13]);
	fa fa15(a[14],ib[14],q[13],sum[14],q[14]);
	fa fa16(a[15],ib[15],q[14],sum[15],q[15]);
	fa fa17(a[16],ib[16],q[15],sum[16],q[16]);
	fa fa18(a[17],ib[17],q[16],sum[17],q[17]);
	fa fa19(a[18],ib[18],q[17],sum[18],q[18]);
	fa fa20(a[19],ib[19],q[18],sum[19],q[19]);
	fa fa21(a[20],ib[20],q[19],sum[20],q[20]);
	fa fa22(a[21],ib[21],q[20],sum[21],q[21]);
	fa fa23(a[22],ib[22],q[21],sum[22],q[22]);
	fa fa24(a[23],ib[23],q[22],sum[23],q[23]);
	fa fa25(a[24],ib[24],q[23],sum[24],q[24]);
	fa fa26(a[25],ib[25],q[24],sum[25],q[25]);
	fa fa27(a[26],ib[26],q[25],sum[26],q[26]);
	fa fa28(a[27],ib[27],q[26],sum[27],q[27]);
	fa fa29(a[28],ib[28],q[27],sum[28],q[28]);
	fa fa30(a[29],ib[29],q[28],sum[29],q[29]);
	fa fa31(a[30],ib[30],q[29],sum[30],q[30]);
	fa fa32(a[31],ib[31],q[30],sum[31],cout);

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:27 03/12/2020 
// Design Name: 
// Module Name:    booth 
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


//booth multiplication
module boothmul(input signed[31:0]a,b,output signed [63:0] c);
	wire signed [31:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;
	wire signed [31:0] Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31;
	wire signed [31:0] m;
	wire signed [31:0] A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
	wire signed [31:0] A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31;
	wire signed[31:0] q0;
	wire qout;
	//initialize accu with 0
	booth_substep step1(32'h00000000,a,1'b0,b,A1,Q1,q0[1]);
	booth_substep step2(A1,Q1,q0[1],b,A2,Q2,q0[2]);
	booth_substep step3(A2,Q2,q0[2],b,A3,Q3,q0[3]);
	booth_substep step4(A3,Q3,q0[3],b,A4,Q4,q0[4]);
	booth_substep step5(A4,Q4,q0[4],b,A5,Q5,q0[5]);
	booth_substep step6(A5,Q5,q0[5],b,A6,Q6,q0[6]);
	booth_substep step7(A6,Q6,q0[6],b,A7,Q7,q0[7]);
	booth_substep step8(A7,Q7,q0[7],b,A8,Q8,q0[8]);
	booth_substep step9(A8,Q8,q0[8],b,A9,Q9,q0[9]);
	booth_substep step10(A9,Q9,q0[9],b,A10,Q10,q0[10]);
	booth_substep step11(A10,Q10,q0[10],b,A11,Q11,q0[11]);
	booth_substep step12(A11,Q11,q0[11],b,A12,Q12,q0[12]);
	booth_substep step13(A12,Q12,q0[12],b,A13,Q13,q0[13]);
	booth_substep step14(A13,Q13,q0[13],b,A14,Q14,q0[14]);
	booth_substep step15(A14,Q14,q0[14],b,A15,Q15,q0[15]);
	booth_substep step16(A15,Q15,q0[15],b,A16,Q16,q0[16]);
	booth_substep step17(A16,Q16,q0[16],b,A17,Q17,q0[17]);
	booth_substep step18(A17,Q17,q0[17],b,A18,Q18,q0[18]);
	booth_substep step19(A18,Q18,q0[18],b,A19,Q19,q0[19]);
	booth_substep step20(A19,Q19,q0[19],b,A20,Q20,q0[20]);
	booth_substep step21(A20,Q20,q0[20],b,A21,Q21,q0[21]);
	booth_substep step22(A21,Q21,q0[21],b,A22,Q22,q0[22]);
	booth_substep step23(A22,Q22,q0[22],b,A23,Q23,q0[23]);
	booth_substep step24(A23,Q23,q0[23],b,A24,Q24,q0[24]);
	booth_substep step25(A24,Q24,q0[24],b,A25,Q25,q0[25]);
	booth_substep step26(A25,Q25,q0[25],b,A26,Q26,q0[26]);
	booth_substep step27(A26,Q26,q0[26],b,A27,Q27,q0[27]);
	booth_substep step28(A27,Q27,q0[27],b,A28,Q28,q0[28]);
	booth_substep step29(A28,Q28,q0[28],b,A29,Q29,q0[29]);
	booth_substep step30(A29,Q29,q0[29],b,A30,Q30,q0[30]);
	booth_substep step31(A30,Q30,q0[30],b,A31,Q31,q0[31]);
	booth_substep step32(A31,Q31,q0[31],b,c[63:32],c[31:0],qout);
	
	 
endmodule



//booth substep
//based on Q[0] and q0 we will select the following
//00 or 11-no change in a
//01 then a=a+m
//10 then a=a-m
//then we will right shift pair of A_Q_q0
module booth_substep(input wire signed [31:0]a,Q,input wire signed q0,input wire signed [31:0] m,
							output signed [31:0] Anew,output signed [31:0] Qnew,output cq0);
							
	wire [31:0] addam,subam;
	wire [31:0] tAnew,t1;
	Adder myadd(a,m,addam);
	subtractor mysub(a,m,subam);
	multiplexer4to1_32bit sh1(tAnew,a,addam,subam,a,Q[0],q0);
	assign cq0=Q[0];
	shifter_32 sh11(Qnew,Q,2'b01,1'b0,tAnew[0]);
	shifter_32 sh21(Anew,tAnew,2'b01,1'b0,tAnew[31]);
endmodule 



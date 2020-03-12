`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:50:53 03/12/2020
// Design Name:   boothmul
// Module Name:   E:/bits/ACA/New folder/booth_multiplier/booth_tb.v
// Project Name:  booth_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: boothmul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module booth_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] c;

	// Instantiate the Unit Under Test (UUT)
	boothmul uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		$monitor($time,"       ",a," *",b," = ", c);
		// Initialize Inputs
		
		a = 32'h00000001;
		b = 32'h00000003;
		#10
		a = 32'h11110000;
		b = 32'h11110000;

		#10

		a = 32'h10010101;
		b = 32'h100000;

		#10

		a = 32'h0111;
		b = 32'h0;

		#10

		b = 32'h1;
		a = 32'h1;

		#10  

		a = 32'h00111100;
		b = 32'h0101;

		#10

		a = 32'h10101010;
		b = 32'h100011;

		#10

		a = 32'h010001;
		b = 32'h11100;

		#10
		a = 32'h1000;
		b = 32'h10111111;
		#10
		$finish;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

//一位加法器
module Add1
(
		input a,
		input b,
		input C_in,
		output f,
		output g,
		output p
		);
assign f=a^b^C_in;
assign g=a&b;
assign p=a|b;
endmodule
